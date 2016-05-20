
open SVG

val x2: int = 300
val y2: int = 300
fun fst (x: int * int) = x.1
fun snd (x: int * int) = x.2
			 
fun circleDraw (x: int * int): xsvg = 
    <xml>
      <line x1={show (fst x)} y1={show (snd x)} x2={show x2} y2={show y2} stroke="black"/></xml>
    
fun main (): transaction page = x<-source (0,0);
									 
    return <xml><body onmousemove={fn ev => set x (ev.ScreenX,ev.ScreenY)}>
      <div style="width:100; height:100">
        <dyn signal={x <- signal x; return <xml><svg width="800" height = "800">
	  <circle cx = {show x2} cy={show y2} r="80" stroke="black" fill="white"/>
	  {circleDraw x}
	</svg></xml>}/>
	    
      </div>
</body></xml>

