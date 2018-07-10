import 'package:stencil/stencil.dart';

String render(
        {bool hasNexus: false, bool hasGalaxy: false, bool hasIPhone: false}) =>
    '''
<html>
  <head>
    <title>Shopping cart</title>
    <style>
      html, body {
        font-size: 20px;
      }
      
      .item-name {
        min-width: 200px;
        display: inline-block;
      }
      
      .action {
        text-decoration: none;
      }
    </style>
  </head>
  <body>
    <div>
      <div>
        <input type="checkbox" disabled onclick="return false;" ${hasNexus?'checked':''}>
        <span class="item-name">Nexus 6P</span>
        ${when(hasNexus,
          '<a href="/cart/remove/nexus" class="action">&#128465;</a>',
          '<a href="/cart/add/nexus" class="action">+</a>')}
      </div>
      
      <div>
        <input type="checkbox" disabled onclick="return false;" ${hasGalaxy?'checked':''}>
        <span class="item-name">Galaxy S8</span>
        ${when(hasGalaxy,
          '<a href="/cart/remove/galaxy" class="action">&#128465;</a>',
          '<a href="/cart/add/galaxy" class="action">+</a>')}
      </div>
      
      <div>
        <input type="checkbox" disabled onclick="return false;" ${hasIPhone?'checked':''}>
        <span class="item-name">iPhone 8</span>
        ${when(hasIPhone,
          '<a href="/cart/remove/iphone" class="action">&#128465;</a>',
          '<a href="/cart/add/iphone" class="action">+</a>')}
      </div>
    </div>
  </body>
</html>  
  ''';
