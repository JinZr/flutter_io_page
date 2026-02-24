((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,C,F,D,G,B={
ayX(d){return new B.kv(d,null)},
ata(d){var x=J.mo(d,new B.abl(),y.y)
x=A.a_(x,x.$ti.h("at.E"))
x.$flags=1
return x},
aEP(d,e){var x
if(d===e)return!0
if(e==null||d.length!==e.length)return!1
for(x=0;x<d.length;++x)if(!A.pe(d[x],e[x]))return!1
return!0},
kv:function kv(d,e){this.c=d
this.a=e},
Lo:function Lo(d){var _=this
_.e=_.d=null
_.f=$
_.dX$=d
_.c=_.a=null},
abh:function abh(d,e){this.a=d
this.b=e},
abi:function abi(d,e){this.a=d
this.b=e},
abj:function abj(d,e){this.a=d
this.b=e},
abk:function abk(d,e){this.a=d
this.b=e},
abg:function abg(){},
abl:function abl(){},
Lp:function Lp(d,e,f){this.c=d
this.d=e
this.a=f},
abm:function abm(d){this.a=d},
CR:function CR(d,e,f,g){var _=this
_.c=d
_.d=e
_.e=f
_.a=g},
DC:function DC(){}},E,H
J=c[1]
A=c[0]
C=c[2]
F=c[7]
D=c[11]
G=c[9]
B=a.updateHolder(c[5],B)
E=c[10]
H=c[12]
B.kv.prototype={
ai(){return new B.Lo(null)}}
B.Lo.prototype={
ao(){this.YU()
this.qN()},
qN(){var x=0,w=A.O(y.v),v=1,u=[],t=this,s,r,q,p,o,n,m,l,k,j,i,h
var $async$qN=A.P(function(d,e){if(d===1){u.push(e)
x=v}for(;;)switch(x){case 0:t.a.toString
s=F.avp()
v=3
x=6
return A.S(s.$1("academic_service_list.json"),$async$qN)
case 6:r=e
q=B.ata(r)
if(t.c!=null)t.am(new B.abh(t,q))
v=1
x=5
break
case 3:v=2
i=u.pop()
p=A.ad(i)
if(t.c!=null)t.am(new B.abi(t,p))
x=5
break
case 2:x=1
break
case 5:v=8
k=t.f
if(k===$){t.a.toString
j=$.alz()
t.f=j
k=j}x=11
return A.S(k.xO("academic_service_list.json"),$async$qN)
case 11:o=e
n=B.ata(o)
if(t.c!=null&&!B.aEP(n,t.d))t.am(new B.abj(t,n))
v=1
x=10
break
case 8:v=7
h=u.pop()
m=A.ad(h)
if(t.c!=null&&t.d==null)t.am(new B.abk(t,m))
x=10
break
case 7:x=1
break
case 10:return A.M(null,w)
case 1:return A.L(u.at(-1),w)}})
return A.N($async$qN,w)},
glJ(){return!0},
J(d){var x,w,v,u,t=null
this.q8(d)
x=A.T(d)
w=x.ad.y
v=w==null?t:w.U(d.a8(y.o).w)
u=v==null?t:v.a
if(u==null)u=16
w=x.ok.r
w.toString
return A.uG(A.dx(A.c([A.HE(E.D5,A.bN("Academic Service",t,t,w)),A.Gn(u),F.aps(C.c0,new A.fx(this.a_o(d),t),C.dG,C.b6)],y.u),C.az,C.E,C.a1),C.ao)},
a_o(d){var x,w,v,u,t,s,r,q,p=null,o=this.a.c,n=A.T(d),m=n.ax,l=this.d
if(l!=null){x=o.ch
w=o.CW
v=n.ok.Q
if(v==null)v=p
else{u=m.rx
v=v.cc(u==null?m.k3:u)}u=y.u
v=A.c([A.bN("Service roles",p,p,v),A.c0(p,w,p)],u)
for(t=0;t<l.length;++t){s=A.c([],u)
if(t>0)s.push(new A.h0(p,w,p,p))
s.push(new B.Lp(l[t],o,p))
C.b.N(v,s)}r=new A.bh(new A.ay(x,w,x,o.cx),A.dx(v,C.az,C.E,C.a1),p)
q=D.xO}else{x=this.e
w=o.fy
v=o.go
if(x!=null){r=new A.bh(new A.ay(w,v,w,v),A.i7(A.dx(A.c([D.m8,A.bN(J.c5(x),p,p,p)],y.u),C.ap,C.E,C.a1),p,p),p)
q=D.xP}else{r=new A.bh(new A.ay(w,v,w,v),F.arc(),p)
q=D.xQ}}return G.EI(new A.fr(r,q),C.f3,new B.abg(),C.ia,C.cJ,G.akC())}}
B.Lp.prototype={
J(a3){var x,w,v,u,t,s,r,q,p,o,n,m,l,k,j,i,h,g,f,e=null,d=A.T(a3).ax,a0=A.T(a3).ok,a1=a3.a8(y.F),a2=(a1==null?C.dI:a1).w
a1=this.d
x=a1.a
w=this.c
v=w.i(0,"role")
u=v==null?e:J.c5(v)
if(u==null)u="Service"
v=w.i(0,"organization")
t=v==null?e:J.c5(v)
v=w.i(0,"location")
s=v==null?e:J.c5(v)
v=w.i(0,"year")
r=v==null?e:J.c5(v)
w=w.i(0,"link")
w=w==null?e:J.c5(w)
q=A.aaI(w==null?"":w)
w=a2.r
if(w==null)w=14
v=x?2:3
p=x?1.18:1.2
o=a2.wr(w+v,C.dM,p)
w=x?a0.Q:a0.z
if(w==null)n=e
else{v=d.rx
n=w.wq(v==null?d.k3:v,1.2)}w=d.p3
if(w==null)w=d.k2
v=A.ey(a1.id)
p=q==null?e:new B.abm(q)
m=a1.db
l=a1.dx
k=y.u
j=A.c([A.bN(u,x?2:3,C.aD,o)],k)
if(t!=null&&t.length!==0){i=A.c0(e,a1.c+a1.b,e)
C.b.N(j,A.c([i,A.bN(t,x?2:3,C.aD,n)],k))}i=s!=null
if(!(i&&s.length!==0))h=r!=null&&r.length!==0
else h=!0
if(h){h=A.c0(e,a1.CW,e)
g=a1.e
f=A.c([],k)
if(i&&s.length!==0)f.push(new B.CR(H.m6,s,a1,e))
if(r!=null&&r.length!==0)f.push(new B.CR(D.m5,r,a1,e))
C.b.N(j,A.c([h,A.Lk(f,g,g)],k))}return A.f2(!1,C.M,!0,v,A.jA(!1,e,!0,new A.bh(new A.ay(m,l,m,l),A.dx(j,C.aH,C.E,C.a1),e),e,!0,e,e,e,e,e,e,e,e,e,p,e,e,e,e,e,e,e),C.ao,w,0,e,e,e,e,e,C.aP)}}
B.CR.prototype={
J(d){var x,w,v,u,t,s,r,q=null,p=A.T(d).ax,o=A.T(d).ok,n=this.e,m=n.a,l=p.Q
l=(l==null?p.y:l).fY(0.55)
x=A.ey(n.k2)
w=n.as
v=n.at
u=m?12:13
t=p.as
s=t==null
r=s?p.z:t
u=A.kR(this.c,r,q,u)
n=A.c0(q,q,n.ax)
r=m?o.ax:o.at
if(r==null)t=q
else t=r.cc(s?p.z:t)
return A.ib(new A.bh(new A.ay(w,v,w,v),A.jV(A.c([u,n,A.bN(this.d,q,q,t)],y.u),C.ap,C.E,C.by,0),q),new A.cK(l,q,q,x,q,q,C.an),C.b5)}}
B.DC.prototype={
ao(){this.aL()
this.m_()},
cU(){var x=this.dX$
if(x!=null){x.aH()
x.e6()
this.dX$=null}this.jD()}}
var z=a.updateTypes([])
B.abh.prototype={
$0(){var x=this.a
x.d=this.b
x.e=null},
$S:0}
B.abi.prototype={
$0(){this.a.e=this.b},
$S:0}
B.abj.prototype={
$0(){var x=this.a
x.d=this.b
x.e=null},
$S:0}
B.abk.prototype={
$0(){this.a.e=this.b},
$S:0}
B.abg.prototype={
$2(d,e){var x=A.a_(e,y.l)
if(d!=null)x.push(d)
return A.k_(C.c0,x,C.cr)},
$S:170}
B.abl.prototype={
$1(d){return y.B.a(d).fF(0,y.w,y.b)},
$S:171}
B.abm.prototype={
$0(){return A.TF(this.a)},
$S:0};(function aliases(){var x=B.DC.prototype
x.YU=x.ao})();(function inheritance(){var x=a.mixinHard,w=a.inherit,v=a.inheritMany
w(B.kv,A.Y)
w(B.DC,A.a4)
w(B.Lo,B.DC)
v(A.hf,[B.abh,B.abi,B.abj,B.abk,B.abm])
w(B.abg,A.jj)
w(B.abl,A.eV)
v(A.ag,[B.Lp,B.CR])
x(B.DC,A.jc)})()
A.p4(b.typeUniverse,JSON.parse('{"kv":{"Y":[],"f":[]},"Lo":{"a4":["kv"]},"Lp":{"ag":[],"f":[]},"CR":{"ag":[],"f":[]}}'))
var y={F:A.a3("jn"),o:A.a3("dF"),u:A.a3("A<f>"),y:A.a3("aJ<p,@>"),B:A.a3("aJ<@,@>"),w:A.a3("p"),l:A.a3("f"),b:A.a3("@"),v:A.a3("~")};(function constants(){E.CX=new A.cB(59078,"MaterialIcons",!1)
E.D5=new A.eD(E.CX,null,null,null,null)})()};
(a=>{a["MrenAavuKVDvZ4XB5bxMbf+ZfeQ="]=a.current})($__dart_deferred_initializers__);
//# sourceMappingURL=main.dart.js_6.part.js.map
