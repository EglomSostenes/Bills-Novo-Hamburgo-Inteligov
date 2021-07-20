# README

<h1> There are two ways to run the project on your machine </h1> </br> </br>

<h2> First way </h2> </br></br>

<h3> Getting Started (Assuming you have ruby, postgres e yarn installed) <h3> <br> <br>

1 - clone the project  </br>
2 - run bundle install </br>
3 - run yarn install </br>
4 - run rails:db:create and rails db:migrate </br>
5 - run rails s </br>
6 - Access the browser of your choice and type in the url "localhost:3000" </br></br></br>

<h2> Second way <h2> </br></br>

<h3> If you have docker and docker-compose installed on your machine </h3> </br></br>

1 - clone the project  </br>
2 - run at the root of the project "docker build -t bills_novo_hamburgo" </br>
3 - run at the root of the project "docker-compose run web rails db:setup" </br>
4 - run at the rails root of the project "docker-compose up" </br>
5 - Access the browser of your choice and type in the url "localhost:3000" </br></br></br>

<h2> Scrapping the bills </h2>

There is a task aided by gem whenever that executes the extraction of bills every day, </br>
but you can run the command on the console "ScrapingService.scrap_bills_novo_hamburgo" </br>
so you don't need to configure the cron. Caso rode a aplicação com o docker para </br> 
entrar no rails console digite "docker exec -it "id_container" rails console", where </br> 
"id_container" is the id of the container of the running project. To look at the </br> 
containers running on the machine just type "docker ps" </br>




