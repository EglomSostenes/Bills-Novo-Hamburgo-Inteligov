# README

Getting Started (Assuming you have ruby, postgres e yarn installed)

1 - clone the project
2 - run bundle install
3 - run yarn install
4 - run rails:db:create and rails db:migrate
5 - rails s

Scrapping the bills

There is a task aided by gem whenever that executes the extraction of bills every day,
but you can run the command on the console "ScrapingService.scrap_bills_novo_hamburgo" 
so you don't need to configure the cron.




