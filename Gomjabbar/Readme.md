#GOM JABBAR

###Description:

Imagina que estamos implementando una tienda online:

La tienda vende estos productos:

| Codigo | Nombre       | Precio  |
|:------:|--------------|--------:|
| KR     | Kryptonita   | 3.14    |
| ME     | Melange      | 42      |
| UN     | Unobtainium  | 999     |

El departamento de marketing es fan de las promociones de tipo 2x1 (si compras dos productos iguales, uno de ellos es gratis). Y quiere que haya un descuento de este tipo en Kryptonita.

El CEO cree que lo mejor para aumentar las ventas es agregar descuentos por cantidad (al comprar x de un mismo producto, el precio por unidad baja). Y quiere que al comprar 3 o mas Melanges, el precio por unidad sea de 33.33€.

El carrito permite agregar los productos en cualquier orden y debe devolver el total de la compra.

La interfaz de uso del carrito es asi:
```
    co = Cart.new(pricing_rules)
    co.add(item)
    co.add(item)
    price = co.total
```
Implementa el proceso de checkout que cumpla con estos requerimientos.
Debes usar como lenguaje ruby y puedes utilizar las gemas o componentes que
necesites.

Ejemplos:

Items: KR,ME,KR,KR,UN Precio total esperado: 1047.28

Items: KR,KR Precio total esperado: 3.14

Items: ME,ME,KR,ME Precio total esperado: 103.13

###My solution

Run `rspec spec/gom_jabbar_spec.rb --format documentation` to prove it's working

Run `rspec -format documentation` to see the solution

Comments are welcome!
