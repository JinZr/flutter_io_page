((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,B,C,E,F,A={
aFD(){return new b.G.XMLHttpRequest()},
aFF(){return b.G.document.createElement("img")},
arP(d,e,f){var x=new A.Mg(d,B.c([],y.v),B.c([],y.l),B.c([],y.u))
x.Xd(d,e,f)
return x},
q6:function q6(d,e,f,g){var _=this
_.a=d
_.b=e
_.c=f
_.d=g},
a2q:function a2q(d,e,f){this.a=d
this.b=e
this.c=f},
a2r:function a2r(d,e){this.a=d
this.b=e},
a2o:function a2o(d,e,f){this.a=d
this.b=e
this.c=f},
a2p:function a2p(d,e,f){this.a=d
this.b=e
this.c=f},
Mg:function Mg(d,e,f,g){var _=this
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
acd:function acd(d){this.a=d},
ace:function ace(d,e){this.a=d
this.b=e},
acf:function acf(d){this.a=d},
acg:function acg(d){this.a=d},
ach:function ach(d){this.a=d},
rf:function rf(d,e){this.a=d
this.b=e},
aAK(d,e){return new A.q7("HTTP request failed, statusCode: "+d+", "+e.j(0))},
a95:function a95(d,e){this.a=d
this.b=e},
q7:function q7(d){this.b=d},
aAN(d,e){var x=new A.GM(B.c([],y.v),B.c([],y.l),B.c([],y.u))
x.X_(d,e)
return x},
GM:function GM(d,e,f){var _=this
_.a=d
_.b=e
_.e=_.d=_.c=null
_.f=!1
_.r=0
_.w=!1
_.x=f},
a2B:function a2B(d,e){this.a=d
this.b=e},
ayb(){return new A.mt(null)},
ux:function ux(d,e,f,g,h){var _=this
_.c=d
_.d=e
_.e=f
_.f=g
_.a=h},
Uz:function Uz(){},
UA:function UA(d){this.a=d},
mt:function mt(d){this.a=d}},D
J=c[1]
B=c[0]
C=c[2]
E=c[8]
F=c[9]
A=a.updateHolder(c[4],A)
D=c[12]
A.q6.prototype={
wu(d){return new B.cd(this,y.i)},
rj(d,e){return A.arP(this.pi(d,e),d.a,null)},
rk(d,e){return A.arP(this.pi(d,e),d.a,null)},
pi(d,e){return this.a2u(d,e)},
a2u(d,e){var x=0,w=B.Q(y.R),v,u=2,t=[],s=this,r,q,p,o,n
var $async$pi=B.L(function(f,g){if(f===1){t.push(g)
x=u}while(true)switch(x){case 0:p=new A.a2q(s,e,d)
o=new A.a2r(s,d)
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
return B.U(p.$0(),$async$pi)
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
case 4:case 1:return B.O(v,w)
case 2:return B.N(t.at(-1),w)}})
return B.P($async$pi,w)},
pv(d){var x=0,w=B.Q(y.p),v,u=this,t,s,r,q,p,o,n
var $async$pv=B.L(function(e,f){if(e===1)return B.N(f,w)
while(true)switch(x){case 0:s=u.a
r=E.a8K().T(s)
q=new B.ae($.ac,y.Z)
p=new B.bk(q,y.x)
o=A.aFD()
o.open("GET",s,!0)
o.responseType="arraybuffer"
o.addEventListener("load",B.hd(new A.a2o(o,p,r)))
o.addEventListener("error",B.hd(new A.a2p(p,o,r)))
o.send()
x=3
return B.U(q,$async$pv)
case 3:s=o.response
s.toString
t=B.apX(y.a.a(s),0,null)
if(t.byteLength===0)throw B.h(A.aAK(B.A(o,"status"),r))
n=d
x=4
return B.U(B.YK(t),$async$pv)
case 4:v=n.$1(f)
x=1
break
case 1:return B.O(v,w)}})
return B.P($async$pv,w)},
k(d,e){if(e==null)return!1
if(J.T(e)!==B.t(this))return!1
return e instanceof A.q6&&e.a===this.a&&e.b===this.b},
gt(d){return B.R(this.a,this.b,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a)},
j(d){return'NetworkImage("'+this.a+'", scale: '+C.h.a0(this.b,1)+")"}}
A.Mg.prototype={
Xd(d,e,f){var x=this
x.e=e
x.y.dq(new A.acd(x),new A.ace(x,f),y.P)},
gQg(){var x=this,w=x.at
return w===$?x.at=new B.ew(new A.acf(x),new A.acg(x),new A.ach(x)):w},
DT(){var x,w=this
if(w.z){x=w.Q
x===$&&B.a()
x.L(w.gQg())}w.as=!0
w.TO()}}
A.rf.prototype={
Bz(){return new A.rf(this.a,this.b)},
l(){},
gdd(){return B.Z(B.bm("Could not create image data for this image because access to it is restricted by the Same-Origin Policy.\nSee https://developer.mozilla.org/en-US/docs/Web/Security/Same-origin_policy"))},
goW(){return 1},
gFU(){var x=this.a
return C.d.f2(4*x.naturalWidth*x.naturalHeight)},
$ieu:1,
gjw(){return this.b}}
A.a95.prototype={
H(){return"WebHtmlElementStrategy."+this.b}}
A.q7.prototype={
j(d){return this.b},
$ibH:1}
A.GM.prototype={
X_(d,e){d.dq(this.gSP(),new A.a2B(this,e),y.H)}}
A.ux.prototype={
J(d){var x=this,w=null,v=B.aqz(w,w,new A.q6(x.e,1,w,D.QV)),u=B.bP(x.c,w,w)
return B.js(w,new B.jj(v,new A.Uz(),36,36,w,w),new A.UA(x),!1,B.bP(x.d,w,w),u,w)}}
A.mt.prototype={
J(d){var x,w=null,v=B.S(d).ok.w
v.toString
v=B.js(w,D.CJ,w,!1,w,B.bP("Contribution to Open Source",v,w),w)
x=B.S(d).a3.y
x=x==null?w:x.T(d.a7(y.I).w).a
return B.p7(B.fd(B.c([v,F.Vf(x==null?16:x),D.B5,D.B6],y.D),C.aj,C.a6,C.ag),w,w,w,w,w)}}
var z=a.updateTypes([])
A.a2q.prototype={
$0(){var x=0,w=B.Q(y.R),v,u=this,t,s,r
var $async$$0=B.L(function(d,e){if(d===1)return B.N(e,w)
while(true)switch(x){case 0:t=u.c
s=B
r=B
x=3
return B.U(u.a.pv(u.b),$async$$0)
case 3:v=s.alv(r.cZ(e,y.p),t.a,null,t.b)
x=1
break
case 1:return B.O(v,w)}})
return B.P($async$$0,w)},
$S:176}
A.a2r.prototype={
$0(){var x=0,w=B.Q(y.R),v,u=this,t,s,r
var $async$$0=B.L(function(d,e){if(d===1)return B.N(e,w)
while(true)switch(x){case 0:s=A.aFF()
r=u.b.a
s.src=r
x=3
return B.U(B.dN(s.decode(),y.X),$async$$0)
case 3:t=A.aAN(B.cZ(new A.rf(s,r),y.J),null)
t.e=r
v=t
x=1
break
case 1:return B.O(v,w)}})
return B.P($async$$0,w)},
$S:176}
A.a2o.prototype={
$1(d){var x=this.a,w=x.status,v=w>=200&&w<300,u=w>307&&w<400,t=v||w===0||w===304||u,s=this.b
if(t)s.dz(x)
else s.kB(new A.q7("HTTP request failed, statusCode: "+B.k(w)+", "+this.c.j(0)))},
$S:30}
A.a2p.prototype={
$1(d){return this.a.kB(new A.q7("HTTP request failed, statusCode: "+B.k(this.b.status)+", "+this.c.j(0)))},
$S:1}
A.acd.prototype={
$1(d){var x=this.a
x.z=!0
if(x.as){d.pQ()
return}x.Q!==$&&B.bg()
x.Q=d
d.a4(x.gQg())},
$S:502}
A.ace.prototype={
$2(d,e){this.a.mv(B.b9("resolving an image stream completer"),d,this.b,!0,e)},
$S:16}
A.acf.prototype={
$2(d,e){this.a.xL(d)},
$S:161}
A.acg.prototype={
$1(d){this.a.ae3(d)},
$S:162}
A.ach.prototype={
$2(d,e){this.a.ae2(d,e)},
$S:503}
A.a2B.prototype={
$2(d,e){this.a.mv(B.b9("resolving a single-frame image stream"),d,this.b,!0,e)},
$S:16}
A.Uz.prototype={
$3(d,e,f){return e},
$S:504}
A.UA.prototype={
$0(){return B.kc(this.a.f)},
$S:0};(function inheritance(){var x=a.inherit,w=a.inheritMany
x(A.q6,B.ev)
w(B.ja,[A.a2q,A.a2r,A.UA])
w(B.fc,[A.a2o,A.a2p,A.acd,A.acg,A.Uz])
w(B.dF,[A.Mg,A.GM])
w(B.i8,[A.ace,A.acf,A.ach,A.a2B])
w(B.D,[A.rf,A.q7])
x(A.a95,B.rx)
w(B.an,[A.ux,A.mt])})()
B.tf(b.typeUniverse,JSON.parse('{"q6":{"ev":["alz"],"ev.T":"alz"},"Mg":{"dF":[]},"rf":{"eu":[]},"alz":{"ev":["alz"]},"q7":{"bH":[]},"GM":{"dF":[]},"ux":{"an":[],"f":[]},"mt":{"an":[],"f":[]}}'))
var y=(function rtii(){var x=B.a1
return{p:x("dC"),I:x("dP"),J:x("eu"),R:x("dF"),v:x("y<ew>"),D:x("y<f>"),u:x("y<~()>"),l:x("y<~(D,bW?)>"),a:x("kU"),P:x("aG"),i:x("cd<q6>"),x:x("bk<ao>"),Z:x("ae<ao>"),X:x("D?"),H:x("~")}})();(function constants(){D.B5=new A.ux("k2-fsa/icefall","icefall contains ASR recipes for various datasets using https://github.com/k2-fsa/k2.","https://raw.githubusercontent.com/k2-fsa/icefall/master/docs/source/_static/logo.png","https://github.com/k2-fsa/icefall",null)
D.B6=new A.ux("lhotse-speech/lhotse","Lhotse is a Python library aiming to make speech and audio data preparation flexible and accessible to a wider community. Alongside k2, it is a part of the next generation Kaldi speech processing library.","https://raw.githubusercontent.com/lhotse-speech/lhotse/master/docs/logo.png","https://github.com/lhotse-speech/lhotse",null)
D.Cy=new B.dT(57718,"MaterialIcons",!1)
D.CJ=new B.fl(D.Cy,null,null,null)
D.QV=new A.a95(0,"never")})()};
(a=>{a["XaIIMOW3bavWAQtdYNMG6t8WJok="]=a.current})($__dart_deferred_initializers__);
//# sourceMappingURL=main.dart.js_5.part.js.map
