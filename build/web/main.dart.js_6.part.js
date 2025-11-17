((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,B,C,E,F,A={
aEo(){return new b.G.XMLHttpRequest()},
aEq(){return b.G.document.createElement("img")},
aqA(d,e,f){var x=new A.M7(d,B.c([],y.v),B.c([],y.l),B.c([],y.u))
x.Xo(d,e,f)
return x},
pU:function pU(d,e,f,g){var _=this
_.a=d
_.b=e
_.c=f
_.d=g},
a22:function a22(d,e,f){this.a=d
this.b=e
this.c=f},
a23:function a23(d,e){this.a=d
this.b=e},
a20:function a20(d,e,f){this.a=d
this.b=e
this.c=f},
a21:function a21(d,e,f){this.a=d
this.b=e
this.c=f},
M7:function M7(d,e,f,g){var _=this
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
abL:function abL(d){this.a=d},
abM:function abM(d,e){this.a=d
this.b=e},
abN:function abN(d){this.a=d},
abO:function abO(d){this.a=d},
abP:function abP(d){this.a=d},
qZ:function qZ(d,e){this.a=d
this.b=e},
azB(d,e){return new A.pV("HTTP request failed, statusCode: "+d+", "+e.k(0))},
a8N:function a8N(d,e){this.a=d
this.b=e},
pV:function pV(d){this.b=d},
azE(d,e){var x=new A.GF(B.c([],y.v),B.c([],y.l),B.c([],y.u))
x.Xb(d,e)
return x},
GF:function GF(d,e,f){var _=this
_.a=d
_.b=e
_.e=_.d=_.c=null
_.f=!1
_.r=0
_.w=!1
_.x=f},
a2d:function a2d(d,e){this.a=d
this.b=e},
ax4(){return new A.mp(null)},
un:function un(d,e,f,g,h){var _=this
_.c=d
_.d=e
_.e=f
_.f=g
_.a=h},
Um:function Um(){},
Un:function Un(d){this.a=d},
mp:function mp(d){this.a=d}},D
J=c[1]
B=c[0]
C=c[2]
E=c[8]
F=c[10]
A=a.updateHolder(c[4],A)
D=c[13]
A.pU.prototype={
ww(d){return new B.cc(this,y.i)},
rh(d,e){return A.aqA(this.pn(d,e),d.a,null)},
ri(d,e){return A.aqA(this.pn(d,e),d.a,null)},
pn(d,e){return this.a2H(d,e)},
a2H(d,e){var x=0,w=B.M(y.R),v,u=2,t=[],s=this,r,q,p,o,n
var $async$pn=B.N(function(f,g){if(f===1){t.push(g)
x=u}for(;;)switch(x){case 0:p=new A.a22(s,e,d)
o=new A.a23(s,d)
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
return B.R(p.$0(),$async$pn)
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
return B.L($async$pn,w)},
pA(d){var x=0,w=B.M(y.p),v,u=this,t,s,r,q,p,o,n
var $async$pA=B.N(function(e,f){if(e===1)return B.J(f,w)
for(;;)switch(x){case 0:s=u.a
r=E.a8q().V(s)
q=new B.ak($.af,y.Z)
p=new B.bk(q,y.x)
o=A.aEo()
o.open("GET",s,!0)
o.responseType="arraybuffer"
o.addEventListener("load",B.h5(new A.a20(o,p,r)))
o.addEventListener("error",B.h5(new A.a21(p,o,r)))
o.send()
x=3
return B.R(q,$async$pA)
case 3:s=o.response
s.toString
t=B.aoP(y.a.a(s),0,null)
if(t.byteLength===0)throw B.h(A.azB(B.B(o,"status"),r))
n=d
x=4
return B.R(B.Yr(t),$async$pA)
case 4:v=n.$1(f)
x=1
break
case 1:return B.K(v,w)}})
return B.L($async$pA,w)},
j(d,e){var x=this
if(e==null)return!1
if(J.S(e)!==B.u(x))return!1
return e instanceof A.pU&&e.a===x.a&&e.b===x.b&&e.d===x.d&&B.m0(e.c,x.c)},
gt(d){var x=this
return B.O(x.a,x.b,x.d,x.c,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a)},
k(d){var x=this
return'NetworkImage("'+x.a+'", scale: '+C.h.a_(x.b,1)+", webHtmlElementStrategy: "+x.d.b+", headers: "+B.i(x.c)+")"}}
A.M7.prototype={
Xo(d,e,f){var x=this
x.e=e
x.y.dv(new A.abL(x),new A.abM(x,f),y.P)},
gQk(){var x=this,w=x.at
return w===$?x.at=new B.ew(new A.abN(x),new A.abO(x),new A.abP(x)):w},
DW(){var x,w=this
if(w.z){x=w.Q
x===$&&B.a()
x.K(w.gQk())}w.as=!0
w.U_()}}
A.qZ.prototype={
Bz(){return new A.qZ(this.a,this.b)},
l(){},
gdc(){return B.X(B.bj("Could not create image data for this image because access to it is restricted by the Same-Origin Policy.\nSee https://developer.mozilla.org/en-US/docs/Web/Security/Same-origin_policy"))},
gp0(){return 1},
gFR(){var x=this.a
return C.d.f8(4*x.naturalWidth*x.naturalHeight)},
$ieu:1,
gjD(){return this.b}}
A.a8N.prototype={
H(){return"WebHtmlElementStrategy."+this.b}}
A.pV.prototype={
k(d){return this.b},
$ibG:1}
A.GF.prototype={
Xb(d,e){d.dv(this.gT_(),new A.a2d(this,e),y.H)}}
A.un.prototype={
L(d){var x=this,w=null,v=B.apn(w,w,new A.pU(x.e,1,w,D.QW)),u=B.cH(x.c,w)
return B.js(w,new B.jk(v,new A.Um(),36,36,w,w),new A.Un(x),B.cH(x.d,w),u,w)}}
A.mp.prototype={
L(d){var x,w=null,v=B.V(d).ok.w
v.toString
v=B.js(w,D.CA,w,w,B.cH("Contribution to Open Source",v),w)
x=B.V(d).a6.y
x=x==null?w:x.V(d.aa(y.I).w).a
return B.tZ(B.j8(B.c([v,F.V0(x==null?16:x),D.B1,D.B2],y.D),C.aQ,C.al,C.aT),w)}}
var z=a.updateTypes([])
A.a22.prototype={
$0(){var x=0,w=B.M(y.R),v,u=this,t,s,r
var $async$$0=B.N(function(d,e){if(d===1)return B.J(e,w)
for(;;)switch(x){case 0:t=u.c
s=B
r=B
x=3
return B.R(u.a.pA(u.b),$async$$0)
case 3:v=s.aku(r.da(e,y.p),t.a,null,t.b)
x=1
break
case 1:return B.K(v,w)}})
return B.L($async$$0,w)},
$S:94}
A.a23.prototype={
$0(){var x=0,w=B.M(y.R),v,u=this,t,s,r
var $async$$0=B.N(function(d,e){if(d===1)return B.J(e,w)
for(;;)switch(x){case 0:s=A.aEq()
r=u.b.a
s.src=r
x=3
return B.R(B.dy(s.decode(),y.X),$async$$0)
case 3:t=A.azE(B.da(new A.qZ(s,r),y.J),null)
t.e=r
v=t
x=1
break
case 1:return B.K(v,w)}})
return B.L($async$$0,w)},
$S:94}
A.a20.prototype={
$1(d){var x=this.a,w=x.status,v=w>=200&&w<300,u=w>307&&w<400,t=v||w===0||w===304||u,s=this.b
if(t)s.dT(x)
else s.kA(new A.pV("HTTP request failed, statusCode: "+B.i(w)+", "+this.c.k(0)))},
$S:29}
A.a21.prototype={
$1(d){return this.a.kA(new A.pV("HTTP request failed, statusCode: "+B.i(this.b.status)+", "+this.c.k(0)))},
$S:1}
A.abL.prototype={
$1(d){var x=this.a
x.z=!0
if(x.as){d.pX()
return}x.Q!==$&&B.bg()
x.Q=d
d.a2(x.gQk())},
$S:486}
A.abM.prototype={
$2(d,e){this.a.mx(B.ba("resolving an image stream completer"),d,this.b,!0,e)},
$S:22}
A.abN.prototype={
$2(d,e){this.a.xN(d)},
$S:119}
A.abO.prototype={
$1(d){this.a.aeq(d)},
$S:118}
A.abP.prototype={
$2(d,e){this.a.aep(d,e)},
$S:487}
A.a2d.prototype={
$2(d,e){this.a.mx(B.ba("resolving a single-frame image stream"),d,this.b,!0,e)},
$S:22}
A.Um.prototype={
$3(d,e,f){return e},
$S:488}
A.Un.prototype={
$0(){return B.kc(this.a.f)},
$S:0};(function inheritance(){var x=a.inherit,w=a.inheritMany
x(A.pU,B.ev)
w(B.j6,[A.a22,A.a23,A.Un])
w(B.fa,[A.a20,A.a21,A.abL,A.abO,A.Um])
w(B.dF,[A.M7,A.GF])
w(B.j7,[A.abM,A.abN,A.abP,A.a2d])
w(B.C,[A.qZ,A.pV])
x(A.a8N,B.rf)
w(B.ar,[A.un,A.mp])})()
B.t1(b.typeUniverse,JSON.parse('{"pU":{"ev":["akz"],"ev.T":"akz"},"M7":{"dF":[]},"qZ":{"eu":[]},"akz":{"ev":["akz"]},"pV":{"bG":[]},"GF":{"dF":[]},"un":{"ar":[],"f":[]},"mp":{"ar":[],"f":[]}}'))
var y=(function rtii(){var x=B.a3
return{p:x("dB"),I:x("e1"),J:x("eu"),R:x("dF"),v:x("x<ew>"),D:x("x<f>"),u:x("x<~()>"),l:x("x<~(C,bV?)>"),a:x("kU"),P:x("aI"),i:x("cc<pU>"),x:x("bk<am>"),Z:x("ak<am>"),X:x("C?"),H:x("~")}})();(function constants(){D.B1=new A.un("k2-fsa/icefall","icefall contains ASR recipes for various datasets using https://github.com/k2-fsa/k2.","https://raw.githubusercontent.com/k2-fsa/icefall/master/docs/source/_static/logo.png","https://github.com/k2-fsa/icefall",null)
D.B2=new A.un("lhotse-speech/lhotse","Lhotse is a Python library aiming to make speech and audio data preparation flexible and accessible to a wider community. Alongside k2, it is a part of the next generation Kaldi speech processing library.","https://raw.githubusercontent.com/lhotse-speech/lhotse/master/docs/logo.png","https://github.com/lhotse-speech/lhotse",null)
D.Cr=new B.e3(57718,"MaterialIcons",!1)
D.CA=new B.fF(D.Cr,null,null,null)
D.QW=new A.a8N(0,"never")})()};
(a=>{a["mtStD7Y93OnpdYxLqPaDMUeEKy0="]=a.current})($__dart_deferred_initializers__);
//# sourceMappingURL=main.dart.js_6.part.js.map
