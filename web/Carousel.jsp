<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>CodePen - Dual Slideshow Demo</title>
        <link href='https://rawgit.com/Reklino/gromlicons/master/style.css' rel='stylesheet' type='text/css'>
        <script src="//use.typekit.net/wvm8nty.js"></script>
        <script>try {
                Typekit.load();
            } catch (e) {
            }</script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel="stylesheet" href="css/carousel.css">

    </head>

    <body>
        <!-- partial:index.partial.html -->
        <!-- info pulled from http://10mosttoday.com/10-most-beautiful-forests-in-the-world/ -->

    <body ng-app='app' ng-controller='MainController'>
        <main id='main' style="
              padding-right: 0;
              ">
            <section id='one'>
                <div class='pane' ng-repeat='forest in forests track by $index' ng-if="$index == active">
                    <main>
                        <h1 ng-style="{'background-image' : 'url(' + forest.img + ')'}">{{ forest.rank}}</h1>
                    </main>
                    <div class="bg" ng-style="{'background-image' : 'url(' + forest.img + ')'}"></div>
                </div>
            </section>
            <section id='two'>
                <div class='pane' ng-repeat='forest in forests track by $index' ng-class="{ 'active' : $index == active }"
                     ng-if="$index == active">
                    <main>
                        <h2>{{ forest.name}}</h2>
                        <p>{{ forest.desc}}</p>
                        <p class='sub'>{{ forest.location}}</p>
                    </main>
                </div>
            </section>
        </main>
        <nav id='nav'>
            <ul>
                <li class="previous" ng-show="active > 0">
                    <a href='#' ng-click="previous()">
                        <span class='icon icon_arrow-left'></span>
                    </a>
                </li>
                <li class='numbers'>
                    <a href='#' ng-repeat="forest in forests track by $index" ng-click="setActive($index)"
                       ng-class="{'active' : $index == active}">
                        {{ $index + 1}}
                    </a>
                </li>
                <li class="next" ng-show="active + 1 < forests.length">
                    <a href='#' ng-click="next()">
                        <span class='icon icon_arrow-right'></span>
                    </a>
                </li>
            </ul>
        </nav>
        <div id="preloader">
            <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/130891/sagano.jpg" alt="" />
            <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/130891/sequoia.jpg" alt="" />
            <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/130891/redwoods.jpg" alt="" />
            <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/130891/black-forest.jpg" alt="" />
            <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/130891/crooked-forest.jpg" alt="" />
        </div>
    </body>
    <!-- partial -->
    <script src='https://ajax.googleapis.com/ajax/libs/angularjs/1.3.2/angular.min.js'></script>
    <script src='https://cdn.rawgit.com/chieffancypants/angular-hotkeys/master/build/hotkeys.min.js'></script>
    <script src='https://ajax.googleapis.com/ajax/libs/angularjs/1.3.2/angular-animate.js'></script>
    <script src="js/slider.js"></script>
</body>
</html>