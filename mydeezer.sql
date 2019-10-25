CREATE TABLE  "DEEZER_KEY" 
   (	"ID" NUMBER, 
	"APP_NAME" VARCHAR2(50) COLLATE "USING_NLS_COMP", 
	"APP_ID" VARCHAR2(100) COLLATE "USING_NLS_COMP", 
	"SECRET_KEY" VARCHAR2(100) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP"
/
CREATE OR REPLACE EDITIONABLE PACKAGE  "DEEZER_PKG" as 
 
procedure test ( 
   p_arg1 in varchar2 default null, 
   p_arg2 in number   default null); 
 
function test_func ( 
    p_arg1 in number ) 
    return varchar2; 
     
function get_token 
(pcode in VARCHAR2) 
return VARCHAR2;

function get_name
(atoken in VARCHAR2)
return VARCHAR2;

function get_lovedtrack
(atoken in VARCHAR2)
return VARCHAR2;

function get_nblist
(atoken in VARCHAR2)
return NUMBER;

end; 
/
CREATE OR REPLACE EDITIONABLE PACKAGE BODY  "DEEZER_PKG" is 
function TEST_FUNC(       P_ARG1 IN NUMBER 
) return VARCHAR2 
 
as 
begin 
 null; /* insert function code */ 
end TEST_FUNC; 
 
procedure TEST(       P_ARG1 IN VARCHAR2 
      ,P_ARG2 IN NUMBER 
) 
as 
begin 
 null; /* insert procedure code */ 
end TEST; 
 
function get_token 
(pcode in VARCHAR2) 
return VARCHAR2 
is 
 
    l_clob    CLOB;  
    l_values apex_json.t_values;  
    tkey  varchar2(100);  
    tappid varchar2(50); 
    tendpoint2 varchar2(1000); 
    atoken  varchar2(1000); 
 
BEGIN 
 
-- Retrieve API Key 
 
select APP_ID, SECRET_KEY  
into tappid, tkey 
from DEEZER_KEY; 
 
tendpoint2 := 'https://connect.deezer.com/oauth/access_token.php?app_id=' || 
               tappid  || 
               '&code=' || 
               pcode || 
               '&secret='|| 
               tkey || 
               '&output=json'; 
 
apex_web_service.g_request_headers(1).name  := 'Content-Type';  
apex_web_service.g_request_headers(1).value := 'application/json';  
 
l_clob := APEX_WEB_SERVICE.make_rest_request(  
    p_url         => tendpoint2 , 
    p_http_method => 'GET'       
);  
 
apex_json.parse(p_values => l_values,  
                p_source => l_clob );  
atoken := apex_json.get_varchar2(p_path=>'access_token',p0=> 1,p_values=>l_values);  
return  atoken; 
END; 

function get_name
(atoken in VARCHAR2)
return VARCHAR2
is

    l_clob    CLOB; 
    l_values apex_json.t_values; 
    tendpoint2 varchar2(1000);
    tname varchar2(2000);

BEGIN

tendpoint2 := 'https://api.deezer.com/user/me?access_token=' ||
               atoken;
apex_web_service.g_request_headers(1).name  := 'Content-Type'; 
apex_web_service.g_request_headers(1).value := 'application/json'; 

l_clob := APEX_WEB_SERVICE.make_rest_request( 
    p_url         => tendpoint2 ,
    p_http_method => 'GET'      
); 

apex_json.parse(p_values => l_values, 
                p_source => l_clob ); 
tname := apex_json.get_varchar2(p_path=>'name',p0=> 1,p_values=>l_values);

return tname;
EXCEPTION
when others then
  return 'unknown profile name';
END;

function get_lovedtrack
(atoken in VARCHAR2)
return VARCHAR2
is
 
    l_clob    CLOB; 
    tendpoint2 varchar2(1000);
    tname varchar2(2000);
    pid varchar2(100);    -- Loved traks id
    l_paths     APEX_T_VARCHAR2;

BEGIN

-- Retrieve API Key



tendpoint2 := 'https://api.deezer.com/user/me/playlists?access_token=' ||
               atoken;

apex_web_service.g_request_headers(1).name  := 'Content-Type'; 
apex_web_service.g_request_headers(1).value := 'application/json'; 

l_clob := APEX_WEB_SERVICE.make_rest_request( 
    p_url         => tendpoint2 ,
    p_http_method => 'GET'      
); 

--apex_json.parse(p_values => l_values, 
--                p_source => l_clob ); 
apex_json.parse(p_source => l_clob );
--tname := apex_json.get_varchar2(p_path=>'name',p0=> 1,p_values=>l_values);
--l_count := APEX_JSON.get_count(p_path => 'data');

l_paths := APEX_JSON.find_paths_like (p_return_path => 'data[%]',
                                        p_subpath     => '.is_loved_track',
                                        p_value       => 'true' );
pid := APEX_JSON.get_number(p_path => l_paths(1)||'.id'); 

return pid;
EXCEPTION
when others then
  return 'unknown Loved Tracks ID';
END;

function get_nblist
(atoken in VARCHAR2)
return NUMBER
is

    l_clob    CLOB; 
    tendpoint2 varchar2(1000);   
    l_count NUMBER;
    
BEGIN

tendpoint2 := 'https://api.deezer.com/user/me/playlists?limit=1000&access_token=' ||
               atoken;

apex_web_service.g_request_headers(1).name  := 'Content-Type'; 
apex_web_service.g_request_headers(1).value := 'application/json'; 

l_clob := APEX_WEB_SERVICE.make_rest_request( 
    p_url         => tendpoint2 ,
    p_http_method => 'GET'      
); 

apex_json.parse(p_source => l_clob );

l_count := APEX_JSON.get_count(p_path => 'data');
l_count := l_count - 1 ;    -- remove loved tracks
return l_count;
EXCEPTION
when others then
  return 0;
END;

end "DEEZER_PKG"; 
/

