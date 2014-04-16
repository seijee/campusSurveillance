function addToList($name, $id ){
		$html = document.getElementById("memberList");
		$string  = '<li id="m'+$id+'" onclick=\'deleteFromList("'+$name+'","'+$id+'")\' >';
		$string	+= '<i class="gi gi-user_add"></i> '+$name+'<small> ['+$id+']</small>';
		$string += '<input value="'+$id+'" name="member_ids" class="hidden"/></li>';
		
		if ( $html.innerHTML.indexOf($id) < 0){
			$html.innerHTML = $html.innerHTML + $string;
		}
}
function toggleMembership($name, $id){
		$li = document.getElementById("m"+$id);
		if ($li.className == "notRemoving"){
			$li.className = "removing text-danger";
			$li.innerHTML = $li.innerHTML + '<input value="'+$id+'" name="remove_id" class="hidden"/></li>';
		}else if ($li.className.indexOf("removing")>=0){
			$li.className = "notRemoving";
			$li.removeChild($li.lastChild);
		}
}
function deleteFromList($name, $id){
		$li = document.getElementById("m"+$id);
		$li.parentNode.removeChild($li);
}