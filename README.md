npmpack
=======

Two deadly simple bash scripts to help install npm modules offline.

Usage:

On online machine:

`./pack <package name>`

Copy the generated tar to the offline machine, then on it:

`./unpack <tar file name> [npm install options]`

Examples for install UglifyJs offline globally:

On online machine:

`./pack uglify-js`

On offline machine (root user):

`./unpack uglify-js.tar.gz --global --verbose`


The idea and strategy is from [https://github.com/arei/npmbox](https://github.com/arei/npmbox). To some extent I simply port the code to bash.

The most flaw of a bash version may be the unfriendliness to windows (though I think a port is easy). But it may be better than a node version for the following reasons:

* Even less overhead to bootstrap the process. Despite node and npm one need to install nothing.
* More flexible and easier to hack. Any additional arguments will be simply passed to `npm install` so the useful --global and --verbose are availble natuarally. And since the scripts are so simple, it is easy to change them to meet one's needs.

## NOTICE

Many node packages are very unfriendly to offline users and this tool cannot handle some additional attempt to get some stuffs from internet. for example:

* When installing the phantomjs package (needed by karma in my case) offline, it will try to download phantomjs binary directly from googlecode and I cannot get it recognize the local one. In cases like this a fake host may be useful (by simply change /etc/host).
* It seems that installing the ibrik package (needed by karma-coverage in my case) or anything using a "git+https" dependency offline is impossible.
