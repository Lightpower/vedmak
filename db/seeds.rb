# encoding: UTF-8
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
Page.delete_all

Page.create(
    id: 1,
    title: 'Уровень доступа: общий',
    body: '<p>Приветствуем вас во внутренней сети "Арзамас-16"!<br><br><p>Если у вас есть доступ к системе, воспользуйтесь <a href="/terminal">терминалом</a>.</p><p>Если у вас есть вопросы, попробуйте задать их по скайпу <b>lightpower_bva</b>.</p><input type="hidden" name="nube" value="123">')

Page.create(
    id: 2,
    title: 'Уровень доступа: ведьмак',
    body: '<p>Для вас есть письмо.</p>
<p>К каждому дню, включая этот и последующие, вы можете взять одну бесплатную подсказку по скайпу (указан на первой странице).<br>')

Page.create(
    id: 3,
    title: 'Уровень доступа: верховный ведьмак',
    body: '<p><b>Новости</b><br>
    <p>Новая программа тренировки ведьмаков уже загружена в <a href="../terminal/get?login=advanced&password=hgp7lb">терминал</a>.

<p><i>PS: не забывайте, что у вас есть одна бесплатная подсказка к этому дню.</i>')

puts "Paged: #{Page.all.map(&:title).join(', ')}"
