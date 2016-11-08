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
config dir
~/.loginx/loginx.conf
save user and path to publickey
~/.lobinx/projects/default
save server infomation
```
###usage
```
lx [project_name][server_alias]|[ip]

if no project_name default project is default
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

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/loginx. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

