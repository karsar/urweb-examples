datatype list t = Nil | Cons of t * list t

table aiki : {Technique: string, Executed: int, Updated: time}
		  PRIMARY KEY Technique


fun insert tech number = tim <- now;
    dml (UPDATE aiki SET Executed = {[number+1]}, Updated ={[tim]} WHERE Technique = {[tech]})

fun getRows () = query (SELECT * FROM aiki)
    (fn r acc => return (Cons ((r.Aiki.Technique, r.Aiki.Executed), acc)))
    Nil

fun check_rows (ls: list (string * int)) =
    case ls of
		Nil => True
		| Cons ((technique, executed), ls') => if executed > 5 then (check_rows ls) else False       
    
fun main() =    x <- getRows();
                rows <- queryX (SELECT * FROM aiki)
			    (fn row => if row.Aiki.Executed > 5 &&  row.Aiki.Executed < 30 then <xml>
			      <div style="color: red; margin-bottom: 6px;"> 
				<em>{[row.Aiki.Technique]}</em>: <strong><div style="color: blue">{[row.Aiki.Executed]}</div></strong> updated at {[row.Aiki.Updated]}
				<button value="Practiced Today" onclick={fn _ =>rpc (insert row.Aiki.Technique row.Aiki.Executed)}/>
		
				 </div> 
			    </xml>
				       else if row.Aiki.Executed > 30 then
					   <xml>
			      <div style="color: green; margin-bottom: 6px;">
				<em>{[row.Aiki.Technique]}</em>: <strong><div style="color: blue">{[row.Aiki.Executed]}</div></strong> updated at {[row.Aiki.Updated]}
			      	
				<button value="Practiced Today" onclick={fn _ =>rpc (insert row.Aiki.Technique row.Aiki.Executed)}/>
			
				 </div> 
			    </xml>
			    else <xml>
			      <div style="margin-bottom: 6px;">
				<em>{[row.Aiki.Technique]}</em>: <strong><div style="color: blue">{[row.Aiki.Executed]}</div></strong> updated at {[row.Aiki.Updated]}
			      	
				<button value="Practiced Today" onclick={fn _ =>rpc (insert row.Aiki.Technique row.Aiki.Executed)}/>
			
				</div>  
			    </xml>); if check_rows (x) then
    return <xml>
      
      <body style="text-align: center">
	<h1>Aiki JiuJitsu Techniques for 2 kyu:</h1>
	<h2> You are ready for level upgrade !!! </h2>
	{rows}
	<div style="text-align: bottom"><a link={main ()}>To see updated</a></div>
	</body>  
    </xml>     
				     else
					  return <xml>
      
      <body style="text-align: center">
	<h1>Aiki JiuJitsu Techniques for X level:</h1>
	<h2> You are not ready for level upgrade yet! </h2>
	{rows}
	<div style="text-align: bottom"><a link={main ()}>To see updated</a></div>
	</body>  
    </xml>   
