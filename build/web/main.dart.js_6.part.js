((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,C,F,D,G,B={
azm(d){return new B.ky(d,null)},
atA(d){var x=J.mq(d,new B.abz(),y.y)
x=A.a0(x,x.$ti.h("at.E"))
x.$flags=1
return x},
aFb(d,e){var x
if(d===e)return!0
if(e==null||d.length!==e.length)return!1
for(x=0;x<d.length;++x)if(!A.pi(d[x],e[x]))return!1
return!0},
ky:function ky(d,e){this.c=d
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
B.ky.prototype={
ag(){return new B.Lt(null)}}
B.Lt.prototype={
an(){this.YY()
this.qQ()},
qQ(){var x=0,w=A.O(y.v),v=1,u=[],t=this,s,r,q,p,o,n,m,l,k,j,i,h
var $async$qQ=A.P(function(d,e){if(d===1){u.push(e)
x=v}for(;;)switch(x){case 0:t.a.toString
s=F.avP()
v=3
x=6
return A.S(s.$1("academic_service_list.json"),$async$qQ)
case 6:r=e
q=B.atA(r)
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
j=$.alW()
t.f=j
k=j}x=11
return A.S(k.xQ("academic_service_list.json"),$async$qQ)
case 11:o=e
n=B.atA(o)
if(t.c!=null&&!B.aFb(n,t.d))t.am(new B.abx(t,n))
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
return A.N($async$qQ,w)},
glJ(){return!0},
J(d){var x,w,v,u,t,s=null
this.qb(d)
x=A.U(d)
w=x.ok.r
v=w==null?s:w.oB(C.b7)
w=x.ad.y
u=w==null?s:w.U(d.a9(y.o).w)
t=u==null?s:u.a
if(t==null)t=16
return A.uL(A.dy(A.c([A.HJ(E.D8,A.bN("Academic Service",s,s,v)),A.Gr(t),F.apQ(C.c1,new A.fA(this.a_s(d),s),C.dI,C.b6)],y.u),C.az,C.E,C.a1),C.ao)},
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
q=D.xR}else{r=new A.bi(new A.ay(w,v,w,v),F.arB(),p)
q=D.xS}}return G.EN(new A.ft(r,q),C.dK,new B.abu(),C.i9,C.cM,G.al_())}}
B.Lu.prototype={
J(a2){var x,w,v,u,t,s,r,q,p,o,n,m,l,k,j,i=null,h=A.U(a2).ax,g=A.U(a2).ok,f=this.d,e=f.a,d=this.c,a0=d.i(0,"role"),a1=a0==null?i:J.c6(a0)
if(a1==null)a1="Service"
a0=d.i(0,"organization")
x=a0==null?i:J.c6(a0)
a0=d.i(0,"location")
w=a0==null?i:J.c6(a0)
a0=d.i(0,"year")
v=a0==null?i:J.c6(a0)
d=d.i(0,"link")
d=d==null?i:J.c6(d)
u=A.aaW(d==null?"":d)
d=e?g.x:g.w
if(d==null)t=i
else t=d.wv(C.S,e?1.18:1.2)
d=e?g.Q:g.z
if(d==null)s=i
else{a0=h.rx
s=d.wu(a0==null?h.k3:a0,1.2)}d=h.p3
if(d==null)d=h.k2
a0=A.ez(f.id)
r=u==null?i:new B.abA(u)
q=f.db
p=f.dx
o=y.u
n=A.c([A.bN(a1,e?2:3,C.aD,t)],o)
if(x!=null&&x.length!==0){m=A.c1(i,f.c+f.b,i)
C.b.N(n,A.c([m,A.bN(x,e?2:3,C.aD,s)],o))}m=w!=null
if(!(m&&w.length!==0))l=v!=null&&v.length!==0
else l=!0
if(l){l=A.c1(i,f.CW,i)
k=f.e
j=A.c([],o)
if(m&&w.length!==0)j.push(new B.CW(H.m8,w,f,i))
if(v!=null&&v.length!==0)j.push(new B.CW(D.m7,v,f,i))
C.b.N(n,A.c([l,A.Lp(j,k,k)],o))}return A.f3(!1,C.M,!0,a0,A.jB(!1,i,!0,new A.bi(new A.ay(q,p,q,p),A.dy(n,C.aH,C.E,C.a1),i),i,!0,i,i,i,i,i,i,i,i,i,r,i,i,i,i,i,i,i),C.ao,d,0,i,i,i,i,i,C.aP)}}
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
u=A.kU(this.c,r,q,u)
n=A.c1(q,q,n.ax)
r=m?o.ax:o.at
if(r==null)t=q
else t=r.cc(s?p.z:t)
return A.ib(new A.bi(new A.ay(w,v,w,v),A.jX(A.c([u,n,A.bN(this.d,q,q,t)],y.u),C.ap,C.E,C.bz,0),q),new A.cK(l,q,q,x,q,q,C.an),C.b5)}}
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
return A.k2(C.c1,x,C.ct)},
$S:136}
B.abz.prototype={
$1(d){return y.B.a(d).fF(0,y.w,y.b)},
$S:129}
B.abA.prototype={
$0(){return A.TM(this.a)},
$S:0};(function aliases(){var x=B.DH.prototype
x.YY=x.an})();(function inheritance(){var x=a.mixinHard,w=a.inherit,v=a.inheritMany
w(B.ky,A.X)
w(B.DH,A.a3)
w(B.Lt,B.DH)
v(A.hh,[B.abv,B.abw,B.abx,B.aby,B.abA])
w(B.abu,A.jl)
w(B.abz,A.eV)
v(A.al,[B.Lu,B.CW])
x(B.DH,A.je)})()
A.p8(b.typeUniverse,JSON.parse('{"ky":{"X":[],"f":[]},"Lt":{"a3":["ky"]},"Lu":{"al":[],"f":[]},"CW":{"al":[],"f":[]}}'))
var y={o:A.a4("dG"),u:A.a4("A<f>"),y:A.a4("aJ<p,@>"),B:A.a4("aJ<@,@>"),w:A.a4("p"),l:A.a4("f"),b:A.a4("@"),v:A.a4("~")};(function constants(){E.D_=new A.cB(59078,"MaterialIcons",!1)
E.D8=new A.eE(E.D_,null,null,null,null)})()};
(a=>{a["ahR1mGQ3yjRBM9E8jjZcjQvg3Ws="]=a.current})($__dart_deferred_initializers__);
//# sourceMappingURL=main.dart.js_6.part.js.map
