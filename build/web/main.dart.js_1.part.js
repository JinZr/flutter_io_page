((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,B,C,A={
aAh(){return new A.l2(null)},
aqb(d){var x=J.lU(d,new A.aeT(),y.y)
x=B.Y(x,x.$ti.h("an.E"))
x.$flags=1
return x},
aCd(d,e){var x
if(d===e)return!0
if(e==null||d.length!==e.length)return!1
for(x=0;x<d.length;++x)if(!B.ow(d[x],e[x]))return!1
return!0},
aEe(d){var x=d.i(0,"theme")
x=x==null?null:J.ce(x)
return x==null?"Other":x},
l2:function l2(d){this.a=d},
OB:function OB(d){var _=this
_.f=_.e=_.d=null
_.r=$
_.cU$=d
_.c=_.a=null},
aeR:function aeR(d,e){this.a=d
this.b=e},
aeS:function aeS(d,e){this.a=d
this.b=e},
aeV:function aeV(d,e,f){this.a=d
this.b=e
this.c=f},
aeU:function aeU(d,e){this.a=d
this.b=e},
aeM:function aeM(d){this.a=d},
aeN:function aeN(d,e){this.a=d
this.b=e},
aeO:function aeO(){},
aeP:function aeP(){},
aeQ:function aeQ(d){this.a=d},
aeT:function aeT(){},
C3:function C3(){},
qe:function qe(d,e){this.c=d
this.a=e},
a4x:function a4x(d){this.a=d}},F,G,D,H,I,K,E
J=c[1]
B=c[0]
C=c[2]
A=a.updateHolder(c[3],A)
F=c[17]
G=c[7]
D=c[13]
H=c[8]
I=c[16]
K=c[11]
E=c[10]
A.l2.prototype={
aj(){return new A.OB(null)}}
A.OB.prototype={
an(){this.W2()
this.pS()},
pS(){var x=0,w=B.O(y.v),v=1,u=[],t=[],s=this,r,q,p,o,n,m,l,k,j,i
var $async$pS=B.K(function(d,e){if(d===1){u.push(e)
x=v}while(true)switch(x){case 0:v=3
x=6
return B.T(G.Rl("selected_pub_list.json"),$async$pS)
case 6:r=e
q=A.aqb(r)
s.KN(q)
v=1
x=5
break
case 3:v=2
j=u.pop()
p=B.aa(j)
if(s.c!=null)s.al(new A.aeR(s,p))
x=5
break
case 2:x=1
break
case 5:v=8
k=s.r
x=11
return B.T((k===$?s.r=$.aif():k).w6("selected_pub_list.json"),$async$pS)
case 11:o=e
n=A.aqb(o)
if(!A.aCd(n,s.d))s.KN(n)
t.push(10)
x=9
break
case 8:v=7
i=u.pop()
m=B.aa(i)
if(s.c!=null&&s.d==null)s.al(new A.aeS(s,m))
t.push(10)
x=9
break
case 7:t=[1]
case 9:v=1
x=t.pop()
break
case 10:return B.M(null,w)
case 1:return B.L(u.at(-1),w)}})
return B.N($async$pS,w)},
KN(d){var x,w=this
if(w.c==null)return
x=w.HX(d)
w.al(new A.aeV(w,d,w.a3S(w.f,x)))},
a2F(d){if(this.f===d)return
this.al(new A.aeU(this,d))},
a3S(d,e){if(e.length===0)return null
if(d!=null&&C.b.p(e,d))return d
return C.b.gV(e)},
HX(d){var x,w,v,u,t=B.aB(y.w),s=B.c([],y.x)
for(x=d.length,w=0;w<d.length;d.length===x||(0,B.B)(d),++w){v=d[w].i(0,"theme")
u=v==null?null:J.ce(v)
if(u==null)u="Other"
if(t.C(0,u))s.push(u)}return s},
gjV(){return!0},
L(d){var x,w,v=null
this.mK(d)
x=B.U(d).ok.w
x.toString
x=B.jf(v,F.Cf,v,v,B.cB("Selected Publications",x),v)
w=B.U(d).a7.y
w=w==null?v:w.T(d.aa(y.o).w).a
return B.tH(B.iZ(B.c([x,K.Ui(w==null?16:w),E.aiE(C.bK,new B.et(this.a4s(d),v),C.bR,C.aB)],y.u),C.b6,C.aj,C.aQ),v)},
a4s(d){var x,w,v,u,t,s,r,q,p,o,n=this,m=null,l=n.d
if(l!=null){x=n.HX(l)
w=n.f
if(w==null)w=x.length!==0?C.b.gV(x):m
if(w==null)v=l
else{u=B.V(l).h("ax<1>")
u=B.Y(new B.ax(l,new A.aeM(w),u),u.h("t.E"))
u.$flags=1
v=u}u=y.u
t=B.c([],u)
if(x.length!==0){u=B.c([],u)
for(s=x.length,r=0;r<x.length;x.length===s||(0,B.B)(x),++r){q=x[r]
u.push(H.and(B.cB(q,m),new A.aeN(n,q),q===w))}t.push(new B.c_(I.l8,B.aku(u,8,8),m))}t.push(E.tk(new B.eP(n.Xj(v),new B.c0(w,y.l)),C.aB,E.ahf(),C.X,C.X,new A.aeO()))
p=B.iZ(t,C.b6,C.aj,C.iu)
o=D.x2}else{u=n.e
if(u!=null){p=new B.c_(D.eA,B.kd(B.iZ(B.c([D.lo,B.cB(J.ce(u),m)],y.u),C.aV,C.aj,C.aQ),m,m),m)
o=D.x3}else{p=D.r3
o=D.x4}}return E.tk(new B.eP(p,o),C.ey,new A.aeP(),C.kX,C.ck,E.ahg())},
Xj(d){var x=d.length
if(x===0){x=this.c
x.toString
return new B.c_(D.eA,B.cB("No publications available for this theme yet.",B.U(x).ok.z),null)}return G.anU(new A.aeQ(d),x,C.at,D.qX,!0)}}
A.C3.prototype={
an(){this.aM()
this.kd()},
ci(){var x=this.cU$
if(x!=null){x.az()
x.de()
this.cU$=null}this.j7()}}
A.qe.prototype={
L(d){var x=null,w=this.c,v=B.cB(w.i(0,"title"),C.wO)
return B.jf(!0,x,new A.a4x(this),B.cB(w.i(0,"author"),x),v,B.iZ(B.c([B.cB(w.i(0,"venue"),x),B.cB(w.i(0,"year"),x)],y.u),C.cj,C.it,C.aQ))}}
var z=a.updateTypes(["qe(W,n)"])
A.aeR.prototype={
$0(){this.a.e=this.b},
$S:0}
A.aeS.prototype={
$0(){this.a.e=this.b},
$S:0}
A.aeV.prototype={
$0(){var x=this.a
x.d=this.b
x.f=this.c
x.e=null},
$S:0}
A.aeU.prototype={
$0(){this.a.f=this.b},
$S:0}
A.aeM.prototype={
$1(d){return A.aEe(d)===this.a},
$S:481}
A.aeN.prototype={
$1(d){return this.a.a2F(this.b)},
$S:16}
A.aeO.prototype={
$2(d,e){var x=B.c6(C.bR,e,null)
return new B.fa(x,!1,B.aka(C.ay,-1,d,x),null)},
$S:164}
A.aeP.prototype={
$2(d,e){var x=B.Y(e,y.m)
if(d!=null)x.push(d)
return B.jD(C.bK,x,C.cI)},
$S:166}
A.aeQ.prototype={
$2(d,e){return new A.qe(this.a[e],null)},
$S:z+0}
A.aeT.prototype={
$1(d){return y.B.a(d).fb(0,y.w,y.b)},
$S:167}
A.a4x.prototype={
$0(){B.Rk(B.e9(this.a.c.i(0,"link"),0,null))},
$S:0};(function aliases(){var x=A.C3.prototype
x.W2=x.an})();(function inheritance(){var x=a.mixinHard,w=a.inherit,v=a.inheritMany
w(A.l2,B.Z)
w(A.C3,B.a5)
w(A.OB,A.C3)
v(B.h8,[A.aeR,A.aeS,A.aeV,A.aeU,A.a4x])
v(B.ei,[A.aeM,A.aeN,A.aeT])
v(B.h9,[A.aeO,A.aeP,A.aeQ])
w(A.qe,B.at)
x(A.C3,B.hU)})()
B.jX(b.typeUniverse,JSON.parse('{"l2":{"Z":[],"f":[]},"OB":{"a5":["l2"]},"qe":{"at":[],"f":[]}}'))
var y=(function rtii(){var x=B.a0
return{o:x("dy"),x:x("x<o>"),u:x("x<f>"),y:x("ar<o,@>"),B:x("ar<@,@>"),w:x("o"),l:x("c0<o?>"),m:x("f"),b:x("@"),v:x("~")}})();(function constants(){F.C8=new B.dY(984385,"MaterialIcons",!1)
F.Cf=new B.fD(F.C8,null,null,null)})()};
(a=>{a["LfcHbtYm34nqydBw/+J/EYSp60I="]=a.current})($__dart_deferred_initializers__);
//# sourceMappingURL=main.dart.js_1.part.js.map
