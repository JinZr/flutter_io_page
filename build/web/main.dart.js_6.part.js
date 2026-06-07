((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,C,F,D,G,B={
ayj(d){return new B.kj(d,null)},
asA(d){var x=J.mb(d,new B.ab1(),y.y)
x=A.Y(x,x.$ti.h("ar.E"))
x.$flags=1
return x},
aEh(d,e){var x
if(d===e)return!0
if(e==null||d.length!==e.length)return!1
for(x=0;x<d.length;++x)if(!A.p0(d[x],e[x]))return!1
return!0},
ata(d,e,f,g,h,i,j){return new B.QA(f,h,j,d,e,i,g,null)},
kj:function kj(d,e){this.c=d
this.a=e},
L7:function L7(d){var _=this
_.e=_.d=null
_.f=$
_.dM$=d
_.c=_.a=null},
aaY:function aaY(d,e){this.a=d
this.b=e},
aaZ:function aaZ(d,e){this.a=d
this.b=e},
ab_:function ab_(d,e){this.a=d
this.b=e},
ab0:function ab0(d,e){this.a=d
this.b=e},
aaX:function aaX(){},
ab1:function ab1(){},
L8:function L8(d,e,f,g,h,i,j,k,l,m){var _=this
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
ab2:function ab2(d){this.a=d},
QA:function QA(d,e,f,g,h,i,j,k){var _=this
_.c=d
_.d=e
_.e=f
_.f=g
_.r=h
_.w=i
_.x=j
_.a=k},
Dj:function Dj(){}},E,H
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
ah(){return new B.L7(null)}}
B.L7.prototype={
ap(){this.Ya()
this.qn()},
qn(){var x=0,w=A.P(y.v),v=1,u=[],t=this,s,r,q,p,o,n,m,l,k,j,i,h
var $async$qn=A.Q(function(d,e){if(d===1){u.push(e)
x=v}for(;;)switch(x){case 0:t.a.toString
s=F.auS()
v=3
x=6
return A.R(s.$1("academic_service_list.json"),$async$qn)
case 6:r=e
q=B.asA(r)
if(t.c!=null)t.ak(new B.aaY(t,q))
v=1
x=5
break
case 3:v=2
i=u.pop()
p=A.a2(i)
if(t.c!=null)t.ak(new B.aaZ(t,p))
x=5
break
case 2:x=1
break
case 5:v=8
k=t.f
if(k===$){t.a.toString
j=$.al8()
t.f=j
k=j}x=11
return A.R(k.ET("academic_service_list.json"),$async$qn)
case 11:o=e
n=B.asA(o)
if(t.c!=null&&!B.aEh(n,t.d))t.ak(new B.ab_(t,n))
v=1
x=10
break
case 8:v=7
h=u.pop()
m=A.a2(h)
if(t.c!=null&&t.d==null)t.ak(new B.ab0(t,m))
x=10
break
case 7:x=1
break
case 10:return A.N(null,w)
case 1:return A.M(u.at(-1),w)}})
return A.O($async$qn,w)},
glp(){return!0},
I(d){var x,w,v,u,t,s,r=null
this.pE(d)
x=A.V(d)
w=this.a.c.a?C.aU:A.fM(d)
v=x.ok.r
u=v==null?r:v.r8(w.c,w.b)
v=x.W.y
t=v==null?r:v.S(d.a6(y.o).w)
s=t==null?r:t.a
if(s==null)s=16
return A.uB(A.d4(A.c([A.Hm(E.CO,A.bX("Academic Service",r,r,u)),A.G1(s),F.ap4(C.cr,new A.fx(this.ZM(d),r),C.dx,C.b5)],y.u),C.at,C.D,C.W),C.ar)},
ZM(a2){var x,w,v,u,t,s,r,q,p,o,n,m,l,k,j,i=null,h=this.a.c,g=A.V(a2),f=g.ax,e=g.ok,d=h.a,a0=d?C.aU:A.fM(a2),a1=e.w
if(a1==null)x=i
else x=a1.r9(C.K,d?1.18:1.2)
a1=e.z
if(a1==null)w=i
else{v=f.rx
w=a1.r7(v==null?f.k3:v,1.2)}a1=e.at
if(a1==null)u=i
else{v=f.as
u=a1.cl(v==null?f.z:v)}t=f.p3
if(t==null)t=f.k2
a1=f.Q
if(a1==null)a1=f.y
s=a1.fK(a0.d)
r=f.as
if(r==null)r=f.z
q=d?a0.e:a0.f
p=this.d
if(p!=null){a1=h.ch
v=h.CW
o=e.Q
if(o==null)o=i
else{n=f.rx
o=o.cl(n==null?f.k3:n)}n=y.u
o=A.c([A.bX("Service roles",i,i,o),A.bQ(i,v,i)],n)
for(m=0;m<p.length;++m){l=A.c([],n)
if(m>0)l.push(new A.f6(i,v,i,i))
l.push(new B.L8(p[m],h,x,w,t,s,r,u,q,i))
C.b.M(o,l)}k=new A.bi(new A.au(a1,v,a1,h.cx),A.d4(o,C.at,C.D,C.W),i)
j=D.xC}else{a1=this.e
v=h.fy
o=h.go
if(a1!=null){k=new A.bi(new A.au(v,o,v,o),A.hd(A.d4(A.c([D.m7,A.bX(J.c4(a1),i,i,i)],y.u),C.as,C.D,C.W),i,i),i)
j=D.xD}else{k=new A.bi(new A.au(v,o,v,o),new F.yR(h,i),i)
j=D.xE}}return G.Em(new A.fq(k,j),C.dA,new B.aaX(),C.i6,C.cz,G.aka())}}
B.L8.prototype={
I(d){var x,w,v,u,t,s,r,q,p,o,n,m,l=this,k=null,j=l.d,i=j.a,h=l.c,g=h.i(0,"role"),f=g==null?k:J.c4(g)
if(f==null)f="Service"
g=h.i(0,"organization")
x=g==null?k:J.c4(g)
g=h.i(0,"location")
w=g==null?k:J.c4(g)
g=h.i(0,"year")
v=g==null?k:J.c4(g)
h=h.i(0,"link")
h=h==null?k:J.c4(h)
u=A.aam(h==null?"":h)
h=A.e0(j.id)
g=u==null?k:new B.ab2(u)
t=j.db
s=j.dx
r=i?2:3
q=y.u
r=A.c([A.bX(f,r,C.aB,l.e)],q)
if(x!=null&&x.length!==0){p=A.bQ(k,j.c+j.b,k)
o=i?2:3
C.b.M(r,A.c([p,A.bX(x,o,C.aB,l.f)],q))}p=w!=null
if(!(p&&w.length!==0))o=v!=null&&v.length!==0
else o=!0
if(o){o=A.bQ(k,j.CW,k)
n=j.e
m=A.c([],q)
if(p&&w.length!==0)m.push(B.ata(l.w,l.x,H.m5,l.z,w,l.y,j))
if(v!=null&&v.length!==0)m.push(B.ata(l.w,l.x,D.m4,l.z,v,l.y,j))
C.b.M(r,A.c([o,A.L3(m,n,n)],q))}return A.fW(!1,C.R,!0,h,A.jr(!1,k,!0,new A.bi(new A.au(t,s,t,s),A.d4(r,C.az,C.D,C.W),k),k,!0,k,k,k,k,k,k,k,k,k,g,k,k,k,k,k,k,k),C.ar,l.r,0,k,k,k,k,k,C.aZ)}}
B.QA.prototype={
I(d){var x=this,w=null,v=x.e,u=A.e0(v.k2),t=v.as,s=v.at
return A.i9(new A.bi(new A.au(t,s,t,s),A.lb(A.c([A.pU(x.c,x.r,w,x.x),A.bQ(w,w,v.ax),A.bX(x.d,w,w,x.w)],y.u),C.as,C.D,C.bH,0),w),new A.cO(x.f,w,w,u,w,w,C.al),C.aV)}}
B.Dj.prototype={
ap(){this.aI()
this.lF()},
cK(){var x=this.dM$
if(x!=null){x.aG()
x.dU()
this.dM$=null}this.jx()}}
var z=a.updateTypes([])
B.aaY.prototype={
$0(){var x=this.a
x.d=this.b
x.e=null},
$S:0}
B.aaZ.prototype={
$0(){this.a.e=this.b},
$S:0}
B.ab_.prototype={
$0(){var x=this.a
x.d=this.b
x.e=null},
$S:0}
B.ab0.prototype={
$0(){this.a.e=this.b},
$S:0}
B.aaX.prototype={
$2(d,e){var x=A.Y(e,y.l)
if(d!=null)x.push(d)
return A.r7(C.cr,x,C.cX)},
$S:175}
B.ab1.prototype={
$1(d){return y.B.a(d).fm(0,y.w,y.b)},
$S:176}
B.ab2.prototype={
$0(){return A.Tf(this.a)},
$S:0};(function aliases(){var x=B.Dj.prototype
x.Ya=x.ap})();(function inheritance(){var x=a.mixinHard,w=a.inherit,v=a.inheritMany
w(B.kj,A.X)
w(B.Dj,A.a4)
w(B.L7,B.Dj)
v(A.he,[B.aaY,B.aaZ,B.ab_,B.ab0,B.ab2])
w(B.aaX,A.jd)
w(B.ab1,A.eP)
v(A.ae,[B.L8,B.QA])
x(B.Dj,A.j6)})()
A.oS(b.typeUniverse,JSON.parse('{"kj":{"X":[],"f":[]},"L7":{"a4":["kj"]},"L8":{"ae":[],"f":[]},"QA":{"ae":[],"f":[]}}'))
var y={o:A.a1("dM"),u:A.a1("x<f>"),y:A.a1("az<o,@>"),B:A.a1("az<@,@>"),w:A.a1("o"),l:A.a1("f"),b:A.a1("@"),v:A.a1("~")};(function constants(){E.CF=new A.cL(59078,"MaterialIcons",!1)
E.CO=new A.ez(E.CF,null,null,null,null)})()};
(a=>{a["+gZXZtSnhMeCsLDgPBtsyklol6I="]=a.current})($__dart_deferred_initializers__);