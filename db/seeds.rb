# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Users
User.delete_all
User.create(email: 'geralt@ukr.net', password: 'dTbwEfj62Y4j*9', password_confirmation: 'dTbwEfj62Y4j*9')
User.create(email: 'vesemir@ukr.net', password: 'B353M1p*M0JI0g3W!', password_confirmation: 'B353M1p*M0JI0g3W!')
puts "Users: #{User.all.map(&:email).join(', ')}"

# Pages
Page.create(
    title: 'Уровень доступа: общий',
    body: '<p>Приветствуем вас во внутренней сети "Арзамас-16"!<br><br><p>Если у вас есть доступ к системе, воспользуйтесь <a href="/terminal">терминалом</a>.</p><p>Если у вас есть вопросы, попробуйте задать их по скайпу <b>lightpower_bva</b>.</p><input type="hidden" name="nube" value="123">')
Page.create(
    title: 'Уровень доступа: ведьмак',
    body: '<p>Для вас есть письмо.</p>
<p>К каждому дню, включая этот и последующие, вы можете взять одну бесплатную подсказку по скайпу (указан на первой странице).<br>

<p><ul><lh><b>Немного полезной информации для этого задания</b></lh><br>
<li>В следующий раз, когда вам понадобятся логин и пароль, вспомните о взломе Тринити</li>
<li>Не листайте закладки дальше Application</li>
<li>Терминал вам сегодня не пригодится</li>
</ul>')
