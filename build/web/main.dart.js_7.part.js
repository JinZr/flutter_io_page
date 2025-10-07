((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,B,C,E,F,A={
aDA(){return new b.G.XMLHttpRequest()},
aDC(){return b.G.document.createElement("img")},
apW(d,e,f){var x=new A.Ly(d,B.c([],y.v),B.c([],y.l),B.c([],y.u))
x.Wv(d,e,f)
return x},
pL:function pL(d,e,f,g){var _=this
_.a=d
_.b=e
_.c=f
_.d=g},
a1p:function a1p(d,e,f){this.a=d
this.b=e
this.c=f},
a1q:function a1q(d,e){this.a=d
this.b=e},
a1n:function a1n(d,e,f){this.a=d
this.b=e
this.c=f},
a1o:function a1o(d,e,f){this.a=d
this.b=e
this.c=f},
Ly:function Ly(d,e,f,g){var _=this
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
aaY:function aaY(d){this.a=d},
aaZ:function aaZ(d,e){this.a=d
this.b=e},
ab_:function ab_(d){this.a=d},
ab0:function ab0(d){this.a=d},
ab1:function ab1(d){this.a=d},
qR:function qR(d,e){this.a=d
this.b=e},
ayN(d,e){return new A.pM("HTTP request failed, statusCode: "+d+", "+e.j(0))},
a7Y:function a7Y(d,e){this.a=d
this.b=e},
pM:function pM(d){this.b=d},
ayQ(d,e){var x=new A.Gb(B.c([],y.v),B.c([],y.l),B.c([],y.u))
x.Wh(d,e)
return x},
Gb:function Gb(d,e,f){var _=this
_.a=d
_.b=e
_.e=_.d=_.c=null
_.f=!1
_.r=0
_.w=!1
_.x=f},
a1A:function a1A(d,e){this.a=d
this.b=e},
awf(){return new A.mf(null)},
u9:function u9(d,e,f,g,h){var _=this
_.c=d
_.d=e
_.e=f
_.f=g
_.a=h},
TD:function TD(){},
TE:function TE(d){this.a=d},
mf:function mf(d){this.a=d}},D
J=c[1]
B=c[0]
C=c[2]
E=c[9]
F=c[11]
A=a.updateHolder(c[4],A)
D=c[14]
A.pL.prototype={
wf(d){return new B.cb(this,y.i)},
r9(d,e){return A.apW(this.p9(d,e),d.a,null)},
ra(d,e){return A.apW(this.p9(d,e),d.a,null)},
p9(d,e){return this.a1Q(d,e)},
a1Q(d,e){var x=0,w=B.O(y.R),v,u=2,t=[],s=this,r,q,p,o,n
var $async$p9=B.K(function(f,g){if(f===1){t.push(g)
x=u}while(true)switch(x){case 0:p=new A.a1p(s,e,d)
o=new A.a1q(s,d)
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
return B.T(p.$0(),$async$p9)
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
case 4:case 1:return B.M(v,w)
case 2:return B.L(t.at(-1),w)}})
return B.N($async$p9,w)},
pm(d){var x=0,w=B.O(y.p),v,u=this,t,s,r,q,p,o,n
var $async$pm=B.K(function(e,f){if(e===1)return B.L(f,w)
while(true)switch(x){case 0:s=u.a
r=E.a7C().T(s)
q=new B.ag($.ac,y.Z)
p=new B.bm(q,y.x)
o=A.aDA()
o.open("GET",s,!0)
o.responseType="arraybuffer"
o.addEventListener("load",B.h2(new A.a1n(o,p,r)))
o.addEventListener("error",B.h2(new A.a1o(p,o,r)))
o.send()
x=3
return B.T(q,$async$pm)
case 3:s=o.response
s.toString
t=B.aoa(y.a.a(s),0,null)
if(t.byteLength===0)throw B.h(A.ayN(B.A(o,"status"),r))
n=d
x=4
return B.T(B.XN(t),$async$pm)
case 4:v=n.$1(f)
x=1
break
case 1:return B.M(v,w)}})
return B.N($async$pm,w)},
k(d,e){if(e==null)return!1
if(J.R(e)!==B.u(this))return!1
return e instanceof A.pL&&e.a===this.a&&e.b===this.b},
gt(d){return B.P(this.a,this.b,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a)},
j(d){return'NetworkImage("'+this.a+'", scale: '+C.h.Z(this.b,1)+")"}}
A.Ly.prototype={
Wv(d,e,f){var x=this
x.e=e
x.y.dq(new A.aaY(x),new A.aaZ(x,f),y.P)},
gPB(){var x=this,w=x.at
return w===$?x.at=new B.ep(new A.ab_(x),new A.ab0(x),new A.ab1(x)):w},
Dv(){var x,w=this
if(w.z){x=w.Q
x===$&&B.a()
x.K(w.gPB())}w.as=!0
w.T9()}}
A.qR.prototype={
Bd(){return new A.qR(this.a,this.b)},
l(){},
gd9(){return B.X(B.bj("Could not create image data for this image because access to it is restricted by the Same-Origin Policy.\nSee https://developer.mozilla.org/en-US/docs/Web/Security/Same-origin_policy"))},
goN(){return 1},
gFo(){var x=this.a
return C.d.eZ(4*x.naturalWidth*x.naturalHeight)},
$ien:1,
gjt(){return this.b}}
A.a7Y.prototype={
I(){return"WebHtmlElementStrategy."+this.b}}
A.pM.prototype={
j(d){return this.b},
$ibE:1}
A.Gb.prototype={
Wh(d,e){d.dq(this.gSb(),new A.a1A(this,e),y.H)}}
A.u9.prototype={
L(d){var x=this,w=null,v=B.aoK(w,w,new A.pL(x.e,1,w,D.Qo)),u=B.cB(x.c,w)
return B.jf(w,new B.j7(v,new A.TD(),36,36,w,w),new A.TE(x),B.cB(x.d,w),u,w)}}
A.mf.prototype={
L(d){var x,w=null,v=B.U(d).ok.w
v.toString
v=B.jf(w,D.Cc,w,w,B.cB("Contribution to Open Source",v),w)
x=B.U(d).a7.y
x=x==null?w:x.T(d.aa(y.I).w).a
return B.tH(B.iZ(B.c([v,F.Ui(x==null?16:x),D.AI,D.AJ],y.D),C.aV,C.aj,C.aQ),w)}}
var z=a.updateTypes([])
A.a1p.prototype={
$0(){var x=0,w=B.O(y.R),v,u=this,t,s,r
var $async$$0=B.K(function(d,e){if(d===1)return B.L(e,w)
while(true)switch(x){case 0:t=u.c
s=B
r=B
x=3
return B.T(u.a.pm(u.b),$async$$0)
case 3:v=s.ajM(r.cW(e,y.p),t.a,null,t.b)
x=1
break
case 1:return B.M(v,w)}})
return B.N($async$$0,w)},
$S:165}
A.a1q.prototype={
$0(){var x=0,w=B.O(y.R),v,u=this,t,s,r
var $async$$0=B.K(function(d,e){if(d===1)return B.L(e,w)
while(true)switch(x){case 0:s=A.aDC()
r=u.b.a
s.src=r
x=3
return B.T(B.dJ(s.decode(),y.X),$async$$0)
case 3:t=A.ayQ(B.cW(new A.qR(s,r),y.J),null)
t.e=r
v=t
x=1
break
case 1:return B.M(v,w)}})
return B.N($async$$0,w)},
$S:165}
A.a1n.prototype={
$1(d){var x=this.a,w=x.status,v=w>=200&&w<300,u=w>307&&w<400,t=v||w===0||w===304||u,s=this.b
if(t)s.dM(x)
else s.kw(new A.pM("HTTP request failed, statusCode: "+B.k(w)+", "+this.c.j(0)))},
$S:33}
A.a1o.prototype={
$1(d){return this.a.kw(new A.pM("HTTP request failed, statusCode: "+B.k(this.b.status)+", "+this.c.j(0)))},
$S:1}
A.aaY.prototype={
$1(d){var x=this.a
x.z=!0
if(x.as){d.pH()
return}x.Q!==$&&B.bg()
x.Q=d
d.a3(x.gPB())},
$S:476}
A.aaZ.prototype={
$2(d,e){this.a.mk(B.b9("resolving an image stream completer"),d,this.b,!0,e)},
$S:18}
A.ab_.prototype={
$2(d,e){this.a.xv(d)},
$S:143}
A.ab0.prototype={
$1(d){this.a.adp(d)},
$S:144}
A.ab1.prototype={
$2(d,e){this.a.ado(d,e)},
$S:477}
A.a1A.prototype={
$2(d,e){this.a.mk(B.b9("resolving a single-frame image stream"),d,this.b,!0,e)},
$S:18}
A.TD.prototype={
$3(d,e,f){return e},
$S:478}
A.TE.prototype={
$0(){return B.k1(this.a.f)},
$S:0};(function inheritance(){var x=a.inherit,w=a.inheritMany
x(A.pL,B.eo)
w(B.h8,[A.a1p,A.a1q,A.TE])
w(B.ei,[A.a1n,A.a1o,A.aaY,A.ab0,A.TD])
w(B.dB,[A.Ly,A.Gb])
w(B.h9,[A.aaZ,A.ab_,A.ab1,A.a1A])
w(B.C,[A.qR,A.pM])
x(A.a7Y,B.r6)
w(B.at,[A.u9,A.mf])})()
B.jX(b.typeUniverse,JSON.parse('{"pL":{"eo":["ajR"],"eo.T":"ajR"},"Ly":{"dB":[]},"qR":{"en":[]},"ajR":{"eo":["ajR"]},"pM":{"bE":[]},"Gb":{"dB":[]},"u9":{"at":[],"f":[]},"mf":{"at":[],"f":[]}}'))
var y=(function rtii(){var x=B.a0
return{p:x("dx"),I:x("dy"),J:x("en"),R:x("dB"),v:x("x<ep>"),D:x("x<f>"),u:x("x<~()>"),l:x("x<~(C,bT?)>"),a:x("kI"),P:x("aG"),i:x("cb<pL>"),x:x("bm<al>"),Z:x("ag<al>"),X:x("C?"),H:x("~")}})();(function constants(){D.AI=new A.u9("k2-fsa/icefall","icefall contains ASR recipes for various datasets using https://github.com/k2-fsa/k2.","https://raw.githubusercontent.com/k2-fsa/icefall/master/docs/source/_static/logo.png","https://github.com/k2-fsa/icefall",null)
D.AJ=new A.u9("lhotse-speech/lhotse","Lhotse is a Python library aiming to make speech and audio data preparation flexible and accessible to a wider community. Alongside k2, it is a part of the next generation Kaldi speech processing library.","https://raw.githubusercontent.com/lhotse-speech/lhotse/master/docs/logo.png","https://github.com/lhotse-speech/lhotse",null)
D.C3=new B.dY(57718,"MaterialIcons",!1)
D.Cc=new B.fD(D.C3,null,null,null)
D.Qo=new A.a7Y(0,"never")})()};
(a=>{a["8NOfQkzyBbaQc0s5j6ZdACVAdyo="]=a.current})($__dart_deferred_initializers__);
//# sourceMappingURL=main.dart.js_7.part.js.map
