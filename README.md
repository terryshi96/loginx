# Loginx

Loginx 可以帮助我们方便登录到一组不同项目锁关联的服务器上。

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
~/.loginx/config/loginx.conf
save user and port
~/.loginx/projects
save server infomation
```
### usage

```
loginx [project_name][server_alias]|[ip]

recommend configuring loginx alias---lx

```

### argvs

```
-L list all projects
-l [project_name] list all hosts in the project
-u [username] define user default root
-a [project_name][server_alias][ip][password] add a record default project is default
-d [project_name][server_alias]  deleta a record
-p [port]  port default 22
-h/no argv  help

```

### improvement

```
add using [tab] to complete command
password should be encrypted
```

## 开发细节

通过 [`methadone`](https://github.com/davetron5000/methadone) 创建 Ruby 命令行应用，然后，通过 [`ruby_expect`](https://github.com/abates/ruby_expect) 执行在服务器上的远程的命令。

>PS: expect 是一个比较的小众的可以访问和操作服务器的语言 ，具体的操作，可以参考: http://bbs.yundianjia.net/d/223-expect



## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/terryshi96/loginx. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).