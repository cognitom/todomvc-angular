# AngularJS TodoMVC Example with Browserify and CoffeeScript

> HTML is great for declaring static documents, but it falters when we try to use it for declaring dynamic views in web-applications. AngularJS lets you extend HTML vocabulary for your application. The resulting environment is extraordinarily expressive, readable, and quick to develop.

> _[AngularJS - angularjs.org](http://angularjs.org)_


## Getting started

0. Clone or download this repo.
0. Install dependencies: `$ npm install`
0. Start local server and watch: `$ npm start`


## Learning AngularJS
The [AngularJS website](http://angularjs.org) is a great resource for getting started.

Here are some links you may find helpful:

* [Tutorial](http://docs.angularjs.org/tutorial)
* [API Reference](http://docs.angularjs.org/api)
* [Developer Guide](http://docs.angularjs.org/guide)
* [Applications built with AngularJS](http://builtwith.angularjs.org)
* [Blog](http://blog.angularjs.org)
* [FAQ](http://docs.angularjs.org/misc/faq)
* [AngularJS Meetups](http://www.youtube.com/angularjs)

Articles and guides from the community:

* [Code School AngularJS course](https://www.codeschool.com/courses/shaping-up-with-angular-js)
* [5 Awesome AngularJS Features](http://net.tutsplus.com/tutorials/javascript-ajax/5-awesome-angularjs-features)
* [Using Yeoman with AngularJS](http://briantford.com/blog/angular-yeoman.html)
* [me&ngular - an introduction to MVW](http://stephenplusplus.github.io/meangular)

Get help from other AngularJS users:

* [Walkthroughs and Tutorials on YouTube](http://www.youtube.com/playlist?list=PL1w1q3fL4pmgqpzb-XhG7Clgi67d_OHXz)
* [Google Groups mailing list](https://groups.google.com/forum/?fromgroups#!forum/angular)
* [angularjs on Stack Overflow](http://stackoverflow.com/questions/tagged/angularjs)
* [AngularJS on Twitter](https://twitter.com/angularjs)
* [AngularjS on Google +](https://plus.google.com/+AngularJS/posts)

_If you have other helpful links to share, or find any of the links above no longer work, please [let us know](https://github.com/tastejs/todomvc/issues)._


## Implementation
The normal AngularJS TodoMVC implementation performs deep watching of the todos array object. This means that it keeps an in-memory copy of the complete array that is used for dirty checking in order to detect model mutations. For smaller applications such as TodoMVC, this is completely fine as one trades off a little memory and performance for the sake of simplicity.

In larger more complex applications however, where one might be working with 100s or 1000s of large objects one definitely should avoid using this approach. This implementation of the AngularJS app demonstrates the correct way to approach this problem when working in larger apps.
