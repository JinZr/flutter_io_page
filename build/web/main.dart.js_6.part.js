((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,C,F,D,G,B={
axn(d){return new B.kj(d,null)},
arz(d){var x=J.m6(d,new B.aa6(),y.y)
x=A.Z(x,x.$ti.h("aq.E"))
x.$flags=1
return x},
aDc(d,e){var x
if(d===e)return!0
if(e==null||d.length!==e.length)return!1
for(x=0;x<d.length;++x)if(!A.oU(d[x],e[x]))return!1
return!0},
as9(d,e,f,g,h,i,j){return new B.Q4(f,h,j,d,e,i,g,null)},
kj:function kj(d,e){this.c=d
this.a=e},
KD:function KD(d){var _=this
_.e=_.d=null
_.f=$
_.dJ$=d
_.c=_.a=null},
aa2:function aa2(d,e){this.a=d
this.b=e},
aa3:function aa3(d,e){this.a=d
this.b=e},
aa4:function aa4(d,e){this.a=d
this.b=e},
aa5:function aa5(d,e){this.a=d
this.b=e},
aa1:function aa1(){},
aa6:function aa6(){},
KE:function KE(d,e,f,g,h,i,j,k,l,m){var _=this
_.c=d
_.d=e
_.e=f
_.f=g
_.r=h
_.w=i
_.x=j
_.y=k
_.z=l
_.a=m},
aa7:function aa7(d){this.a=d},
Q4:function Q4(d,e,f,g,h,i,j,k){var _=this
_.c=d
_.d=e
_.e=f
_.f=g
_.r=h
_.w=i
_.x=j
_.a=k},
CP:function CP(){}},E,H
J=c[1]
A=c[0]
C=c[2]
F=c[7]
D=c[11]
G=c[9]
B=a.updateHolder(c[5],B)
E=c[10]
H=c[12]
B.kj.prototype={
ah(){return new B.KD(null)}}
B.KD.prototype={
an(){this.XM()
this.qe()},
qe(){var x=0,w=A.O(y.v),v=1,u=[],t=this,s,r,q,p,o,n,m,l,k,j,i,h
var $async$qe=A.P(function(d,e){if(d===1){u.push(e)
x=v}for(;;)switch(x){case 0:t.a.toString
s=F.atR()
v=3
x=6
return A.R(s.$1("academic_service_list.json"),$async$qe)
case 6:r=e
q=B.arz(r)
if(t.c!=null)t.ak(new B.aa2(t,q))
v=1
x=5
break
case 3:v=2
i=u.pop()
p=A.a9(i)
if(t.c!=null)t.ak(new B.aa3(t,p))
x=5
break
case 2:x=1
break
case 5:v=8
k=t.f
if(k===$){t.a.toString
j=$.ak7()
t.f=j
k=j}x=11
return A.R(k.x8("academic_service_list.json"),$async$qe)
case 11:o=e
n=B.arz(o)
if(t.c!=null&&!B.aDc(n,t.d))t.ak(new B.aa4(t,n))
v=1
x=10
break
case 8:v=7
h=u.pop()
m=A.a9(h)
if(t.c!=null&&t.d==null)t.ak(new B.aa5(t,m))
x=10
break
case 7:x=1
break
case 10:return A.M(null,w)
case 1:return A.L(u.at(-1),w)}})
return A.N($async$qe,w)},
glk(){return!0},
I(d){var x,w,v,u,t,s,r=null
this.py(d)
x=A.V(d)
w=this.a.c.a?C.aQ:A.fE(d)
v=x.ok.r
u=v==null?r:v.r0(w.c,w.b)
v=x.aa.y
t=v==null?r:v.T(d.a4(y.o).w)
s=t==null?r:t.a
if(s==null)s=16
return A.ui(A.ds(A.c([A.GT(E.CI,A.bT("Academic Service",r,r,u)),A.FA(s),F.anY(C.cu,new A.fr(this.Zi(d),r),C.dw,C.b0)],y.u),C.au,C.D,C.a_),C.an)},
Zi(a2){var x,w,v,u,t,s,r,q,p,o,n,m,l,k,j,i=null,h=this.a.c,g=A.V(a2),f=g.ax,e=g.ok,d=h.a,a0=d?C.aQ:A.fE(a2),a1=e.w
if(a1==null)x=i
else x=a1.r1(C.K,d?1.18:1.2)
a1=e.z
if(a1==null)w=i
else{v=f.rx
w=a1.r_(v==null?f.k3:v,1.2)}a1=e.at
if(a1==null)u=i
else{v=f.as
u=a1.ce(v==null?f.z:v)}t=f.p3
if(t==null)t=f.k2
a1=f.Q
if(a1==null)a1=f.y
s=a1.hW(a0.d)
r=f.as
if(r==null)r=f.z
q=d?a0.e:a0.f
p=this.d
if(p!=null){a1=h.ch
v=h.CW
o=e.Q
if(o==null)o=i
else{n=f.rx
o=o.ce(n==null?f.k3:n)}n=y.u
o=A.c([A.bT("Service roles",i,i,o),A.c0(i,v,i)],n)
for(m=0;m<p.length;++m){l=A.c([],n)
if(m>0)l.push(new A.iC(i,v,i,i))
l.push(new B.KE(p[m],h,x,w,t,s,r,u,q,i))
C.b.N(o,l)}k=new A.bi(new A.au(a1,v,a1,h.cx),A.ds(o,C.au,C.D,C.a_),i)
j=D.xu}else{a1=this.e
v=h.fy
o=h.go
if(a1!=null){k=new A.bi(new A.au(v,o,v,o),A.i0(A.ds(A.c([D.m0,A.bT(J.c2(a1),i,i,i)],y.u),C.ao,C.D,C.a_),i,i),i)
j=D.xv}else{k=new A.bi(new A.au(v,o,v,o),F.apG(),i)
j=D.xw}}return G.DW(new A.fl(k,j),C.dy,new B.aa1(),C.i3,C.cC,G.aj8())}}
B.KE.prototype={
I(d){var x,w,v,u,t,s,r,q,p,o,n,m,l=this,k=null,j=l.d,i=j.a,h=l.c,g=h.i(0,"role"),f=g==null?k:J.c2(g)
if(f==null)f="Service"
g=h.i(0,"organization")
x=g==null?k:J.c2(g)
g=h.i(0,"location")
w=g==null?k:J.c2(g)
g=h.i(0,"year")
v=g==null?k:J.c2(g)
h=h.i(0,"link")
h=h==null?k:J.c2(h)
u=A.a9u(h==null?"":h)
h=A.eN(j.id)
g=u==null?k:new B.aa7(u)
t=j.db
s=j.dx
r=i?2:3
q=y.u
r=A.c([A.bT(f,r,C.ay,l.e)],q)
if(x!=null&&x.length!==0){p=A.c0(k,j.c+j.b,k)
o=i?2:3
C.b.N(r,A.c([p,A.bT(x,o,C.ay,l.f)],q))}p=w!=null
if(!(p&&w.length!==0))o=v!=null&&v.length!==0
else o=!0
if(o){o=A.c0(k,j.CW,k)
n=j.e
m=A.c([],q)
if(p&&w.length!==0)m.push(B.as9(l.w,l.x,H.lZ,l.z,w,l.y,j))
if(v!=null&&v.length!==0)m.push(B.as9(l.w,l.x,D.lY,l.z,v,l.y,j))
C.b.N(r,A.c([o,A.Kz(m,n,n)],q))}return A.fN(!1,C.Q,!0,h,A.jr(!1,k,!0,new A.bi(new A.au(t,s,t,s),A.ds(r,C.aD,C.D,C.a_),k),k,!0,k,k,k,k,k,k,k,k,k,g,k,k,k,k,k,k,k),C.an,l.r,0,k,k,k,k,k,C.aU)}}
B.Q4.prototype={
I(d){var x=this,w=null,v=x.e,u=A.eN(v.k2),t=v.as,s=v.at
return A.kt(new A.bi(new A.au(t,s,t,s),A.l9(A.c([A.pL(x.c,x.r,w,x.x),A.c0(w,w,v.ax),A.bT(x.d,w,w,x.w)],y.u),C.ao,C.D,C.bK,0),w),new A.d_(x.f,w,w,u,w,w,C.at),C.bc)}}
B.CP.prototype={
an(){this.aF()
this.ly()},
cJ(){var x=this.dJ$
if(x!=null){x.aE()
x.dR()
this.dJ$=null}this.jq()}}
var z=a.updateTypes([])
B.aa2.prototype={
$0(){var x=this.a
x.d=this.b
x.e=null},
$S:0}
B.aa3.prototype={
$0(){this.a.e=this.b},
$S:0}
B.aa4.prototype={
$0(){var x=this.a
x.d=this.b
x.e=null},
$S:0}
B.aa5.prototype={
$0(){this.a.e=this.b},
$S:0}
B.aa1.prototype={
$2(d,e){var x=A.Z(e,y.l)
if(d!=null)x.push(d)
return A.qY(C.cu,x,C.cZ)},
$S:160}
B.aa6.prototype={
$1(d){return y.B.a(d).fm(0,y.w,y.b)},
$S:161}
B.aa7.prototype={
$0(){return A.SG(this.a)},
$S:0};(function aliases(){var x=B.CP.prototype
x.XM=x.an})();(function inheritance(){var x=a.mixinHard,w=a.inherit,v=a.inheritMany
w(B.kj,A.X)
w(B.CP,A.a3)
w(B.KD,B.CP)
v(A.h6,[B.aa2,B.aa3,B.aa4,B.aa5,B.aa7])
w(B.aa1,A.jc)
w(B.aa6,A.eO)
v(A.al,[B.KE,B.Q4])
x(B.CP,A.j6)})()
A.oK(b.typeUniverse,JSON.parse('{"kj":{"X":[],"f":[]},"KD":{"a3":["kj"]},"KE":{"al":[],"f":[]},"Q4":{"al":[],"f":[]}}'))
var y={o:A.a1("dE"),u:A.a1("w<f>"),y:A.a1("aw<o,@>"),B:A.a1("aw<@,@>"),w:A.a1("o"),l:A.a1("f"),b:A.a1("@"),v:A.a1("~")};(function constants(){E.Cz=new A.cD(59078,"MaterialIcons",!1)
E.CI=new A.ew(E.Cz,null,null,null,null)})()};
(a=>{a["9GHAMUDRXPtFkkvp4UxaBU1c7M0="]=a.current})($__dart_deferred_initializers__);
//# sourceMappingURL=main.dart.js_6.part.js.map
