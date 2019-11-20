<?php
include 'config.php';

$site = new csite();
initialize_site($site);
$page = new cpage("Your Digital Record System");
$site->setPage($page);


$content = "";

if(!isset($_SESSION['id']) && isset($_POST['username'])) {
    $content .= '<div class="article-clean">
                    <div class="d-flex justify-content-center">
                        <div class="spinner-grow text-warning" style="width: 10rem; height: 10rem;" role="status">
                        <span class="sr-only">Loading...</span>
                        </div>
                    </div>
            
                    <div class="text-center"><button type="button" class="btn btn-outline-warning">Loading...</button></div>
                </div>';
    $usr = new user;

    $post_data["username"] = $_POST['username'];
    $post_data["password"] = $_POST['password'];

    //echo $_POST['username'] . $_POST['password'];

    if($result = $usr->user_login($post_data)) {
        $url = "/index.php";
        //TODO: refractoring: use default case to handle string composition with base_url and 
        //distinguish just the case (like parent) that needs further actions to be taken.
        switch($usr->get_usergroup()){
            case "teacher":
                $url = "/usergroup/teacher/index.php";
                break;
            case "parent":
                $url = "/usergroup/parent/index.php";
                // Register children infos
                $sparent = new sparent();
                $sparent->retrieve_and_register_childs();
                break;
            case "officer":
                $url = "/usergroup/officer/index.php";
                break;
            case "TODO":
                //$url = "/TODO.php";
                break; 
        }
        $content .= "<meta http-equiv='refresh' content='1; url=" . PLATFORM_PATH . $url ."' />";
    } else {
        $usr->get_error(11);
    }
} else {
	$usr = new user();
	if($usr->is_logged()){
		// TODO reset refresh to 1 sec. Set to 5 for debug print
		$content .= "<meta http-equiv='refresh' content='5; url=" . PLATFORM_PATH . $usr->get_base_url() . "' />";
	}
}
$page->setContent($content);
$site->render();


?>
