Provisioning renegade dev boxes for a better future.

# About

Build a fully fledged development environment that comes up in seconds.

It comes in the form of a vagrant image that runs arch linux with all
the conveniences setup.


# Requirements

- vagrant
- packer
- a key-pair
- make


# Setup

```bash
$ make
```


To make it easier to ssh into your new shiny box , you can add this section to
your `~/.ssh/config`

```
host renegade_arch
user renegade
HostName 192.168.123.123
IdentityFile ~/.ssh/id_rsa
```

Now you can ssh into your box whenever you want with:

```bash
$ ssh renegade_arch
```


# `user:password`s

```
root: renegade
renegade: renegade
vagrant: vagrant
```
