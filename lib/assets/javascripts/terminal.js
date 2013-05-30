//= require termlib
//= require termlib_parser
//= require termlib_invaders

$(function() {
  var authKey;

  var sendAuth = function(login, password, term) {
    $.ajax({
      url: '/terminal/login/',
      type: 'post',
      dataType: 'json',
      data: {
        login: login,
        pass:  password
      },
      success: function(data) {
        term.newLine();
        term.write(data.message);
        authKey = data.auth;
        term.prompt();
      },
      error: function(data) {
        if (data.status == 403) {
          term.newLine();
          term.write("Login or password are incorrect");
          term.prompt();
        } else {
          term.newLine();
          term.write("Unknown error, try again later or contact matrix master");
          term.prompt();
        }
      }
    });
  };

  var sendCommand = function(command, term) {
    $.ajax({
      url: '/terminal/command/',
      type: 'post',
      dataType: 'text',
      data: {
        auth: authKey,
        command: command
      },
      success: function(data) {
        term.newLine();
        term.write(data);
        term.prompt();
      },
      error: function(data) {
        if (data.status == 403) {
          authKey = null;
        } else {
          term.newLine();
          term.write("Network error");
          term.prompt();
        }
      }
    });
  };

  var termHandler = function() {
    var parser = new Parser();
    parser.parseLine(this);

    if (authKey) {
      this.newLine();

      if (this.argv[0] == 'exit') {
        authKey = null;
        this.newLine();
        this.write("Enter `login <username> <password>` for login");
        this.prompt();
      } else if (this.argv[0] == 'yes') {
        TermlibInvaders.start(this);
      } else {
        sendCommand(this.argv.join(' '), this);
      }
    } else {
      if (this.argv[0] == 'login') {
        sendAuth(this.argv[1], this.argv[2], this);
      } else {
        this.newLine();
        this.write("Enter `login <username> <password>` for login");
        this.prompt();
      }
    }
  };

  var term = new Terminal({
    termDiv: 'termDiv',
    greeting: 'Enter `login <username> <password>` for login',
    handler: termHandler,
    rows: 32
  });
  term.open();
});