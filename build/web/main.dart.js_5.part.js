((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,B,C,E,A={
buF(){return new b.G.XMLHttpRequest()},
buI(){return b.G.document.createElement("img")},
bgS(d,e,f){var x=new A.abF(d,B.h([],y.v),B.h([],y.l),B.h([],y.u))
x.Wj(d,e,f)
return x},
RS:function RS(d,e,f,g){var _=this
_.a=d
_.b=e
_.c=f
_.d=g},
asF:function asF(d,e,f){this.a=d
this.b=e
this.c=f},
asG:function asG(d,e){this.a=d
this.b=e},
asD:function asD(d,e,f){this.a=d
this.b=e
this.c=f},
asE:function asE(d,e,f){this.a=d
this.b=e
this.c=f},
abF:function abF(d,e,f,g){var _=this
_.y=d
_.z=!1
_.Q=$
_.as=!1
_.at=$
_.a=e
_.b=f
_.e=_.d=_.c=null
_.f=!1
_.r=0
_.w=!1
_.x=g},
aC7:function aC7(d){this.a=d},
aC8:function aC8(d,e){this.a=d
this.b=e},
aC9:function aC9(d){this.a=d},
aCa:function aCa(d){this.a=d},
aCb:function aCb(d){this.a=d},
SX:function SX(d,e){this.a=d
this.b=e},
bpO(d,e){return new A.RT("HTTP request failed, statusCode: "+d+", "+e.j(0))},
azd:function azd(d,e){this.a=d
this.b=e},
RT:function RT(d){this.b=d},
bpR(d,e){var x=new A.a6k(B.h([],y.v),B.h([],y.l),B.h([],y.u))
x.W5(d,e)
return x},
a6k:function a6k(d,e,f){var _=this
_.a=d
_.b=e
_.e=_.d=_.c=null
_.f=!1
_.r=0
_.w=!1
_.x=f},
asQ:function asQ(d,e){this.a=d
this.b=e},
bnf(){return new A.Oo(null)},
Vh:function Vh(d,e,f,g,h){var _=this
_.c=d
_.d=e
_.e=f
_.f=g
_.a=h},
ajL:function ajL(){},
ajM:function ajM(d){this.a=d},
Oo:function Oo(d){this.a=d}},D
J=c[1]
B=c[0]
C=c[2]
E=c[10]
A=a.updateHolder(c[4],A)
D=c[13]
A.RS.prototype={
w9(d){return new B.ca(this,y.i)},
r4(d,e){return A.bgS(this.p_(d,e),d.a,null)},
r5(d,e){return A.bgS(this.p_(d,e),d.a,null)},
p_(d,e){return this.a1r(d,e)},
a1r(d,e){var x=0,w=B.S(y.R),v,u=2,t=[],s=this,r,q,p,o,n
var $async$p_=B.O(function(f,g){if(f===1){t.push(g)
x=u}while(true)switch(x){case 0:p=new A.asF(s,e,d)
o=new A.asG(s,d)
case 3:switch(s.d.a){case 0:x=5
break
case 2:x=6
break
case 1:x=7
break
default:x=4
break}break
case 5:v=p.$0()
x=1
break
case 6:v=o.$0()
x=1
break
case 7:u=9
x=12
return B.V(p.$0(),$async$p_)
case 12:r=g
v=r
x=1
break
u=2
x=11
break
case 9:u=8
n=t.pop()
r=o.$0()
v=r
x=1
break
x=11
break
case 8:x=2
break
case 11:x=4
break
case 4:case 1:return B.Q(v,w)
case 2:return B.P(t.at(-1),w)}})
return B.R($async$p_,w)},
pf(d){var x=0,w=B.S(y.p),v,u=this,t,s,r,q,p,o,n
var $async$pf=B.O(function(e,f){if(e===1)return B.P(f,w)
while(true)switch(x){case 0:s=u.a
r=B.ayS().W(s)
q=new B.ak($.af,y.Z)
p=new B.bp(q,y.x)
o=A.buF()
o.open("GET",s,!0)
o.responseType="arraybuffer"
o.addEventListener("load",B.Jd(new A.asD(o,p,r)))
o.addEventListener("error",B.Jd(new A.asE(p,o,r)))
o.send()
x=3
return B.V(q,$async$pf)
case 3:s=o.response
s.toString
t=B.aP1(y.a.a(s),0,null)
if(t.byteLength===0)throw B.l(A.bpO(B.D(o,"status"),r))
n=d
x=4
return B.V(B.ao3(t),$async$pf)
case 4:v=n.$1(f)
x=1
break
case 1:return B.Q(v,w)}})
return B.R($async$pf,w)},
k(d,e){if(e==null)return!1
if(J.W(e)!==B.y(this))return!1
return e instanceof A.RS&&e.a===this.a&&e.b===this.b},
gq(d){return B.U(this.a,this.b,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a)},
j(d){return'NetworkImage("'+this.a+'", scale: '+C.x.Y(this.b,1)+")"}}
A.abF.prototype={
Wj(d,e,f){var x=this
x.e=e
x.y.di(new A.aC7(x),new A.aC8(x,f),y.P)},
gPt(){var x=this,w=x.at
return w===$?x.at=new B.eq(new A.aC9(x),new A.aCa(x),new A.aCb(x)):w},
Dm(){var x,w=this
if(w.z){x=w.Q
x===$&&B.e()
x.K(w.gPt())}w.as=!0
w.T0()}}
A.SX.prototype={
B5(){return new A.SX(this.a,this.b)},
l(){},
gd2(){return B.a0(B.bm("Could not create image data for this image because access to it is restricted by the Same-Origin Policy.\nSee https://developer.mozilla.org/en-US/docs/Web/Security/Same-origin_policy"))},
goH(){return 1},
gFh(){var x=this.a
return C.n.eR(4*x.naturalWidth*x.naturalHeight)},
$ieo:1,
gjo(){return this.b}}
A.azd.prototype={
H(){return"WebHtmlElementStrategy."+this.b}}
A.RT.prototype={
j(d){return this.b},
$ibL:1}
A.a6k.prototype={
W5(d,e){d.di(this.gS2(),new A.asQ(this,e),y.H)}}
A.Vh.prototype={
L(d){var x=this,w=null,v=B.bfI(w,w,new A.RS(x.e,1,w,D.Qr)),u=B.du(x.c,w)
return B.MJ(w,new B.Lh(v,new A.ajL(),36,36,w,w),new A.ajM(x),B.du(x.d,w),u,w)}}
A.Oo.prototype={
L(d){var x,w=null,v=B.Z(d).ok.w
v.toString
v=B.MJ(w,D.Cg,w,w,B.du("Contribution to Open Source",v),w)
x=B.Z(d).a6.y
x=x==null?w:x.W(d.ab(y.I).w).a
return B.UP(B.Ol(B.h([v,E.akr(x==null?16:x),D.AQ,D.AR],y.D),C.b5,C.aJ),w)}}
var z=a.updateTypes([])
A.asF.prototype={
$0(){var x=0,w=B.S(y.R),v,u=this,t,s,r
var $async$$0=B.O(function(d,e){if(d===1)return B.P(e,w)
while(true)switch(x){case 0:t=u.c
s=B
r=B
x=3
return B.V(u.a.pf(u.b),$async$$0)
case 3:v=s.aKy(r.cw(e,y.p),t.a,null,t.b)
x=1
break
case 1:return B.Q(v,w)}})
return B.R($async$$0,w)},
$S:158}
A.asG.prototype={
$0(){var x=0,w=B.S(y.R),v,u=this,t,s,r
var $async$$0=B.O(function(d,e){if(d===1)return B.P(e,w)
while(true)switch(x){case 0:s=A.buI()
r=u.b.a
s.src=r
x=3
return B.V(B.dM(s.decode(),y.X),$async$$0)
case 3:t=A.bpR(B.cw(new A.SX(s,r),y.J),null)
t.e=r
v=t
x=1
break
case 1:return B.Q(v,w)}})
return B.R($async$$0,w)},
$S:158}
A.asD.prototype={
$1(d){var x=this.a,w=x.status,v=w>=200&&w<300,u=w>307&&w<400,t=v||w===0||w===304||u,s=this.b
if(t)s.dC(x)
else s.kq(new A.RT("HTTP request failed, statusCode: "+B.n(w)+", "+this.c.j(0)))},
$S:33}
A.asE.prototype={
$1(d){return this.a.kq(new A.RT("HTTP request failed, statusCode: "+B.n(this.b.status)+", "+this.c.j(0)))},
$S:2}
A.aC7.prototype={
$1(d){var x=this.a
x.z=!0
if(x.as){d.pB()
return}x.Q!==$&&B.bj()
x.Q=d
d.a3(x.gPt())},
$S:484}
A.aC8.prototype={
$2(d,e){this.a.mf(B.bb("resolving an image stream completer"),d,this.b,!0,e)},
$S:16}
A.aC9.prototype={
$2(d,e){this.a.xp(d)},
$S:104}
A.aCa.prototype={
$1(d){this.a.acZ(d)},
$S:111}
A.aCb.prototype={
$2(d,e){this.a.acY(d,e)},
$S:485}
A.asQ.prototype={
$2(d,e){this.a.mf(B.bb("resolving a single-frame image stream"),d,this.b,!0,e)},
$S:16}
A.ajL.prototype={
$3(d,e,f){return e},
$S:486}
A.ajM.prototype={
$0(){return B.M8(this.a.f)},
$S:1};(function inheritance(){var x=a.inherit,w=a.inheritMany
x(A.RS,B.ep)
w(B.L6,[A.asF,A.asG,A.ajM])
w(B.Ig,[A.asD,A.asE,A.aC7,A.aCa,A.ajL])
w(B.dD,[A.abF,A.a6k])
w(B.L7,[A.aC8,A.aC9,A.aCb,A.asQ])
w(B.G,[A.SX,A.RT])
x(A.azd,B.a_C)
w(B.aw,[A.Vh,A.Oo])})()
B.Qt(b.typeUniverse,JSON.parse('{"RS":{"ep":["aKD"],"ep.T":"aKD"},"abF":{"dD":[]},"SX":{"eo":[]},"aKD":{"ep":["aKD"]},"RT":{"bL":[]},"a6k":{"dD":[]},"Vh":{"aw":[],"k":[]},"Oo":{"aw":[],"k":[]}}'))
var y=(function rtii(){var x=B.a5
return{p:x("dz"),I:x("dO"),J:x("eo"),R:x("dD"),v:x("B<eq>"),D:x("B<k>"),u:x("B<~()>"),l:x("B<~(G,bV?)>"),a:x("MO"),P:x("aL"),i:x("ca<RS>"),x:x("bp<as>"),Z:x("ak<as>"),X:x("G?"),H:x("~")}})();(function constants(){D.AQ=new A.Vh("k2-fsa/icefall","icefall contains ASR recipes for various datasets using https://github.com/k2-fsa/k2.","https://raw.githubusercontent.com/k2-fsa/icefall/master/docs/source/_static/logo.png","https://github.com/k2-fsa/icefall",null)
D.AR=new A.Vh("lhotse-speech/lhotse","Lhotse is a Python library aiming to make speech and audio data preparation flexible and accessible to a wider community. Alongside k2, it is a part of the next generation Kaldi speech processing library.","https://raw.githubusercontent.com/lhotse-speech/lhotse/master/docs/logo.png","https://github.com/lhotse-speech/lhotse",null)
D.C7=new B.en(57718,"MaterialIcons",!1)
D.Cg=new B.Js(D.C7,null,null)
D.Qr=new A.azd(0,"never")})()};
(a=>{a["0yoRgVykzu+K2PlaW0AxjNQR3Cs="]=a.current})($__dart_deferred_initializers__);
//# sourceMappingURL=main.dart.js_5.part.js.map
