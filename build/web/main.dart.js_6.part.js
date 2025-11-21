((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,B,C,E,F,A={
aEi(){return new b.G.XMLHttpRequest()},
aEk(){return b.G.document.createElement("img")},
aqv(d,e,f){var x=new A.M2(d,B.c([],y.v),B.c([],y.l),B.c([],y.u))
x.Xk(d,e,f)
return x},
pT:function pT(d,e,f,g){var _=this
_.a=d
_.b=e
_.c=f
_.d=g},
a1X:function a1X(d,e,f){this.a=d
this.b=e
this.c=f},
a1Y:function a1Y(d,e){this.a=d
this.b=e},
a1V:function a1V(d,e,f){this.a=d
this.b=e
this.c=f},
a1W:function a1W(d,e,f){this.a=d
this.b=e
this.c=f},
M2:function M2(d,e,f,g){var _=this
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
abF:function abF(d){this.a=d},
abG:function abG(d,e){this.a=d
this.b=e},
abH:function abH(d){this.a=d},
abI:function abI(d){this.a=d},
abJ:function abJ(d){this.a=d},
qX:function qX(d,e){this.a=d
this.b=e},
azw(d,e){return new A.pU("HTTP request failed, statusCode: "+d+", "+e.k(0))},
a8H:function a8H(d,e){this.a=d
this.b=e},
pU:function pU(d){this.b=d},
azz(d,e){var x=new A.GB(B.c([],y.v),B.c([],y.l),B.c([],y.u))
x.X7(d,e)
return x},
GB:function GB(d,e,f){var _=this
_.a=d
_.b=e
_.e=_.d=_.c=null
_.f=!1
_.r=0
_.w=!1
_.x=f},
a27:function a27(d,e){this.a=d
this.b=e},
ax_(){return new A.mm(null)},
uj:function uj(d,e,f,g,h){var _=this
_.c=d
_.d=e
_.e=f
_.f=g
_.a=h},
Uf:function Uf(){},
Ug:function Ug(d){this.a=d},
mm:function mm(d){this.a=d}},D
J=c[1]
B=c[0]
C=c[2]
E=c[8]
F=c[10]
A=a.updateHolder(c[4],A)
D=c[13]
A.pT.prototype={
wq(d){return new B.cb(this,y.i)},
rg(d,e){return A.aqv(this.pm(d,e),d.a,null)},
rh(d,e){return A.aqv(this.pm(d,e),d.a,null)},
pm(d,e){return this.a2D(d,e)},
a2D(d,e){var x=0,w=B.M(y.R),v,u=2,t=[],s=this,r,q,p,o,n
var $async$pm=B.N(function(f,g){if(f===1){t.push(g)
x=u}for(;;)switch(x){case 0:p=new A.a1X(s,e,d)
o=new A.a1Y(s,d)
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
return B.R(p.$0(),$async$pm)
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
case 4:case 1:return B.K(v,w)
case 2:return B.J(t.at(-1),w)}})
return B.L($async$pm,w)},
pz(d){var x=0,w=B.M(y.p),v,u=this,t,s,r,q,p,o,n
var $async$pz=B.N(function(e,f){if(e===1)return B.J(f,w)
for(;;)switch(x){case 0:s=u.a
r=E.a8k().V(s)
q=new B.ak($.af,y.Z)
p=new B.bk(q,y.x)
o=A.aEi()
o.open("GET",s,!0)
o.responseType="arraybuffer"
o.addEventListener("load",B.h4(new A.a1V(o,p,r)))
o.addEventListener("error",B.h4(new A.a1W(p,o,r)))
o.send()
x=3
return B.R(q,$async$pz)
case 3:s=o.response
s.toString
t=B.aoH(y.a.a(s),0,null)
if(t.byteLength===0)throw B.h(A.azw(B.B(o,"status"),r))
n=d
x=4
return B.R(B.Yl(t),$async$pz)
case 4:v=n.$1(f)
x=1
break
case 1:return B.K(v,w)}})
return B.L($async$pz,w)},
j(d,e){var x=this
if(e==null)return!1
if(J.S(e)!==B.u(x))return!1
return e instanceof A.pT&&e.a===x.a&&e.b===x.b&&e.d===x.d&&B.lY(e.c,x.c)},
gt(d){var x=this
return B.O(x.a,x.b,x.d,x.c,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a)},
k(d){var x=this
return'NetworkImage("'+x.a+'", scale: '+C.h.a_(x.b,1)+", webHtmlElementStrategy: "+x.d.b+", headers: "+B.i(x.c)+")"}}
A.M2.prototype={
Xk(d,e,f){var x=this
x.e=e
x.y.dv(new A.abF(x),new A.abG(x,f),y.P)},
gQh(){var x=this,w=x.at
return w===$?x.at=new B.ev(new A.abH(x),new A.abI(x),new A.abJ(x)):w},
DR(){var x,w=this
if(w.z){x=w.Q
x===$&&B.a()
x.K(w.gQh())}w.as=!0
w.TX()}}
A.qX.prototype={
Bu(){return new A.qX(this.a,this.b)},
l(){},
gdc(){return B.X(B.bj("Could not create image data for this image because access to it is restricted by the Same-Origin Policy.\nSee https://developer.mozilla.org/en-US/docs/Web/Security/Same-origin_policy"))},
gp_(){return 1},
gFM(){var x=this.a
return C.d.f8(4*x.naturalWidth*x.naturalHeight)},
$iet:1,
gjD(){return this.b}}
A.a8H.prototype={
G(){return"WebHtmlElementStrategy."+this.b}}
A.pU.prototype={
k(d){return this.b},
$ibF:1}
A.GB.prototype={
X7(d,e){d.dv(this.gSX(),new A.a27(this,e),y.H)}}
A.uj.prototype={
L(d){var x=this,w=null,v=B.api(w,w,new A.pT(x.e,1,w,D.QP)),u=B.cQ(x.c,w)
return B.jp(w,new B.jh(v,new A.Uf(),36,36,w,w),new A.Ug(x),B.cQ(x.d,w),u,w)}}
A.mm.prototype={
L(d){var x,w=null,v=B.W(d).ok.w
v.toString
v=B.jp(w,D.Cv,w,w,B.cQ("Contribution to Open Source",v),w)
x=B.W(d).a6.y
x=x==null?w:x.V(d.aa(y.I).w).a
return B.tV(B.kq(B.c([v,F.UU(x==null?16:x),D.B0,D.B1],y.D),C.aZ,C.as,C.aR),w)}}
var z=a.updateTypes([])
A.a1X.prototype={
$0(){var x=0,w=B.M(y.R),v,u=this,t,s,r
var $async$$0=B.N(function(d,e){if(d===1)return B.J(e,w)
for(;;)switch(x){case 0:t=u.c
s=B
r=B
x=3
return B.R(u.a.pz(u.b),$async$$0)
case 3:v=s.akn(r.da(e,y.p),t.a,null,t.b)
x=1
break
case 1:return B.K(v,w)}})
return B.L($async$$0,w)},
$S:94}
A.a1Y.prototype={
$0(){var x=0,w=B.M(y.R),v,u=this,t,s,r
var $async$$0=B.N(function(d,e){if(d===1)return B.J(e,w)
for(;;)switch(x){case 0:s=A.aEk()
r=u.b.a
s.src=r
x=3
return B.R(B.dy(s.decode(),y.X),$async$$0)
case 3:t=A.azz(B.da(new A.qX(s,r),y.J),null)
t.e=r
v=t
x=1
break
case 1:return B.K(v,w)}})
return B.L($async$$0,w)},
$S:94}
A.a1V.prototype={
$1(d){var x=this.a,w=x.status,v=w>=200&&w<300,u=w>307&&w<400,t=v||w===0||w===304||u,s=this.b
if(t)s.dT(x)
else s.kA(new A.pU("HTTP request failed, statusCode: "+B.i(w)+", "+this.c.k(0)))},
$S:29}
A.a1W.prototype={
$1(d){return this.a.kA(new A.pU("HTTP request failed, statusCode: "+B.i(this.b.status)+", "+this.c.k(0)))},
$S:1}
A.abF.prototype={
$1(d){var x=this.a
x.z=!0
if(x.as){d.pW()
return}x.Q!==$&&B.bg()
x.Q=d
d.a2(x.gQh())},
$S:485}
A.abG.prototype={
$2(d,e){this.a.my(B.ba("resolving an image stream completer"),d,this.b,!0,e)},
$S:22}
A.abH.prototype={
$2(d,e){this.a.xI(d)},
$S:118}
A.abI.prototype={
$1(d){this.a.aek(d)},
$S:110}
A.abJ.prototype={
$2(d,e){this.a.aej(d,e)},
$S:486}
A.a27.prototype={
$2(d,e){this.a.my(B.ba("resolving a single-frame image stream"),d,this.b,!0,e)},
$S:22}
A.Uf.prototype={
$3(d,e,f){return e},
$S:487}
A.Ug.prototype={
$0(){return B.ka(this.a.f)},
$S:0};(function inheritance(){var x=a.inherit,w=a.inheritMany
x(A.pT,B.eu)
w(B.j5,[A.a1X,A.a1Y,A.Ug])
w(B.eM,[A.a1V,A.a1W,A.abF,A.abI,A.Uf])
w(B.dF,[A.M2,A.GB])
w(B.hW,[A.abG,A.abH,A.abJ,A.a27])
w(B.C,[A.qX,A.pU])
x(A.a8H,B.rd)
w(B.ar,[A.uj,A.mm])})()
B.ot(b.typeUniverse,JSON.parse('{"pT":{"eu":["aks"],"eu.T":"aks"},"M2":{"dF":[]},"qX":{"et":[]},"aks":{"eu":["aks"]},"pU":{"bF":[]},"GB":{"dF":[]},"uj":{"ar":[],"f":[]},"mm":{"ar":[],"f":[]}}'))
var y=(function rtii(){var x=B.a1
return{p:x("dB"),I:x("dP"),J:x("et"),R:x("dF"),v:x("w<ev>"),D:x("w<f>"),u:x("w<~()>"),l:x("w<~(C,bU?)>"),a:x("kS"),P:x("aI"),i:x("cb<pT>"),x:x("bk<am>"),Z:x("ak<am>"),X:x("C?"),H:x("~")}})();(function constants(){D.B0=new A.uj("k2-fsa/icefall","icefall contains ASR recipes for various datasets using https://github.com/k2-fsa/k2.","https://raw.githubusercontent.com/k2-fsa/icefall/master/docs/source/_static/logo.png","https://github.com/k2-fsa/icefall",null)
D.B1=new A.uj("lhotse-speech/lhotse","Lhotse is a Python library aiming to make speech and audio data preparation flexible and accessible to a wider community. Alongside k2, it is a part of the next generation Kaldi speech processing library.","https://raw.githubusercontent.com/lhotse-speech/lhotse/master/docs/logo.png","https://github.com/lhotse-speech/lhotse",null)
D.Cm=new B.e3(57718,"MaterialIcons",!1)
D.Cv=new B.fF(D.Cm,null,null,null)
D.QP=new A.a8H(0,"never")})()};
(a=>{a["M5MO176lNOgVa8lZVMuwPQCmqfQ="]=a.current})($__dart_deferred_initializers__);
//# sourceMappingURL=main.dart.js_6.part.js.map
