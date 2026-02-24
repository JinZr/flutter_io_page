((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,C,F,D,G,B={
azg(d){return new B.kx(d,null)},
atu(d){var x=J.mq(d,new B.abA(),y.y)
x=A.a0(x,x.$ti.h("at.E"))
x.$flags=1
return x},
aF8(d,e){var x
if(d===e)return!0
if(e==null||d.length!==e.length)return!1
for(x=0;x<d.length;++x)if(!A.pi(d[x],e[x]))return!1
return!0},
kx:function kx(d,e){this.c=d
this.a=e},
Lx:function Lx(d){var _=this
_.e=_.d=null
_.f=$
_.dZ$=d
_.c=_.a=null},
abw:function abw(d,e){this.a=d
this.b=e},
abx:function abx(d,e){this.a=d
this.b=e},
aby:function aby(d,e){this.a=d
this.b=e},
abz:function abz(d,e){this.a=d
this.b=e},
abv:function abv(){},
abA:function abA(){},
Ly:function Ly(d,e,f){this.c=d
this.d=e
this.a=f},
abB:function abB(d){this.a=d},
CX:function CX(d,e,f,g){var _=this
_.c=d
_.d=e
_.e=f
_.a=g},
DI:function DI(){}},E,H
J=c[1]
A=c[0]
C=c[2]
F=c[7]
D=c[11]
G=c[9]
B=a.updateHolder(c[5],B)
E=c[10]
H=c[12]
B.kx.prototype={
aj(){return new B.Lx(null)}}
B.Lx.prototype={
ao(){this.Ze()
this.qX()},
qX(){var x=0,w=A.O(y.v),v=1,u=[],t=this,s,r,q,p,o,n,m,l,k,j,i,h
var $async$qX=A.P(function(d,e){if(d===1){u.push(e)
x=v}for(;;)switch(x){case 0:t.a.toString
s=F.avJ()
v=3
x=6
return A.S(s.$1("academic_service_list.json"),$async$qX)
case 6:r=e
q=B.atu(r)
if(t.c!=null)t.am(new B.abw(t,q))
v=1
x=5
break
case 3:v=2
i=u.pop()
p=A.ad(i)
if(t.c!=null)t.am(new B.abx(t,p))
x=5
break
case 2:x=1
break
case 5:v=8
k=t.f
if(k===$){t.a.toString
j=$.alR()
t.f=j
k=j}x=11
return A.S(k.xS("academic_service_list.json"),$async$qX)
case 11:o=e
n=B.atu(o)
if(t.c!=null&&!B.aF8(n,t.d))t.am(new B.aby(t,n))
v=1
x=10
break
case 8:v=7
h=u.pop()
m=A.ad(h)
if(t.c!=null&&t.d==null)t.am(new B.abz(t,m))
x=10
break
case 7:x=1
break
case 10:return A.M(null,w)
case 1:return A.L(u.at(-1),w)}})
return A.N($async$qX,w)},
glP(){return!0},
J(d){var x,w,v,u,t=null
this.qh(d)
x=A.T(d)
w=x.ae.y
v=w==null?t:w.V(d.a9(y.o).w)
u=v==null?t:v.a
if(u==null)u=16
w=x.ok.r
w.toString
return A.uQ(A.dy(A.c([A.HI(E.D6,A.bN("Academic Service",t,t,w)),A.Gr(u),F.apL(C.c1,new A.fy(this.a_I(d),t),C.dH,C.b6)],y.u),C.az,C.E,C.a1),C.ao)},
a_I(d){var x,w,v,u,t,s,r,q,p=null,o=this.a.c,n=A.T(d),m=n.ax,l=this.d
if(l!=null){x=o.ch
w=o.CW
v=n.ok.Q
if(v==null)v=p
else{u=m.rx
v=v.cd(u==null?m.k3:u)}u=y.u
v=A.c([A.bN("Service roles",p,p,v),A.c2(p,w,p)],u)
for(t=0;t<l.length;++t){s=A.c([],u)
if(t>0)s.push(new A.h1(p,w,p,p))
s.push(new B.Ly(l[t],o,p))
C.b.N(v,s)}r=new A.bh(new A.ay(x,w,x,o.cx),A.dy(v,C.az,C.E,C.a1),p)
q=D.xP}else{x=this.e
w=o.fy
v=o.go
if(x!=null){r=new A.bh(new A.ay(w,v,w,v),A.ia(A.dy(A.c([D.m8,A.bN(J.c6(x),p,p,p)],y.u),C.ap,C.E,C.a1),p,p),p)
q=D.xQ}else{r=new A.bh(new A.ay(w,v,w,v),F.aru(),p)
q=D.xR}}return G.EN(new A.fs(r,q),C.f3,new B.abv(),C.ib,C.cL,G.akU())}}
B.Ly.prototype={
J(a3){var x,w,v,u,t,s,r,q,p,o,n,m,l,k,j,i,h,g,f,e=null,d=A.T(a3).ax,a0=A.T(a3).ok,a1=a3.a9(y.F),a2=(a1==null?C.dJ:a1).w
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
q=A.aaY(w==null?"":w)
w=a2.r
if(w==null)w=14
v=x?2:3
p=x?1.18:1.2
o=a2.wv(w+v,C.dN,p)
w=x?a0.Q:a0.z
if(w==null)n=e
else{v=d.rx
n=w.wu(v==null?d.k3:v,1.2)}w=d.p3
if(w==null)w=d.k2
v=A.ey(a1.id)
p=q==null?e:new B.abB(q)
m=a1.db
l=a1.dx
k=y.u
j=A.c([A.bN(u,x?2:3,C.aD,o)],k)
if(t!=null&&t.length!==0){i=A.c2(e,a1.c+a1.b,e)
C.b.N(j,A.c([i,A.bN(t,x?2:3,C.aD,n)],k))}i=s!=null
if(!(i&&s.length!==0))h=r!=null&&r.length!==0
else h=!0
if(h){h=A.c2(e,a1.CW,e)
g=a1.e
f=A.c([],k)
if(i&&s.length!==0)f.push(new B.CX(H.m6,s,a1,e))
if(r!=null&&r.length!==0)f.push(new B.CX(D.m5,r,a1,e))
C.b.N(j,A.c([h,A.Lt(f,g,g)],k))}return A.f2(!1,C.M,!0,v,A.jB(!1,e,!0,new A.bh(new A.ay(m,l,m,l),A.dy(j,C.aH,C.E,C.a1),e),e,!0,e,e,e,e,e,e,e,e,e,p,e,e,e,e,e,e,e),C.ao,w,0,e,e,e,e,e,C.aS)}}
B.CX.prototype={
J(d){var x,w,v,u,t,s,r,q=null,p=A.T(d).ax,o=A.T(d).ok,n=this.e,m=n.a,l=p.Q
l=(l==null?p.y:l).fZ(0.55)
x=A.ey(n.k2)
w=n.as
v=n.at
u=m?12:13
t=p.as
s=t==null
r=s?p.z:t
u=A.kT(this.c,r,q,u)
n=A.c2(q,q,n.ax)
r=m?o.ax:o.at
if(r==null)t=q
else t=r.cd(s?p.z:t)
return A.ie(new A.bh(new A.ay(w,v,w,v),A.jV(A.c([u,n,A.bN(this.d,q,q,t)],y.u),C.ap,C.E,C.by,0),q),new A.cK(l,q,q,x,q,q,C.an),C.b5)}}
B.DI.prototype={
ao(){this.aL()
this.m5()},
cV(){var x=this.dZ$
if(x!=null){x.aH()
x.e7()
this.dZ$=null}this.jH()}}
var z=a.updateTypes([])
B.abw.prototype={
$0(){var x=this.a
x.d=this.b
x.e=null},
$S:0}
B.abx.prototype={
$0(){this.a.e=this.b},
$S:0}
B.aby.prototype={
$0(){var x=this.a
x.d=this.b
x.e=null},
$S:0}
B.abz.prototype={
$0(){this.a.e=this.b},
$S:0}
B.abv.prototype={
$2(d,e){var x=A.a0(e,y.l)
if(d!=null)x.push(d)
return A.k1(C.c1,x,C.ct)},
$S:170}
B.abA.prototype={
$1(d){return y.B.a(d).fG(0,y.w,y.b)},
$S:171}
B.abB.prototype={
$0(){return A.TQ(this.a)},
$S:0};(function aliases(){var x=B.DI.prototype
x.Ze=x.ao})();(function inheritance(){var x=a.mixinHard,w=a.inherit,v=a.inheritMany
w(B.kx,A.Y)
w(B.DI,A.a4)
w(B.Lx,B.DI)
v(A.hh,[B.abw,B.abx,B.aby,B.abz,B.abB])
w(B.abv,A.jk)
w(B.abA,A.eV)
v(A.af,[B.Ly,B.CX])
x(B.DI,A.jd)})()
A.p8(b.typeUniverse,JSON.parse('{"kx":{"Y":[],"f":[]},"Lx":{"a4":["kx"]},"Ly":{"af":[],"f":[]},"CX":{"af":[],"f":[]}}'))
var y={F:A.a3("jo"),o:A.a3("dG"),u:A.a3("A<f>"),y:A.a3("aK<p,@>"),B:A.a3("aK<@,@>"),w:A.a3("p"),l:A.a3("f"),b:A.a3("@"),v:A.a3("~")};(function constants(){E.CY=new A.cB(59078,"MaterialIcons",!1)
E.D6=new A.eD(E.CY,null,null,null,null)})()};
(a=>{a["3goLHYSlsvUS14SXkcEOCYQo13E="]=a.current})($__dart_deferred_initializers__);
//# sourceMappingURL=main.dart.js_6.part.js.map
