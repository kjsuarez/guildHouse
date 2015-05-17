

// when js is commented out, select saves attributes normally, 
// when js included but strength left on first input it saves properly
// when js included but other deffined option selected, input doesnot save
window.onload = execute_all;

	//var z = assign_nums(); // => [1,20,11,1]
			
			
	function roll_d6(){ // number from 2 to 6
	 return Math.floor(Math.random() * 5) + 2
	}

	function dice(){
	    return [roll_d6(),roll_d6(),roll_d6(),roll_d6()];
	}
	
	function sorted_dice(){ // sorted array => [3,3,5,6]
   		var x = dice();   
   		x = x.sort(function(a, b) {return a - b;});
   		console.log("sorted dice: "+x)
    	return x;
	}

	function sum(x){ // gets the sum of all but the first value in an array
		var count = 1; var total = 0;
	    while(count < x.length){
	        total = total + x[count];
	        count +=1;
	    }
	    console.log("total "+total)
	    return total;
	}

	function ability_scores(){
    	var scores=[];
  		while(scores.length < 6){
        	x = sorted_dice();
       		var z = sum(x);
        	while(z < 10)	{ z = sum(sorted_dice()) }
        	scores = scores.concat(z);
        	console.log(scores);
    	}
    	return scores;
	}

	// assigns each option of each select it's element from the array of numbers
	function test_loop(z){
	    
	    var num = 1;
	    while (num < 7){
	      x = document.getElementById("character_strength");
	      x.options[num].text = z[num-1]; 
	      x.options[num].value = z[num-1]; 

	      x = document.getElementById("character_dexterity");
	      x.options[num].text = z[num-1];  
	      x.options[num].value = z[num-1].toString();
	     
	      x = document.getElementById("character_constitution");
	      x.options[num].text = z[num-1]; 
	      x.options[num].value = z[num-1]; 

	      x = document.getElementById("character_intelligence");
	      x.options[num].text = z[num-1]; 
	      x.options[num].value = z[num-1]; 

	      x = document.getElementById("character_wisdom");
	      x.options[num].text = z[num-1]; 
	      x.options[num].value = z[num-1]; 

	      x = document.getElementById("character_charisma");
	      x.options[num].text = z[num-1]; 
	      x.options[num].value = z[num-1]; 
	       
	       num = num+1;                
	    }
	}

// finds the index of the option you selected from the given select element
// for each select element enable the option that was just unselected, 
// then disables the newly selected option


	var last_str_index = 0
	var last_dex_index = 0
	var last_con_index = 0
	var last_int_index = 0
	var last_wis_index = 0
	var last_cha_index = 0
	
	function set_options(q){
	 	names = ["character_strength","character_dexterity",
	 	"character_constitution", "character_intelligence",
	 	"character_wisdom", "character_charisma"];
		var count = 0
	 
		while(count < names.length){
		 	var currentElement = document.getElementById(names[count])
		 	
		 	if (q == "character_strength") {
		 	currentElement.options[last_str_index].disabled = false};
			if (q == "character_dexterity") {
				currentElement.options[last_dex_index].disabled = false};
			if (q == "character_constitution") {
			 	currentElement.options[last_con_index].disabled = false};
			
			if (q == "character_intelligence") {
		 	currentElement.options[last_int_index].disabled = false};
		 	if (q == "character_wisdom") {
		 	currentElement.options[last_wis_index].disabled = false};
		 	if (q == "character_charisma") {
		 	currentElement.options[last_cha_index].disabled = false}; 	
			 	count +=1;
		};
		 	count = 0		 			 
		y = document.getElementById(q).selectedIndex; // index of selected option
		 
		if (q == "character_strength") {last_str_index = y};
		if (q == "character_dexterity") {last_dex_index = y};
		if (q == "character_constitution") {last_con_index = y};

		if (q == "character_intelligence") {last_int_index = y};
		if (q == "character_wisdom") {last_wis_index = y};
		if (q == "character_charisma") {last_cha_index = y};

		while(count < names.length){			    			   
		   if (names[count] != q) {
		   x = document.getElementById(names[count]);			
       
		   x.options[y].disabled = true;				   
		   };
		   count = count+1; 
		}
	}
	 
// the buffer functions only serve to house functions that need to be called 	from the DOM and also take input. For some reason I can't get this to work without a buffer function.
	function buffer_function(){  
	    var z = ability_scores();
	    test_loop(z);
	    execute_all();
	}

	function buffer_str_select(){
	    set_options("character_strength");
	}

	function buffer_dex_select(){
	    set_options("character_dexterity");
	}

	function buffer_con_select(){
	    set_options("character_constitution");
	}

	function buffer_int_select(){
	    set_options("character_intelligence");
	}

	function buffer_wis_select(){
	    set_options("character_wisdom");
	}

	function buffer_cha_select(){
	    set_options("character_charisma");
	}
	
	//document.getElementById("button").onclick = buffer_function;
	function execute_all(){

		console.log("here");
		document.getElementById("character_strength").oninput = buffer_str_select;
		document.getElementById("character_dexterity").oninput = buffer_dex_select;
		document.getElementById("character_constitution").oninput = buffer_con_select;
		
		document.getElementById("character_intelligence").oninput = buffer_int_select;
		document.getElementById("character_wisdom").oninput = buffer_wis_select;
		document.getElementById("character_charisma").oninput = buffer_cha_select;
	}
	



