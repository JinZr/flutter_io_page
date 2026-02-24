((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,C,F,D,G,B={
azr(d){return new B.kA(d,null)},
atC(d){var x=J.ms(d,new B.abB(),y.y)
x=A.a0(x,x.$ti.h("at.E"))
x.$flags=1
return x},
aFg(d,e){var x
if(d===e)return!0
if(e==null||d.length!==e.length)return!1
for(x=0;x<d.length;++x)if(!A.pk(d[x],e[x]))return!1
return!0},
aud(d,e,f,g,h,i,j){return new B.R3(f,h,j,d,e,i,g,null)},
kA:function kA(d,e){this.c=d
this.a=e},
Ls:function Ls(d){var _=this
_.e=_.d=null
_.f=$
_.dX$=d
_.c=_.a=null},
abx:function abx(d,e){this.a=d
this.b=e},
aby:function aby(d,e){this.a=d
this.b=e},
abz:function abz(d,e){this.a=d
this.b=e},
abA:function abA(d,e){this.a=d
this.b=e},
abw:function abw(){},
abB:function abB(){},
Lt:function Lt(d,e,f,g,h,i,j,k,l,m){var _=this
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
abC:function abC(d){this.a=d},
R3:function R3(d,e,f,g,h,i,j,k){var _=this
_.c=d
_.d=e
_.e=f
_.f=g
_.r=h
_.w=i
_.x=j
_.a=k},
DG:function DG(){}},E,H
J=c[1]
A=c[0]
C=c[2]
F=c[7]
D=c[11]
G=c[9]
B=a.updateHolder(c[5],B)
E=c[10]
H=c[12]
B.kA.prototype={
ag(){return new B.Ls(null)}}
B.Ls.prototype={
an(){this.YX()
this.qQ()},
qQ(){var x=0,w=A.P(y.v),v=1,u=[],t=this,s,r,q,p,o,n,m,l,k,j,i,h
var $async$qQ=A.Q(function(d,e){if(d===1){u.push(e)
x=v}for(;;)switch(x){case 0:t.a.toString
s=F.avU()
v=3
x=6
return A.S(s.$1("academic_service_list.json"),$async$qQ)
case 6:r=e
q=B.atC(r)
if(t.c!=null)t.am(new B.abx(t,q))
v=1
x=5
break
case 3:v=2
i=u.pop()
p=A.ad(i)
if(t.c!=null)t.am(new B.aby(t,p))
x=5
break
case 2:x=1
break
case 5:v=8
k=t.f
if(k===$){t.a.toString
j=$.alY()
t.f=j
k=j}x=11
return A.S(k.xQ("academic_service_list.json"),$async$qQ)
case 11:o=e
n=B.atC(o)
if(t.c!=null&&!B.aFg(n,t.d))t.am(new B.abz(t,n))
v=1
x=10
break
case 8:v=7
h=u.pop()
m=A.ad(h)
if(t.c!=null&&t.d==null)t.am(new B.abA(t,m))
x=10
break
case 7:x=1
break
case 10:return A.N(null,w)
case 1:return A.M(u.at(-1),w)}})
return A.O($async$qQ,w)},
glK(){return!0},
J(d){var x,w,v,u,t,s,r=null
this.qb(d)
x=A.V(d)
w=this.a.c.a?C.aU:A.fN(d)
v=x.ok.r
u=v==null?r:v.oB(w.b)
v=x.ad.y
t=v==null?r:v.U(d.a9(y.o).w)
s=t==null?r:t.a
if(s==null)s=16
return A.uN(A.dz(A.c([A.HI(E.Da,A.bN("Academic Service",r,r,u)),A.Gq(s),F.apS(C.c1,new A.fA(this.a_r(d),r),C.dJ,C.b7)],y.u),C.az,C.E,C.a1),C.ao)},
a_r(a2){var x,w,v,u,t,s,r,q,p,o,n,m,l,k,j,i=null,h=this.a.c,g=A.V(a2),f=g.ax,e=g.ok,d=h.a,a0=d?C.aU:A.fN(a2),a1=d?e.x:e.w
if(a1==null)x=i
else x=a1.rD(C.Q,d?1.18:1.2)
a1=d?e.Q:e.z
if(a1==null)w=i
else{v=f.rx
w=a1.rC(v==null?f.k3:v,1.2)}a1=d?e.ax:e.at
if(a1==null)u=i
else{v=f.as
u=a1.ca(v==null?f.z:v)}t=f.p3
if(t==null)t=f.k2
a1=f.Q
if(a1==null)a1=f.y
s=a1.fY(a0.c)
r=f.as
if(r==null)r=f.z
q=d?a0.d:a0.e
p=this.d
if(p!=null){a1=h.ch
v=h.CW
o=e.Q
if(o==null)o=i
else{n=f.rx
o=o.ca(n==null?f.k3:n)}n=y.u
o=A.c([A.bN("Service roles",i,i,o),A.c1(i,v,i)],n)
for(m=0;m<p.length;++m){l=A.c([],n)
if(m>0)l.push(new A.h3(i,v,i,i))
l.push(new B.Lt(p[m],h,x,w,t,s,r,u,q,i))
C.b.N(o,l)}k=new A.bi(new A.ay(a1,v,a1,h.cx),A.dz(o,C.az,C.E,C.a1),i)
j=D.xS}else{a1=this.e
v=h.fy
o=h.go
if(a1!=null){k=new A.bi(new A.ay(v,o,v,o),A.ia(A.dz(A.c([D.md,A.bN(J.c9(a1),i,i,i)],y.u),C.ap,C.E,C.a1),i,i),i)
j=D.xT}else{k=new A.bi(new A.ay(v,o,v,o),F.arD(),i)
j=D.xU}}return G.EM(new A.ft(k,j),C.dL,new B.abw(),C.i9,C.cN,G.al1())}}
B.Lt.prototype={
J(d){var x,w,v,u,t,s,r,q,p,o,n,m,l=this,k=null,j=l.d,i=j.a,h=l.c,g=h.i(0,"role"),f=g==null?k:J.c9(g)
if(f==null)f="Service"
g=h.i(0,"organization")
x=g==null?k:J.c9(g)
g=h.i(0,"location")
w=g==null?k:J.c9(g)
g=h.i(0,"year")
v=g==null?k:J.c9(g)
h=h.i(0,"link")
h=h==null?k:J.c9(h)
u=A.aaY(h==null?"":h)
h=A.ez(j.id)
g=u==null?k:new B.abC(u)
t=j.db
s=j.dx
r=i?2:3
q=y.u
r=A.c([A.bN(f,r,C.aD,l.e)],q)
if(x!=null&&x.length!==0){p=A.c1(k,j.c+j.b,k)
o=i?2:3
C.b.N(r,A.c([p,A.bN(x,o,C.aD,l.f)],q))}p=w!=null
if(!(p&&w.length!==0))o=v!=null&&v.length!==0
else o=!0
if(o){o=A.c1(k,j.CW,k)
n=j.e
m=A.c([],q)
if(p&&w.length!==0)m.push(B.aud(l.w,l.x,H.mb,l.z,w,l.y,j))
if(v!=null&&v.length!==0)m.push(B.aud(l.w,l.x,D.ma,l.z,v,l.y,j))
C.b.N(r,A.c([o,A.Lo(m,n,n)],q))}return A.f3(!1,C.M,!0,h,A.jD(!1,k,!0,new A.bi(new A.ay(t,s,t,s),A.dz(r,C.aH,C.E,C.a1),k),k,!0,k,k,k,k,k,k,k,k,k,g,k,k,k,k,k,k,k),C.ao,l.r,0,k,k,k,k,k,C.aQ)}}
B.R3.prototype={
J(d){var x=this,w=null,v=x.e,u=A.ez(v.k2),t=v.as,s=v.at
return A.id(new A.bi(new A.ay(t,s,t,s),A.jZ(A.c([A.kW(x.c,x.r,w,x.x),A.c1(w,w,v.ax),A.bN(x.d,w,w,x.w)],y.u),C.ap,C.E,C.bz,0),w),new A.cK(x.f,w,w,u,w,w,C.an),C.b6)}}
B.DG.prototype={
an(){this.aH()
this.m0()},
cV(){var x=this.dX$
if(x!=null){x.aJ()
x.e6()
this.dX$=null}this.jD()}}
var z=a.updateTypes([])
B.abx.prototype={
$0(){var x=this.a
x.d=this.b
x.e=null},
$S:0}
B.aby.prototype={
$0(){this.a.e=this.b},
$S:0}
B.abz.prototype={
$0(){var x=this.a
x.d=this.b
x.e=null},
$S:0}
B.abA.prototype={
$0(){this.a.e=this.b},
$S:0}
B.abw.prototype={
$2(d,e){var x=A.a0(e,y.l)
if(d!=null)x.push(d)
return A.k4(C.c1,x,C.cu)},
$S:136}
B.abB.prototype={
$1(d){return y.B.a(d).fF(0,y.w,y.b)},
$S:129}
B.abC.prototype={
$0(){return A.TO(this.a)},
$S:0};(function aliases(){var x=B.DG.prototype
x.YX=x.an})();(function inheritance(){var x=a.mixinHard,w=a.inherit,v=a.inheritMany
w(B.kA,A.X)
w(B.DG,A.a3)
w(B.Ls,B.DG)
v(A.hj,[B.abx,B.aby,B.abz,B.abA,B.abC])
w(B.abw,A.jn)
w(B.abB,A.eV)
v(A.al,[B.Lt,B.R3])
x(B.DG,A.jg)})()
A.pa(b.typeUniverse,JSON.parse('{"kA":{"X":[],"f":[]},"Ls":{"a3":["kA"]},"Lt":{"al":[],"f":[]},"R3":{"al":[],"f":[]}}'))
var y={o:A.a4("dH"),u:A.a4("A<f>"),y:A.a4("aD<p,@>"),B:A.a4("aD<@,@>"),w:A.a4("p"),l:A.a4("f"),b:A.a4("@"),v:A.a4("~")};(function constants(){E.D1=new A.cB(59078,"MaterialIcons",!1)
E.Da=new A.eE(E.D1,null,null,null,null)})()};
(a=>{a["BY1RQvqCIOLfhEFYayaVpH4YYf8="]=a.current})($__dart_deferred_initializers__);
//# sourceMappingURL=main.dart.js_6.part.js.map
