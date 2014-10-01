@echo off

rem echo Running Authentication Feature
rem call bundle exec cucumber ..\features\authentication.feature -r .\features\step_definitions\authentication.feature.rb

rem echo Running Downloads Feature
rem call bundle exec cucumber ..\features\downloads.feature -r .\features\step_definitions\downloads.feature.rb

rem echo Running Images Feature
rem call bundle exec cucumber ..\features\images.feature -r .\features\step_definitions\images.feature.rb

echo Running Image Search Feature
call bundle exec cucumber ..\features\ImageSearch.feature -r .\features\step_definitions\ImageSearch.feature.rb

rem echo Running Search Paging Feature
rem call bundle exec cucumber ..\features\searchPaging.feature -r .\features\step_definitions\searchPaging.feature.rb
