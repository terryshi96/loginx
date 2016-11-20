# Loginx

##install
```
gem install loginx
```

##describe
```
login server quickly without entering password
help generate rsakey
help send publickey
```

```
all configurations are in yaml files and you can directly edit those config files
config dir
loginx/config/loginx.conf
save user and port
loginx/projects
save server infomation
```
###usage
```
loginx [project_name][server_alias]|[ip]

recommend configuring loginx alias---lx

```
###argvs
```
-L list all projects
-l [project_name] list all hosts in the project
-u [username] define user default root
-a [project_name][server_alias][ip]  add a record default project is default
-d [project_name][server_alias]  deleta a record
-p [port]  port default 22
-h/no argv  help

```
###improvement
```
add using [tab] to complete command
password should be encrypted
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/terryshi96/loginx. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

