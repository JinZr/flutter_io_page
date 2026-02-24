((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,C,F,D,G,B={
azn(d){return new B.kz(d,null)},
atB(d){var x=J.mr(d,new B.abz(),y.y)
x=A.a0(x,x.$ti.h("at.E"))
x.$flags=1
return x},
aFc(d,e){var x
if(d===e)return!0
if(e==null||d.length!==e.length)return!1
for(x=0;x<d.length;++x)if(!A.pj(d[x],e[x]))return!1
return!0},
kz:function kz(d,e){this.c=d
this.a=e},
Lt:function Lt(d){var _=this
_.e=_.d=null
_.f=$
_.dX$=d
_.c=_.a=null},
abv:function abv(d,e){this.a=d
this.b=e},
abw:function abw(d,e){this.a=d
this.b=e},
abx:function abx(d,e){this.a=d
this.b=e},
aby:function aby(d,e){this.a=d
this.b=e},
abu:function abu(){},
abz:function abz(){},
Lu:function Lu(d,e,f){this.c=d
this.d=e
this.a=f},
abA:function abA(d){this.a=d},
CW:function CW(d,e,f,g){var _=this
_.c=d
_.d=e
_.e=f
_.a=g},
DH:function DH(){}},E,H
J=c[1]
A=c[0]
C=c[2]
F=c[7]
D=c[11]
G=c[9]
B=a.updateHolder(c[5],B)
E=c[10]
H=c[12]
B.kz.prototype={
ag(){return new B.Lt(null)}}
B.Lt.prototype={
an(){this.YY()
this.qP()},
qP(){var x=0,w=A.O(y.v),v=1,u=[],t=this,s,r,q,p,o,n,m,l,k,j,i,h
var $async$qP=A.P(function(d,e){if(d===1){u.push(e)
x=v}for(;;)switch(x){case 0:t.a.toString
s=F.avQ()
v=3
x=6
return A.S(s.$1("academic_service_list.json"),$async$qP)
case 6:r=e
q=B.atB(r)
if(t.c!=null)t.am(new B.abv(t,q))
v=1
x=5
break
case 3:v=2
i=u.pop()
p=A.ad(i)
if(t.c!=null)t.am(new B.abw(t,p))
x=5
break
case 2:x=1
break
case 5:v=8
k=t.f
if(k===$){t.a.toString
j=$.alX()
t.f=j
k=j}x=11
return A.S(k.xP("academic_service_list.json"),$async$qP)
case 11:o=e
n=B.atB(o)
if(t.c!=null&&!B.aFc(n,t.d))t.am(new B.abx(t,n))
v=1
x=10
break
case 8:v=7
h=u.pop()
m=A.ad(h)
if(t.c!=null&&t.d==null)t.am(new B.aby(t,m))
x=10
break
case 7:x=1
break
case 10:return A.M(null,w)
case 1:return A.L(u.at(-1),w)}})
return A.N($async$qP,w)},
glJ(){return!0},
J(d){var x,w,v,u,t=null
this.qa(d)
x=A.U(d)
w=x.ad.y
v=w==null?t:w.U(d.a8(y.o).w)
u=v==null?t:v.a
if(u==null)u=16
w=x.ok.r
w.toString
return A.uL(A.dy(A.c([A.HJ(E.D8,A.bN("Academic Service",t,t,w)),A.Gr(u),F.apR(C.c0,new A.fA(this.a_s(d),t),C.dH,C.b6)],y.u),C.az,C.E,C.a1),C.ao)},
a_s(d){var x,w,v,u,t,s,r,q,p=null,o=this.a.c,n=A.U(d),m=n.ax,l=this.d
if(l!=null){x=o.ch
w=o.CW
v=n.ok.Q
if(v==null)v=p
else{u=m.rx
v=v.cc(u==null?m.k3:u)}u=y.u
v=A.c([A.bN("Service roles",p,p,v),A.c1(p,w,p)],u)
for(t=0;t<l.length;++t){s=A.c([],u)
if(t>0)s.push(new A.h2(p,w,p,p))
s.push(new B.Lu(l[t],o,p))
C.b.N(v,s)}r=new A.bi(new A.ay(x,w,x,o.cx),A.dy(v,C.az,C.E,C.a1),p)
q=D.xQ}else{x=this.e
w=o.fy
v=o.go
if(x!=null){r=new A.bi(new A.ay(w,v,w,v),A.i8(A.dy(A.c([D.ma,A.bN(J.c6(x),p,p,p)],y.u),C.ap,C.E,C.a1),p,p),p)
q=D.xR}else{r=new A.bi(new A.ay(w,v,w,v),F.arC(),p)
q=D.xS}}return G.EN(new A.ft(r,q),C.dK,new B.abu(),C.ib,C.cL,G.al_())}}
B.Lu.prototype={
J(a3){var x,w,v,u,t,s,r,q,p,o,n,m,l,k,j,i,h,g,f,e=null,d=A.U(a3).ax,a0=A.U(a3).ok,a1=a3.a8(y.F),a2=(a1==null?C.dJ:a1).w
a1=this.d
x=a1.a
w=this.c
v=w.i(0,"role")
u=v==null?e:J.c6(v)
if(u==null)u="Service"
v=w.i(0,"organization")
t=v==null?e:J.c6(v)
v=w.i(0,"location")
s=v==null?e:J.c6(v)
v=w.i(0,"year")
r=v==null?e:J.c6(v)
w=w.i(0,"link")
w=w==null?e:J.c6(w)
q=A.aaW(w==null?"":w)
w=a2.r
if(w==null)w=14
v=x?2:3
p=x?1.18:1.2
o=a2.wu(w+v,C.dO,p)
w=x?a0.Q:a0.z
if(w==null)n=e
else{v=d.rx
n=w.wt(v==null?d.k3:v,1.2)}w=d.p3
if(w==null)w=d.k2
v=A.ez(a1.id)
p=q==null?e:new B.abA(q)
m=a1.db
l=a1.dx
k=y.u
j=A.c([A.bN(u,x?2:3,C.aD,o)],k)
if(t!=null&&t.length!==0){i=A.c1(e,a1.c+a1.b,e)
C.b.N(j,A.c([i,A.bN(t,x?2:3,C.aD,n)],k))}i=s!=null
if(!(i&&s.length!==0))h=r!=null&&r.length!==0
else h=!0
if(h){h=A.c1(e,a1.CW,e)
g=a1.e
f=A.c([],k)
if(i&&s.length!==0)f.push(new B.CW(H.m8,s,a1,e))
if(r!=null&&r.length!==0)f.push(new B.CW(D.m7,r,a1,e))
C.b.N(j,A.c([h,A.Lp(f,g,g)],k))}return A.f3(!1,C.M,!0,v,A.jC(!1,e,!0,new A.bi(new A.ay(m,l,m,l),A.dy(j,C.aH,C.E,C.a1),e),e,!0,e,e,e,e,e,e,e,e,e,p,e,e,e,e,e,e,e),C.ao,w,0,e,e,e,e,e,C.aP)}}
B.CW.prototype={
J(d){var x,w,v,u,t,s,r,q=null,p=A.U(d).ax,o=A.U(d).ok,n=this.e,m=n.a,l=p.Q
l=(l==null?p.y:l).fY(0.55)
x=A.ez(n.k2)
w=n.as
v=n.at
u=m?12:13
t=p.as
s=t==null
r=s?p.z:t
u=A.kV(this.c,r,q,u)
n=A.c1(q,q,n.ax)
r=m?o.ax:o.at
if(r==null)t=q
else t=r.cc(s?p.z:t)
return A.ib(new A.bi(new A.ay(w,v,w,v),A.jY(A.c([u,n,A.bN(this.d,q,q,t)],y.u),C.ap,C.E,C.by,0),q),new A.cK(l,q,q,x,q,q,C.an),C.b5)}}
B.DH.prototype={
an(){this.aH()
this.m_()},
cV(){var x=this.dX$
if(x!=null){x.aJ()
x.e6()
this.dX$=null}this.jD()}}
var z=a.updateTypes([])
B.abv.prototype={
$0(){var x=this.a
x.d=this.b
x.e=null},
$S:0}
B.abw.prototype={
$0(){this.a.e=this.b},
$S:0}
B.abx.prototype={
$0(){var x=this.a
x.d=this.b
x.e=null},
$S:0}
B.aby.prototype={
$0(){this.a.e=this.b},
$S:0}
B.abu.prototype={
$2(d,e){var x=A.a0(e,y.l)
if(d!=null)x.push(d)
return A.k3(C.c0,x,C.cs)},
$S:178}
B.abz.prototype={
$1(d){return y.B.a(d).fF(0,y.w,y.b)},
$S:162}
B.abA.prototype={
$0(){return A.TM(this.a)},
$S:0};(function aliases(){var x=B.DH.prototype
x.YY=x.an})();(function inheritance(){var x=a.mixinHard,w=a.inherit,v=a.inheritMany
w(B.kz,A.X)
w(B.DH,A.a3)
w(B.Lt,B.DH)
v(A.hh,[B.abv,B.abw,B.abx,B.aby,B.abA])
w(B.abu,A.jl)
w(B.abz,A.eV)
v(A.al,[B.Lu,B.CW])
x(B.DH,A.je)})()
A.p9(b.typeUniverse,JSON.parse('{"kz":{"X":[],"f":[]},"Lt":{"a3":["kz"]},"Lu":{"al":[],"f":[]},"CW":{"al":[],"f":[]}}'))
var y={F:A.a4("jp"),o:A.a4("dG"),u:A.a4("A<f>"),y:A.a4("aJ<p,@>"),B:A.a4("aJ<@,@>"),w:A.a4("p"),l:A.a4("f"),b:A.a4("@"),v:A.a4("~")};(function constants(){E.D_=new A.cB(59078,"MaterialIcons",!1)
E.D8=new A.eE(E.D_,null,null,null,null)})()};
(a=>{a["WvUPUWx7kLxJrWSUjVVUVbQsGnQ="]=a.current})($__dart_deferred_initializers__);
//# sourceMappingURL=main.dart.js_6.part.js.map
