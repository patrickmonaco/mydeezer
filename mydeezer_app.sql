prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_190100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2019.03.31'
,p_release=>'19.1.0.00.15'
,p_default_workspace_id=>9495462459447296
,p_default_application_id=>102
,p_default_owner=>'DEMO'
);
end;
/
 
prompt APPLICATION 102 - myDeezer
--
-- Application Export:
--   Application:     102
--   Name:            myDeezer
--   Date and Time:   11:48 Friday October 25, 2019
--   Exported By:     DEMO
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         19.1.0.00.15
--   Instance ID:     9495242628963597
--

-- Application Statistics:
--   Pages:                     20
--     Items:                   30
--     Validations:              1
--     Processes:               11
--     Regions:                 36
--     Buttons:                 20
--     Dynamic Actions:         10
--   Shared Components:
--     Logic:
--       Items:                  4
--       Computations:           1
--       App Settings:           1
--       Build Options:          3
--     Navigation:
--       Lists:                  4
--       Breadcrumbs:            1
--         Entries:              2
--     Security:
--       Authentication:         2
--       Authorization:          1
--     User Interface:
--       Themes:                 1
--       Templates:
--         Page:                 9
--         Region:              16
--         Label:                7
--         List:                12
--         Popup LOV:            1
--         Calendar:             1
--         Breadcrumb:           1
--         Button:               3
--         Report:              10
--       LOVs:                   5
--       Shortcuts:              1
--     Globalization:
--     Reports:
--     E-Mail:
--   Supporting Objects:  Included

prompt --application/delete_application
begin
wwv_flow_api.remove_flow(wwv_flow.g_flow_id);
end;
/
prompt --application/create_application
begin
wwv_flow_api.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_owner=>nvl(wwv_flow_application_install.get_schema,'DEMO')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'myDeezer')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'MYDEEZER')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'D578ED2C945D71800789D0A7259D7DD57A5825B9C54C6B8AC390CE82666A0544'
,p_bookmark_checksum_function=>'SH512'
,p_compatibility_mode=>'19.1'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_allow_feedback_yn=>'Y'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_documentation_banner=>'Application created from create application wizard 2019.10.22.'
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_api.id(19391955568164611)
,p_application_tab_set=>1
,p_logo_image=>'TEXT:myDeezer'
,p_app_builder_icon_name=>'app-icon.svg'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>'Release 1.0'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable at this time.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_substitution_string_01=>'APP_NAME'
,p_substitution_value_01=>'myDeezer'
,p_last_updated_by=>'DEMO'
,p_last_upd_yyyymmddhh24miss=>'20191025114533'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>3
,p_ui_type_name => null
);
end;
/
prompt --application/shared_components/remote_servers/api_deezer_com_playlist_pid
begin
wwv_flow_api.create_remote_server(
 p_id=>wwv_flow_api.id(19290358308630048)
,p_name=>'api-deezer-com-playlist-pid'
,p_static_id=>'api_deezer_com_playlist_pid'
,p_base_url=>nvl(wwv_flow_application_install.get_remote_server_base_url('api_deezer_com_playlist_pid'),'https://api.deezer.com/playlist/:pid')
,p_https_host=>nvl(wwv_flow_application_install.get_remote_server_https_host('api_deezer_com_playlist_pid'),'')
,p_server_type=>'WEB_SERVICE'
,p_ords_timezone=>nvl(wwv_flow_application_install.get_remote_server_ords_tz('api_deezer_com_playlist_pid'),'')
,p_prompt_on_install=>false
);
end;
/
prompt --application/shared_components/remote_servers/api_deezer_com_user_me
begin
wwv_flow_api.create_remote_server(
 p_id=>wwv_flow_api.id(19405893068951749)
,p_name=>'api-deezer-com-user-me'
,p_static_id=>'api_deezer_com_user_me'
,p_base_url=>nvl(wwv_flow_application_install.get_remote_server_base_url('api_deezer_com_user_me'),'https://api.deezer.com/user/me')
,p_https_host=>nvl(wwv_flow_application_install.get_remote_server_https_host('api_deezer_com_user_me'),'')
,p_server_type=>'WEB_SERVICE'
,p_ords_timezone=>nvl(wwv_flow_application_install.get_remote_server_ords_tz('api_deezer_com_user_me'),'')
,p_prompt_on_install=>false
);
end;
/
prompt --application/shared_components/data_profiles/tracks
begin
wwv_flow_api.create_data_profile(
 p_id=>wwv_flow_api.id(19290580959630051)
,p_name=>'Tracks'
,p_format=>'JSON'
,p_row_selector=>'data'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19290743974630059)
,p_data_profile_id=>wwv_flow_api.id(19290580959630051)
,p_name=>'ID'
,p_sequence=>1
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'id'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19291177611630061)
,p_data_profile_id=>wwv_flow_api.id(19290580959630051)
,p_name=>'LINK'
,p_sequence=>2
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'link'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19291563903630061)
,p_data_profile_id=>wwv_flow_api.id(19290580959630051)
,p_name=>'RANK'
,p_sequence=>3
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'rank'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19291946846630061)
,p_data_profile_id=>wwv_flow_api.id(19290580959630051)
,p_name=>'TYPE'
,p_sequence=>4
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'type'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19292321894630061)
,p_data_profile_id=>wwv_flow_api.id(19290580959630051)
,p_name=>'ID2'
,p_sequence=>5
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'album.id'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19292796037630061)
,p_data_profile_id=>wwv_flow_api.id(19290580959630051)
,p_name=>'TYPE2'
,p_sequence=>6
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'album.type'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19293148506630062)
,p_data_profile_id=>wwv_flow_api.id(19290580959630051)
,p_name=>'COVER'
,p_sequence=>7
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'album.cover'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19293551065630062)
,p_data_profile_id=>wwv_flow_api.id(19290580959630051)
,p_name=>'TITLE'
,p_sequence=>8
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'album.title'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19293984858630062)
,p_data_profile_id=>wwv_flow_api.id(19290580959630051)
,p_name=>'COVER_XL'
,p_sequence=>9
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'album.cover_xl'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19294342256630062)
,p_data_profile_id=>wwv_flow_api.id(19290580959630051)
,p_name=>'COVER_BIG'
,p_sequence=>10
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'album.cover_big'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19294728782630062)
,p_data_profile_id=>wwv_flow_api.id(19290580959630051)
,p_name=>'TRACKLIST'
,p_sequence=>11
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'album.tracklist'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19295191667630062)
,p_data_profile_id=>wwv_flow_api.id(19290580959630051)
,p_name=>'COVER_SMALL'
,p_sequence=>12
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'album.cover_small'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19295596959630063)
,p_data_profile_id=>wwv_flow_api.id(19290580959630051)
,p_name=>'COVER_MEDIUM'
,p_sequence=>13
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'album.cover_medium'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19295993365630063)
,p_data_profile_id=>wwv_flow_api.id(19290580959630051)
,p_name=>'TITLE2'
,p_sequence=>14
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'title'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19296321217630063)
,p_data_profile_id=>wwv_flow_api.id(19290580959630051)
,p_name=>'ID3'
,p_sequence=>15
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'artist.id'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19296709132630063)
,p_data_profile_id=>wwv_flow_api.id(19290580959630051)
,p_name=>'LINK2'
,p_sequence=>16
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'artist.link'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19297119143630063)
,p_data_profile_id=>wwv_flow_api.id(19290580959630051)
,p_name=>'NAME'
,p_sequence=>17
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'artist.name'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19297599079630063)
,p_data_profile_id=>wwv_flow_api.id(19290580959630051)
,p_name=>'TYPE3'
,p_sequence=>18
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'artist.type'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19297928470630064)
,p_data_profile_id=>wwv_flow_api.id(19290580959630051)
,p_name=>'PICTURE'
,p_sequence=>19
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'artist.picture'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19298357515630064)
,p_data_profile_id=>wwv_flow_api.id(19290580959630051)
,p_name=>'TRACKLIST2'
,p_sequence=>20
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'artist.tracklist'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19298717960630064)
,p_data_profile_id=>wwv_flow_api.id(19290580959630051)
,p_name=>'PICTURE_XL'
,p_sequence=>21
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'artist.picture_xl'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19299114720630064)
,p_data_profile_id=>wwv_flow_api.id(19290580959630051)
,p_name=>'PICTURE_BIG'
,p_sequence=>22
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'artist.picture_big'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19299580748630064)
,p_data_profile_id=>wwv_flow_api.id(19290580959630051)
,p_name=>'PICTURE_SMALL'
,p_sequence=>23
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'artist.picture_small'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19299902310630064)
,p_data_profile_id=>wwv_flow_api.id(19290580959630051)
,p_name=>'PICTURE_MEDIUM'
,p_sequence=>24
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'artist.picture_medium'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19300311304630065)
,p_data_profile_id=>wwv_flow_api.id(19290580959630051)
,p_name=>'PREVIEW'
,p_sequence=>25
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'preview'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19300764788630065)
,p_data_profile_id=>wwv_flow_api.id(19290580959630051)
,p_name=>'DURATION'
,p_sequence=>26
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'duration'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19301141520630065)
,p_data_profile_id=>wwv_flow_api.id(19290580959630051)
,p_name=>'READABLE'
,p_sequence=>27
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'readable'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19301582996630065)
,p_data_profile_id=>wwv_flow_api.id(19290580959630051)
,p_name=>'TIME_ADD'
,p_sequence=>28
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'time_add'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19301942021630065)
,p_data_profile_id=>wwv_flow_api.id(19290580959630051)
,p_name=>'TITLE_SHORT'
,p_sequence=>29
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'title_short'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19302373808630065)
,p_data_profile_id=>wwv_flow_api.id(19290580959630051)
,p_name=>'TITLE_VERSION'
,p_sequence=>30
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'title_version'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19302763460630066)
,p_data_profile_id=>wwv_flow_api.id(19290580959630051)
,p_name=>'EXPLICIT_LYRICS'
,p_sequence=>31
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'explicit_lyrics'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19303125310630066)
,p_data_profile_id=>wwv_flow_api.id(19290580959630051)
,p_name=>'EXPLICIT_CONTENT_COVER'
,p_sequence=>32
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'explicit_content_cover'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19303528222630066)
,p_data_profile_id=>wwv_flow_api.id(19290580959630051)
,p_name=>'EXPLICIT_CONTENT_LYRICS'
,p_sequence=>33
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'explicit_content_lyrics'
);
end;
/
prompt --application/shared_components/data_profiles/playlists
begin
wwv_flow_api.create_data_profile(
 p_id=>wwv_flow_api.id(19406037561951750)
,p_name=>'Playlists'
,p_format=>'JSON'
,p_row_selector=>'data'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19406276511951752)
,p_data_profile_id=>wwv_flow_api.id(19406037561951750)
,p_name=>'ID'
,p_sequence=>1
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'id'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19406674826951752)
,p_data_profile_id=>wwv_flow_api.id(19406037561951750)
,p_name=>'FANS'
,p_sequence=>2
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'fans'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19407016183951752)
,p_data_profile_id=>wwv_flow_api.id(19406037561951750)
,p_name=>'LINK'
,p_sequence=>3
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'link'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19407497787951753)
,p_data_profile_id=>wwv_flow_api.id(19406037561951750)
,p_name=>'TYPE'
,p_sequence=>4
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'type'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19407842812951753)
,p_data_profile_id=>wwv_flow_api.id(19406037561951750)
,p_name=>'TITLE'
,p_sequence=>5
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'title'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19408237649951753)
,p_data_profile_id=>wwv_flow_api.id(19406037561951750)
,p_name=>'PUBLIC_'
,p_sequence=>6
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'public'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19408663750951753)
,p_data_profile_id=>wwv_flow_api.id(19406037561951750)
,p_name=>'ID2'
,p_sequence=>7
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'creator.id'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19409005218951753)
,p_data_profile_id=>wwv_flow_api.id(19406037561951750)
,p_name=>'NAME'
,p_sequence=>8
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'creator.name'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19409469869951753)
,p_data_profile_id=>wwv_flow_api.id(19406037561951750)
,p_name=>'TYPE2'
,p_sequence=>9
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'creator.type'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19409886275951754)
,p_data_profile_id=>wwv_flow_api.id(19406037561951750)
,p_name=>'TRACKLIST'
,p_sequence=>10
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'creator.tracklist'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19410256349951754)
,p_data_profile_id=>wwv_flow_api.id(19406037561951750)
,p_name=>'PICTURE'
,p_sequence=>11
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'picture'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19410688520951754)
,p_data_profile_id=>wwv_flow_api.id(19406037561951750)
,p_name=>'CHECKSUM'
,p_sequence=>12
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'checksum'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19411010160951754)
,p_data_profile_id=>wwv_flow_api.id(19406037561951750)
,p_name=>'DURATION'
,p_sequence=>13
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'duration'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19411474475951754)
,p_data_profile_id=>wwv_flow_api.id(19406037561951750)
,p_name=>'TIME_ADD'
,p_sequence=>14
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'time_add'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19411852833951755)
,p_data_profile_id=>wwv_flow_api.id(19406037561951750)
,p_name=>'TIME_MOD'
,p_sequence=>15
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'time_mod'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19412231246951755)
,p_data_profile_id=>wwv_flow_api.id(19406037561951750)
,p_name=>'NB_TRACKS'
,p_sequence=>16
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'nb_tracks'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19412644441951755)
,p_data_profile_id=>wwv_flow_api.id(19406037561951750)
,p_name=>'TRACKLIST2'
,p_sequence=>17
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'tracklist'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19413080377951755)
,p_data_profile_id=>wwv_flow_api.id(19406037561951750)
,p_name=>'PICTURE_XL'
,p_sequence=>18
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'picture_xl'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19413474677951755)
,p_data_profile_id=>wwv_flow_api.id(19406037561951750)
,p_name=>'PICTURE_BIG'
,p_sequence=>19
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'picture_big'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19413883608951755)
,p_data_profile_id=>wwv_flow_api.id(19406037561951750)
,p_name=>'COLLABORATIVE'
,p_sequence=>20
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'collaborative'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19414204196951756)
,p_data_profile_id=>wwv_flow_api.id(19406037561951750)
,p_name=>'CREATION_DATE'
,p_sequence=>21
,p_data_type=>'DATE'
,p_format_mask=>'YYYY"-"MM"-"DD" "HH24":"MI":"SS'
,p_has_time_zone=>false
,p_selector=>'creation_date'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19414675463951756)
,p_data_profile_id=>wwv_flow_api.id(19406037561951750)
,p_name=>'PICTURE_SMALL'
,p_sequence=>22
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'picture_small'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19415045567951756)
,p_data_profile_id=>wwv_flow_api.id(19406037561951750)
,p_name=>'IS_LOVED_TRACK'
,p_sequence=>23
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'is_loved_track'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(19415463638951756)
,p_data_profile_id=>wwv_flow_api.id(19406037561951750)
,p_name=>'PICTURE_MEDIUM'
,p_sequence=>24
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'picture_medium'
);
end;
/
prompt --application/shared_components/web_sources/tracks
begin
wwv_flow_api.create_web_source_module(
 p_id=>wwv_flow_api.id(19303917643630071)
,p_name=>'Tracks'
,p_static_id=>'Tracks'
,p_web_source_type=>'HTTP_FEED'
,p_data_profile_id=>wwv_flow_api.id(19290580959630051)
,p_remote_server_id=>wwv_flow_api.id(19290358308630048)
,p_url_path_prefix=>'/tracks'
);
wwv_flow_api.create_web_source_param(
 p_id=>wwv_flow_api.id(19304686577630083)
,p_web_src_module_id=>wwv_flow_api.id(19303917643630071)
,p_name=>'pid'
,p_param_type=>'URL_PATTERN'
,p_value=>'192541761'
);
wwv_flow_api.create_web_source_param(
 p_id=>wwv_flow_api.id(19305067326630084)
,p_web_src_module_id=>wwv_flow_api.id(19303917643630071)
,p_name=>'access_token'
,p_param_type=>'QUERY_STRING'
,p_value=>'frjTt1FXtaFKSytZOiRVcHxaeFXftVL9JYyo6D7Nr2wlU07Pjpx'
);
wwv_flow_api.create_web_source_param(
 p_id=>wwv_flow_api.id(19321820613669204)
,p_web_src_module_id=>wwv_flow_api.id(19303917643630071)
,p_name=>'index'
,p_param_type=>'QUERY_STRING'
,p_is_required=>false
,p_value=>'1'
);
wwv_flow_api.create_web_source_param(
 p_id=>wwv_flow_api.id(19416963909954361)
,p_web_src_module_id=>wwv_flow_api.id(19303917643630071)
,p_name=>'limit'
,p_param_type=>'QUERY_STRING'
,p_is_required=>false
,p_value=>'5'
);
wwv_flow_api.create_web_source_operation(
 p_id=>wwv_flow_api.id(19304229168630077)
,p_web_src_module_id=>wwv_flow_api.id(19303917643630071)
,p_operation=>'GET'
,p_database_operation=>'FETCH_COLLECTION'
,p_url_pattern=>'.'
);
end;
/
prompt --application/shared_components/web_sources/playlists
begin
wwv_flow_api.create_web_source_module(
 p_id=>wwv_flow_api.id(19415804362951757)
,p_name=>'Playlists'
,p_static_id=>'Playlists'
,p_web_source_type=>'HTTP_FEED'
,p_data_profile_id=>wwv_flow_api.id(19406037561951750)
,p_remote_server_id=>wwv_flow_api.id(19405893068951749)
,p_url_path_prefix=>'/playlists'
);
wwv_flow_api.create_web_source_param(
 p_id=>wwv_flow_api.id(19416541849951759)
,p_web_src_module_id=>wwv_flow_api.id(19415804362951757)
,p_name=>'access_token'
,p_param_type=>'QUERY_STRING'
,p_is_required=>false
,p_value=>'frtQSUiJo5dio2Wk2NvaB0f9jYkSjsCvSoCw6j5WZyWanW7UBah'
);
wwv_flow_api.create_web_source_param(
 p_id=>wwv_flow_api.id(19480581478189614)
,p_web_src_module_id=>wwv_flow_api.id(19415804362951757)
,p_name=>'limit'
,p_param_type=>'QUERY_STRING'
,p_is_required=>false
,p_value=>'200'
,p_is_static=>true
);
wwv_flow_api.create_web_source_operation(
 p_id=>wwv_flow_api.id(19416136918951757)
,p_web_src_module_id=>wwv_flow_api.id(19415804362951757)
,p_operation=>'GET'
,p_database_operation=>'FETCH_COLLECTION'
,p_url_pattern=>'.'
);
end;
/
prompt --application/shared_components/navigation/lists/desktop_navigation_menu
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(19107274413620400)
,p_name=>'Desktop Navigation Menu'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(19246262647620638)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Home'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:'
,p_list_item_icon=>'fa-home'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(19382332817094297)
,p_list_item_display_sequence=>15
,p_list_item_link_text=>'Login'
,p_list_item_link_target=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-key'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'4'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(19283258086620706)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Administration'
,p_list_item_link_target=>'f?p=&APP_ID.:10000:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-user-wrench'
,p_list_item_disp_cond_type=>'NEVER'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(19418618367966255)
,p_list_item_display_sequence=>25
,p_list_item_link_text=>'Playlists[&GNBLIST.]'
,p_list_item_link_target=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-music'
,p_list_item_disp_cond_type=>'ITEM_CONTAINS_NO_SPACES'
,p_list_item_disp_condition=>'GUSER'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'6'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(19305732646639213)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Loved Tracks'
,p_list_item_link_target=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:2:P2_ID,P2_TITLE,P2_OFFSET,P2_LIMIT:&GLOVID.,Loved Tracks,1,200:'
,p_list_item_icon=>'fa-heart-o'
,p_list_item_disp_cond_type=>'ITEM_CONTAINS_NO_SPACES'
,p_list_item_disp_condition=>'GUSER'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(19402501866900596)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Infos'
,p_list_item_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-info-circle-o'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'5'
);
end;
/
prompt --application/shared_components/navigation/lists/desktop_navigation_bar
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(19235377548620553)
,p_name=>'Desktop Navigation Bar'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(19279871895620704)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Feedback'
,p_list_item_link_target=>'f?p=&APP_ID.:10010:&SESSION.::&DEBUG.:RP,10010:P10010_PAGE_ID:&APP_PAGE_ID.:'
,p_list_item_icon=>'fa-comment-o'
,p_list_text_02=>'icon-only'
,p_required_patch=>wwv_flow_api.id(19237283839620589)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(19280120000620704)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'About'
,p_list_item_icon=>'fa-question-circle-o'
,p_list_text_02=>'icon-only'
,p_required_patch=>wwv_flow_api.id(19237708892620589)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(19280697174620705)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Page Help'
,p_list_item_link_target=>'f?p=&APP_ID.:10021:&SESSION.::&DEBUG.::P10021_PAGE_ID:&APP_PAGE_ID.:'
,p_list_item_icon=>'fa-question-circle-o'
,p_parent_list_item_id=>wwv_flow_api.id(19280120000620704)
,p_list_text_02=>'icon-only'
,p_required_patch=>wwv_flow_api.id(19237708892620589)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(19281098229620705)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'---'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_api.id(19280120000620704)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(19281416324620705)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'About Page'
,p_list_item_link_target=>'f?p=&APP_ID.:10020:&SESSION.::&DEBUG.:10020'
,p_list_item_icon=>'fa-info-circle-o'
,p_parent_list_item_id=>wwv_flow_api.id(19280120000620704)
,p_required_patch=>wwv_flow_api.id(19237708892620589)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(19281778292620705)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'&GUSER.'
,p_list_item_link_target=>'#'
,p_list_item_icon=>'fa-user'
,p_list_text_02=>'has-username'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(19282269729620706)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'---'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_api.id(19281778292620705)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(19282673278620706)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>'Sign Out'
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_list_item_icon=>'fa-sign-out'
,p_parent_list_item_id=>wwv_flow_api.id(19281778292620705)
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
prompt --application/shared_components/navigation/lists/feedback
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(19284392209620710)
,p_name=>'Feedback'
,p_list_status=>'PUBLIC'
,p_required_patch=>wwv_flow_api.id(19237283839620589)
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(19284796798620710)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'User Feedback'
,p_list_item_link_target=>'f?p=&APP_ID.:10013:&SESSION.::&DEBUG.:10013:::'
,p_list_item_icon=>'fa-comment-o'
,p_list_text_01=>'Report of all feedback submitted by application users'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
prompt --application/shared_components/navigation/lists/activity_reports
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(19535076824209033)
,p_name=>'Activity Reports'
,p_list_status=>'PUBLIC'
,p_required_patch=>wwv_flow_api.id(19480732381208923)
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(19535450514209034)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Dashboard'
,p_list_item_link_target=>'f?p=&APP_ID.:10030:&SESSION.::&DEBUG.:10030:::'
,p_list_item_icon=>'fa-area-chart'
,p_list_text_01=>'View application activity metrics'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(19535835323209034)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Top Users'
,p_list_item_link_target=>'f?p=&APP_ID.:10031:&SESSION.::&DEBUG.:10031:::'
,p_list_item_icon=>'fa-user-chart'
,p_list_text_01=>'Report of page views aggregated by user'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(19536233145209034)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Application Error Log'
,p_list_item_link_target=>'f?p=&APP_ID.:10032:&SESSION.::&DEBUG.:10032:::'
,p_list_item_icon=>'fa-exclamation'
,p_list_text_01=>'Report of errors logged by this application'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(19536693358209034)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Page Performance'
,p_list_item_link_target=>'f?p=&APP_ID.:10033:&SESSION.::&DEBUG.:10033:::'
,p_list_item_icon=>'fa-file-chart'
,p_list_text_01=>'Report of activity and performance by application page'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(19537002468209034)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Page Views'
,p_list_item_link_target=>'f?p=&APP_ID.:10034:&SESSION.::&DEBUG.:RIR,10034:::'
,p_list_item_icon=>'fa-file-search'
,p_list_text_01=>'Report of each page view by user including date of access and elapsed time'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
prompt --application/shared_components/files/app_icon_svg
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '3C73766720786D6C6E733D22687474703A2F2F7777772E77332E6F72672F323030302F737667222076696577426F783D223020302036342036342220656E61626C652D6261636B67726F756E643D226E657720302030203634203634223E3C7374796C65';
wwv_flow_api.g_varchar2_table(2) := '20747970653D22746578742F637373223E2E7374307B6F7061636974793A302E363B66696C6C3A234646464646463B7D202E7374317B66696C6C3A234646464646463B7D202E7374327B6F7061636974793A302E343B66696C6C3A234646464646463B7D';
wwv_flow_api.g_varchar2_table(3) := '202E7374337B6F7061636974793A302E313B7D3C2F7374796C653E3C726563742077696474683D22363422206865696768743D223634222066696C6C3D2223354136384144222F3E3C7061746820636C6173733D227374302220643D224D323920323276';
wwv_flow_api.g_varchar2_table(4) := '2D3563302D2E3535322E3434382D3120312D316834632E35353220302031202E343438203120317635222F3E3C7061746820636C6173733D227374312220643D224D34312034372E35632D312E30343820302D322E3035362D2E3330322D332D2E383939';
wwv_flow_api.g_varchar2_table(5) := '2D312E38383920312E3139332D342E31313120312E3139332D3620302D312E38383920312E3139332D342E31313120312E3139332D3620302D312E39383520312E3235342D342E333320312E3138382D362E3238382D2E3139322D2E3232362D2E313539';
wwv_flow_api.g_varchar2_table(6) := '2D2E32382D2E3437312D2E3132312D2E3639372E31362D2E3232362E3437322D2E3237392E3639372D2E31323120312E37303920312E32303620332E37313520312E32303620352E3432342030202E3137332D2E3132322E3430332D2E3132322E353736';
wwv_flow_api.g_varchar2_table(7) := '203020312E37303920312E32303620332E37313520312E32303620352E3432342030202E3137332D2E3132322E3430332D2E3132322E353736203020312E37303920312E32303620332E37313520312E32303620352E3432342030202E3137332D2E3132';
wwv_flow_api.g_varchar2_table(8) := '322E3430332D2E3132322E353736203020312E37303920312E32303620332E37313520312E32303620352E3432342030202E3232362D2E3135392E3533382D2E3130352E3639372E313231732E3130352E3533382D2E3132312E363937632D312E303236';
wwv_flow_api.g_varchar2_table(9) := '2E3732342D322E31333320312E3039312D332E32383820312E3039317A222F3E3C7061746820636C6173733D227374322220643D224D3332203433762D3134632D342E39323820312E3531382D392E39303920332E31362D31342E37383120342E393234';
wwv_flow_api.g_varchar2_table(10) := '2D2E3539392E3231372D2E3834382E3933362D2E35303320312E34373120312E34343720322E32343520322E33393620342E38363920322E37333220372E3538376C31322E3535322E3031387A222F3E3C7061746820636C6173733D227374302220643D';
wwv_flow_api.g_varchar2_table(11) := '224D3332203433762D313463342E39323820312E35313820392E39303920332E31362031342E37383120342E3932342E3539392E3231372E3834382E3933362E35303320312E3437312D312E34343720322E3234352D322E33393620342E3836392D322E';
wwv_flow_api.g_varchar2_table(12) := '37333220372E3538376C2D31322E3535322E3031387A222F3E3C7061746820636C6173733D227374312220643D224D34322E3038352032322E393037632D2E3034382D2E3531342D2E3437392D2E3930372D2E3939362D2E393037682D31382E31373863';
wwv_flow_api.g_varchar2_table(13) := '2D2E35313620302D2E3934372E3339332D2E3939362E3930376C2D2E39313120392E37303963332E3635352D312E32363520372E3333332D322E3438382031302E3939362D332E36313620332E36363320312E31323820372E33343120322E3335312031';
wwv_flow_api.g_varchar2_table(14) := '302E39393620332E3631356C2D2E3931312D392E3730387A6D2D31342E30383520332E3539336330202E3237362D2E3232342E352D2E352E35682D33632D2E32373620302D2E352D2E3232342D2E352D2E35762D3263302D2E3237362E3232342D2E352E';
wwv_flow_api.g_varchar2_table(15) := '352D2E356833632E3237362030202E352E3232342E352E3576327A6D3620306330202E3237362D2E3232342E352D2E352E35682D33632D2E32373620302D2E352D2E3232342D2E352D2E35762D3263302D2E3237362E3232342D2E352E352D2E35683363';
wwv_flow_api.g_varchar2_table(16) := '2E3237362030202E352E3232342E352E3576327A6D3620306330202E3237362D2E3232342E352D2E352E35682D33632D2E32373620302D2E352D2E3232342D2E352D2E35762D3263302D2E3237362E3232342D2E352E352D2E356833632E323736203020';
wwv_flow_api.g_varchar2_table(17) := '2E352E3232342E352E3576327A222F3E3C7061746820643D224D34372E3238332033352E333935632D312E34343720322E3234352D322E33393620342E38372D322E37333220372E3538376C2D31322E3535312E3031382D31322E3535312D2E30313863';
wwv_flow_api.g_varchar2_table(18) := '2D2E3333372D322E3731382D312E3238362D352E3334322D322E3733322D372E3538376C2D2E3030352D2E303135632D2E3137342E3330372D2E3230342E3638392E30303520312E30313520312E34343720322E32343520322E33393620342E38372032';
wwv_flow_api.g_varchar2_table(19) := '2E37333220372E3538376C31322E3535312E3031382031322E3535312D2E303138632E3333372D322E37313820312E3238362D352E33343220322E3733322D372E3538372E32312D2E3332352E31382D2E3730382E3030352D312E3031356C2D2E303035';
wwv_flow_api.g_varchar2_table(20) := '2E3031357A4D34342E31312034362E353137632D2E3937372E3634352D322E30322E3938332D332E31312E3938332D312E30343820302D322E3035362D2E3330322D332D2E3839392D312E38383920312E3139332D342E31313120312E3139332D362030';
wwv_flow_api.g_varchar2_table(21) := '2D312E38383920312E3139332D342E31313120312E3139332D3620302D2E3835382E3534322D312E3738342E3832322D322E3731362E3837326C2D2E3336322E3031372D2E3436342D2E3033382D2E3138322D2E303139632D2E3832322D2E3131332D31';
wwv_flow_api.g_varchar2_table(22) := '2E36332D2E3431382D322E3338372D2E3931362D2E3131362E3032362D2E3232352E30392D2E3239392E3139352D2E3135392E3232362D2E3130352E3533382E3132312E36393720312E39353820312E33383120342E33303320312E34343720362E3238';
wwv_flow_api.g_varchar2_table(23) := '382E31393220312E38383920312E31393320342E31313120312E3139332036203020312E38383920312E31393320342E31313120312E31393320362030202E3934342E35393720312E3935322E3839392033202E38393920312E313535203020322E3236';
wwv_flow_api.g_varchar2_table(24) := '322D2E33363720332E3238382D312E3039312E3232362D2E3135392E32382D2E3437312E3132312D2E3639372D2E3037332D2E3130352D2E3138322D2E3136392D2E3239382D2E3139357A2220636C6173733D22737433222F3E3C2F7376673E';
wwv_flow_api.create_app_static_file(
 p_id=>wwv_flow_api.id(19236534909620585)
,p_file_name=>'app-icon.svg'
,p_mime_type=>'image/svg+xml'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/shared_components/files/app_icon_css
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2E6170702D69636F6E207B0A202020206261636B67726F756E642D696D6167653A2075726C286170702D69636F6E2E737667293B0A202020206261636B67726F756E642D7265706561743A206E6F2D7265706561743B0A202020206261636B67726F756E';
wwv_flow_api.g_varchar2_table(2) := '642D73697A653A20636F7665723B0A202020206261636B67726F756E642D706F736974696F6E3A203530253B0A202020206261636B67726F756E642D636F6C6F723A20233541363841443B0A7D';
wwv_flow_api.create_app_static_file(
 p_id=>wwv_flow_api.id(19236832775620588)
,p_file_name=>'app-icon.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/plugin_settings
begin
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(19104395396620388)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_RICH_TEXT_EDITOR'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(19104699843620390)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attribute_01=>'IG'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(19104943975620390)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attribute_01=>'modern'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(19105230809620390)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_CSS_CALENDAR'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(19105529035620390)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(19105866200620391)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IG'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(19106123058620391)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attribute_01=>'Y'
,p_attribute_03=>'N'
,p_attribute_05=>'SWITCH'
);
end;
/
prompt --application/shared_components/security/authorizations/administration_rights
begin
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(19238552167620591)
,p_name=>'Administration Rights'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return true;'
,p_error_message=>'Insufficient privileges, user is not an Administrator'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
end;
/
prompt --application/shared_components/navigation/navigation_bar
begin
null;
end;
/
prompt --application/shared_components/logic/application_items
begin
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(19474669449069235)
,p_name=>'GLOVID'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(19615492325854403)
,p_name=>'GNBLIST'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(19389769693113750)
,p_name=>'GTOKEN'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(19397933746843502)
,p_name=>'GUSER'
,p_protection_level=>'I'
);
end;
/
prompt --application/shared_components/logic/application_computations
begin
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(19399469280855500)
,p_computation_sequence=>10
,p_computation_item=>'GUSER'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'Not connected'
);
end;
/
prompt --application/shared_components/logic/application_settings
begin
wwv_flow_api.create_app_setting(
 p_id=>wwv_flow_api.id(19239270347620598)
,p_name=>'FEEDBACK_ATTACHMENTS_YN'
,p_value=>'Y'
,p_is_required=>'N'
,p_valid_values=>'Y, N'
,p_on_upgrade_keep_value=>true
,p_required_patch=>wwv_flow_api.id(19237283839620589)
);
end;
/
prompt --application/shared_components/navigation/tabs/standard
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/parent
begin
null;
end;
/
prompt --application/shared_components/user_interface/lovs/feedback_rating
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(19252741505620655)
,p_lov_name=>'FEEDBACK_RATING'
,p_lov_query=>'.'||wwv_flow_api.id(19252741505620655)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(19253047097620656)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Positive'
,p_lov_return_value=>'3'
,p_lov_template=>'<span title="#DISPLAY_VALUE#" aria-label="#DISPLAY_VALUE#"><span class="fa fa-smile-o fa-2x feedback-positive" aria-hidden="true" ></span></span>'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(19253441577620656)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Neutral'
,p_lov_return_value=>'2'
,p_lov_template=>'<span title="#DISPLAY_VALUE#" aria-label="#DISPLAY_VALUE#"><span class="fa fa-emoji-neutral fa-2x feedback-neutral" aria-hidden="true" ></span></span>'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(19253804560620656)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Negative'
,p_lov_return_value=>'1'
,p_lov_template=>'<span title="#DISPLAY_VALUE#" aria-label="#DISPLAY_VALUE#"><span class="fa fa-frown-o fa-2x feedback-negative" aria-hidden="true" ></span></span>'
);
end;
/
prompt --application/shared_components/user_interface/lovs/feedback_status
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(19262950304620668)
,p_lov_name=>'FEEDBACK_STATUS'
,p_lov_query=>'.'||wwv_flow_api.id(19262950304620668)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(19263237124620668)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'No Action'
,p_lov_return_value=>'0'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(19263652804620669)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Acknowledged'
,p_lov_return_value=>'1'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(19264074398620669)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Open'
,p_lov_return_value=>'3'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(19264497274620669)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'Closed'
,p_lov_return_value=>'4'
);
end;
/
prompt --application/shared_components/user_interface/lovs/login_remember_username
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(19241440366620621)
,p_lov_name=>'LOGIN_REMEMBER_USERNAME'
,p_lov_query=>'.'||wwv_flow_api.id(19241440366620621)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(19241864690620624)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Remember username'
,p_lov_return_value=>'Y'
);
end;
/
prompt --application/shared_components/user_interface/lovs/timeframe_4_weeks
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(19498132348208962)
,p_lov_name=>'TIMEFRAME (4 WEEKS)'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select disp,',
'      val as seconds',
' from table( apex_util.get_timeframe_lov_data )',
'order by insert_order'))
);
end;
/
prompt --application/shared_components/user_interface/lovs/view_as_report_chart
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(19533156873209031)
,p_lov_name=>'VIEW_AS_REPORT_CHART'
,p_lov_query=>'.'||wwv_flow_api.id(19533156873209031)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(19533448258209031)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Add Report Page'
,p_lov_return_value=>'REPORT'
,p_lov_template=>'<span class="fa fa-table" aria-hidden="true"></span><span class="u-VisuallyHidden">#DISPLAY_VALUE#</span>'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(19533835147209032)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Add Chart Page'
,p_lov_return_value=>'CHART'
,p_lov_template=>'<span class="fa fa-pie-chart" aria-hidden="true"></span><span class="u-VisuallyHidden">#DISPLAY_VALUE#</span>'
);
end;
/
prompt --application/pages/page_groups
begin
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(19239434542620600)
,p_group_name=>'Administration'
);
end;
/
prompt --application/comments
begin
null;
end;
/
prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
wwv_flow_api.create_menu(
 p_id=>wwv_flow_api.id(19106776380620394)
,p_name=>'Breadcrumb'
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(19106914282620395)
,p_short_name=>'Home'
,p_link=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.'
,p_page_id=>1
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(19284189717620709)
,p_short_name=>'Administration'
,p_link=>'f?p=&APP_ID.:10000:&SESSION.'
,p_page_id=>10000
);
end;
/
prompt --application/shared_components/user_interface/templates/page/left_side_column
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(19107591783620406)
,p_theme_id=>42
,p_name=>'Left Side Column'
,p_internal_name=>'LEFT_SIDE_COLUMN'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.leftSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-PageBody t-PageBody--showLeft t-PageBody--hideActions no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'<a href="#main" id="t_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding" role="banner">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" aria-label="#EXPAND_COLLAPSE_NAV_LABEL#" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Header-controlsIcon" aria-hidden="t'
||'rue"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">#NAVIGATION_BAR#</div>',
'  </div>',
'  <div class="t-Header-nav">#TOP_GLOBAL_NAVIGATION_LIST##REGION_POSITION_06#</div>',
'</header>',
''))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'#SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">#REGION_POSITION_01#</div>',
'    <div class="t-Body-side" id="t_Body_side">#REGION_POSITION_02#</div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      <main id="main" class="t-Body-mainContent">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-fullContent">#REGION_POSITION_08#</div>',
'        <div class="t-Body-contentInner">#BODY#</div>',
'      </main>',
'      <footer class="t-Footer" role="contentinfo">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">#REGION_POSITION_04#</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'      <span class="t-Icon a-Icon icon-user"></span>',
'      <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'    <span class="t-Icon #IMAGE#"></span>',
'    <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525196570560608698
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19107848943620412)
,p_page_template_id=>wwv_flow_api.id(19107591783620406)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19108165964620413)
,p_page_template_id=>wwv_flow_api.id(19107591783620406)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19108483233620413)
,p_page_template_id=>wwv_flow_api.id(19107591783620406)
,p_name=>'Left Column'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19108737867620413)
,p_page_template_id=>wwv_flow_api.id(19107591783620406)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19109059452620413)
,p_page_template_id=>wwv_flow_api.id(19107591783620406)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19109386724620414)
,p_page_template_id=>wwv_flow_api.id(19107591783620406)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19109646028620414)
,p_page_template_id=>wwv_flow_api.id(19107591783620406)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19109982699620414)
,p_page_template_id=>wwv_flow_api.id(19107591783620406)
,p_name=>'Before Content Body'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>8
);
end;
/
prompt --application/shared_components/user_interface/templates/page/left_and_right_side_columns
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(19110341888620421)
,p_theme_id=>42
,p_name=>'Left and Right Side Columns'
,p_internal_name=>'LEFT_AND_RIGHT_SIDE_COLUMNS'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.bothSideCols();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>',
'</head>',
'<body class="t-PageBody t-PageBody--showLeft no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'<a href="#main" id="t_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding" role="banner">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" aria-label="#EXPAND_COLLAPSE_NAV_LABEL#" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Header-controlsIcon" aria-hidden="t'
||'rue"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">#NAVIGATION_BAR#</div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>',
''))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'#SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">#REGION_POSITION_01#</div>',
'    <div class="t-Body-side" id="t_Body_side">#REGION_POSITION_02#</div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      <main id="main" class="t-Body-mainContent">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-fullContent">#REGION_POSITION_08#</div>',
'        <div class="t-Body-contentInner">#BODY#</div>',
'      </main>',
'      <footer class="t-Footer" role="contentinfo">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'  <div class="t-Body-actions" id="t_Body_actions">',
'    <button class="t-Body-actionsToggle" title="#EXPAND_COLLAPSE_SIDE_COL_LABEL#" id="t_Button_rightControlButton" type="button"><span class="t-Body-actionsControlsIcon" aria-hidden="true"></span></button>',
'    <div class="t-Body-actionsContent" role="complementary">#REGION_POSITION_03#</div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">#REGION_POSITION_04#</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'      <span class="t-Icon a-Icon icon-user"></span>',
'      <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'    <span class="t-Icon #IMAGE#"></span>',
'    <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525203692562657055
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19110680920620421)
,p_page_template_id=>wwv_flow_api.id(19110341888620421)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>6
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19110953333620421)
,p_page_template_id=>wwv_flow_api.id(19110341888620421)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19111247392620422)
,p_page_template_id=>wwv_flow_api.id(19110341888620421)
,p_name=>'Left Column'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>3
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19111522998620422)
,p_page_template_id=>wwv_flow_api.id(19110341888620421)
,p_name=>'Right Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>3
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19111807034620422)
,p_page_template_id=>wwv_flow_api.id(19110341888620421)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19112118030620422)
,p_page_template_id=>wwv_flow_api.id(19110341888620421)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>6
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19112470735620422)
,p_page_template_id=>wwv_flow_api.id(19110341888620421)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19112757692620422)
,p_page_template_id=>wwv_flow_api.id(19110341888620421)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19113052718620422)
,p_page_template_id=>wwv_flow_api.id(19110341888620421)
,p_name=>'Before Content Body'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>6
);
end;
/
prompt --application/shared_components/user_interface/templates/page/login
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(19113495258620423)
,p_theme_id=>42
,p_name=>'Login'
,p_internal_name=>'LOGIN'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.appLogin();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-PageBody--login no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD#>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #REGION_POSITION_01#',
'  #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'  <div class="t-Body-wrap">',
'    <div class="t-Body-col t-Body-col--main">',
'      <div class="t-Login-container" role="main">#BODY#</div>',
'    </div>',
'  </div>',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>6
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2099711150063350616
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19113711579620423)
,p_page_template_id=>wwv_flow_api.id(19113495258620423)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19114090944620423)
,p_page_template_id=>wwv_flow_api.id(19113495258620423)
,p_name=>'Body Header'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/master_detail
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(19114276887620423)
,p_theme_id=>42
,p_name=>'Marquee'
,p_internal_name=>'MASTER_DETAIL'
,p_is_popup=>false
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.stickyTableHeader#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#'))
,p_javascript_code_onload=>'apex.theme42.initializePage.masterDetail();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-PageBody t-PageBody--masterDetail t-PageBody--hideLeft no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'<a href="#main" id="t_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding" role="banner">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" aria-label="#EXPAND_COLLAPSE_NAV_LABEL#" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Header-controlsIcon" aria-hidden="t'
||'rue"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">#REGION_POSITION_01#</div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      <main id="main" class="t-Body-mainContent">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-fullContent">#REGION_POSITION_08#</div>',
'        <div class="t-Body-info" id="t_Body_info">#REGION_POSITION_02#</div>',
'        <div class="t-Body-contentInner" role="main">#BODY#</div>',
'      </main>',
'      <footer class="t-Footer" role="contentinfo">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'  <div class="t-Body-actions" id="t_Body_actions">',
'    <button class="t-Body-actionsToggle" title="#EXPAND_COLLAPSE_SIDE_COL_LABEL#" id="t_Button_rightControlButton" type="button"><span class="t-Body-actionsControlsIcon" aria-hidden="true"></span></button>',
'    <div class="t-Body-actionsContent" role="complementary">#REGION_POSITION_03#</div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">#REGION_POSITION_04#</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'      <span class="t-Icon a-Icon icon-user"></span>',
'      <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'    <span class="t-Icon #IMAGE#"></span>',
'    <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>1996914646461572319
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19114562476620424)
,p_page_template_id=>wwv_flow_api.id(19114276887620423)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19114846390620424)
,p_page_template_id=>wwv_flow_api.id(19114276887620423)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19115194415620424)
,p_page_template_id=>wwv_flow_api.id(19114276887620423)
,p_name=>'Master Detail'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19115419258620424)
,p_page_template_id=>wwv_flow_api.id(19114276887620423)
,p_name=>'Right Side Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19115737458620424)
,p_page_template_id=>wwv_flow_api.id(19114276887620423)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19116082270620424)
,p_page_template_id=>wwv_flow_api.id(19114276887620423)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19116382908620424)
,p_page_template_id=>wwv_flow_api.id(19114276887620423)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19116621454620424)
,p_page_template_id=>wwv_flow_api.id(19114276887620423)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19116907481620425)
,p_page_template_id=>wwv_flow_api.id(19114276887620423)
,p_name=>'Before Content Body'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
end;
/
prompt --application/shared_components/user_interface/templates/page/right_side_column
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(19117309870620425)
,p_theme_id=>42
,p_name=>'Right Side Column'
,p_internal_name=>'RIGHT_SIDE_COLUMN'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.rightSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8"> ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-PageBody t-PageBody--hideLeft no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'<a href="#main" id="t_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding" role="banner">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" aria-label="#EXPAND_COLLAPSE_NAV_LABEL#" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Header-controlsIcon" aria-hidden="t'
||'rue"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">#NAVIGATION_BAR#</div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">#REGION_POSITION_01#</div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      <main id="main" class="t-Body-mainContent">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-fullContent">#REGION_POSITION_08#</div>',
'        <div class="t-Body-contentInner">#BODY#</div>',
'      </main>',
'      <footer class="t-Footer" role="contentinfo">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'  <div class="t-Body-actions" id="t_Body_actions">',
'    <button class="t-Body-actionsToggle" aria-label="#EXPAND_COLLAPSE_SIDE_COL_LABEL#" title="#EXPAND_COLLAPSE_SIDE_COL_LABEL#" id="t_Button_rightControlButton" type="button"><span class="t-Body-actionsControlsIcon" aria-hidden="true"></span></button'
||'>',
'    <div class="t-Body-actionsContent" role="complementary">#REGION_POSITION_03#</div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">#REGION_POSITION_04#</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'      <span class="t-Icon a-Icon icon-user"></span>',
'      <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'    <span class="t-Icon #IMAGE#"></span>',
'    <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525200116240651575
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19117678563620425)
,p_page_template_id=>wwv_flow_api.id(19117309870620425)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19117930328620425)
,p_page_template_id=>wwv_flow_api.id(19117309870620425)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19118210852620425)
,p_page_template_id=>wwv_flow_api.id(19117309870620425)
,p_name=>'Right Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19118523942620425)
,p_page_template_id=>wwv_flow_api.id(19117309870620425)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19118880050620426)
,p_page_template_id=>wwv_flow_api.id(19117309870620425)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19119126179620426)
,p_page_template_id=>wwv_flow_api.id(19117309870620425)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19119480305620426)
,p_page_template_id=>wwv_flow_api.id(19117309870620425)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19119782848620426)
,p_page_template_id=>wwv_flow_api.id(19117309870620425)
,p_name=>'Before Content Body'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
end;
/
prompt --application/shared_components/user_interface/templates/page/wizard_modal_dialog
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(19120123963620426)
,p_theme_id=>42
,p_name=>'Wizard Modal Dialog'
,p_internal_name=>'WIZARD_MODAL_DIALOG'
,p_is_popup=>true
,p_javascript_code_onload=>'apex.theme42.initializePage.wizardModal();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-Dialog-page t-Dialog-page--wizard #DIALOG_CSS_CLASSES# #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD#>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Dialog" role="dialog" aria-label="#TITLE#">',
'  <div class="t-Dialog-header">#REGION_POSITION_01#</div>',
'  <div class="t-Dialog-bodyWrapperOut">',
'    <div class="t-Dialog-bodyWrapperIn">',
'      <div class="t-Dialog-body" role="main">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        #BODY#',
'      </div>',
'    </div>',
'  </div>',
'  <div class="t-Dialog-footer">#REGION_POSITION_03#</div>',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_theme_class_id=>3
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},''t-Dialog-page--wizard ''+#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_height=>'auto'
,p_dialog_width=>'720'
,p_dialog_max_width=>'960'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2120348229686426515
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19120495772620426)
,p_page_template_id=>wwv_flow_api.id(19120123963620426)
,p_name=>'Wizard Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19120700331620426)
,p_page_template_id=>wwv_flow_api.id(19120123963620426)
,p_name=>'Wizard Progress Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19121009424620427)
,p_page_template_id=>wwv_flow_api.id(19120123963620426)
,p_name=>'Wizard Buttons'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/modal_dialog
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(19121669008620427)
,p_theme_id=>42
,p_name=>'Modal Dialog'
,p_internal_name=>'MODAL_DIALOG'
,p_is_popup=>true
,p_javascript_code_onload=>'apex.theme42.initializePage.modalDialog();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-Dialog-page t-Dialog-page--standard #DIALOG_CSS_CLASSES# #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD#>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Dialog" role="dialog" aria-label="#TITLE#">',
'  <div class="t-Dialog-header">#REGION_POSITION_01#</div>',
'  <div class="t-Dialog-bodyWrapperOut">',
'    <div class="t-Dialog-bodyWrapperIn">',
'      <div class="t-Dialog-body" role="main">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        #BODY#',
'      </div>',
'    </div>',
'  </div>',
'  <div class="t-Dialog-footer">#REGION_POSITION_03#</div>',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>3
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},''t-Dialog-page--standard ''+#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_height=>'auto'
,p_dialog_width=>'720'
,p_dialog_max_width=>'960'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2098960803539086924
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19121991946620427)
,p_page_template_id=>wwv_flow_api.id(19121669008620427)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19122213943620427)
,p_page_template_id=>wwv_flow_api.id(19121669008620427)
,p_name=>'Dialog Header'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19122597946620427)
,p_page_template_id=>wwv_flow_api.id(19121669008620427)
,p_name=>'Dialog Footer'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/minimal_no_navigation
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(19123173280620428)
,p_theme_id=>42
,p_name=>'Minimal (No Navigation)'
,p_internal_name=>'MINIMAL_NO_NAVIGATION'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.noSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#  ',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-PageBody t-PageBody--hideLeft t-PageBody--hideActions no-anim #PAGE_CSS_CLASSES# t-PageBody--noNav" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'<a href="#main" id="t_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding" role="banner">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" aria-label="#EXPAND_COLLAPSE_NAV_LABEL#" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Icon fa fa-bars" aria-hidden="true"'
||'></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'</header>',
'    '))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">#REGION_POSITION_01#</div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      <main id="main" class="t-Body-mainContent">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-fullContent">#REGION_POSITION_08#</div>',
'        <div class="t-Body-contentInner">#BODY#</div>',
'      </main>',
'      <footer class="t-Footer" role="contentinfo">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">#REGION_POSITION_04#</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>',
''))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar t-NavigationBar--classic" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'      <span class="t-Icon a-Icon icon-user"></span>',
'      <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header" href="#LINK#">',
'    <span class="t-Icon #IMAGE#"></span>',
'    <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>4
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2977628563533209425
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19123457674620428)
,p_page_template_id=>wwv_flow_api.id(19123173280620428)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19123752829620428)
,p_page_template_id=>wwv_flow_api.id(19123173280620428)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19124028605620428)
,p_page_template_id=>wwv_flow_api.id(19123173280620428)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19124351008620428)
,p_page_template_id=>wwv_flow_api.id(19123173280620428)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19124695198620428)
,p_page_template_id=>wwv_flow_api.id(19123173280620428)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19124984293620428)
,p_page_template_id=>wwv_flow_api.id(19123173280620428)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19125252284620429)
,p_page_template_id=>wwv_flow_api.id(19123173280620428)
,p_name=>'Before Content Body'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/page/standard
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(19125694513620429)
,p_theme_id=>42
,p_name=>'Standard'
,p_internal_name=>'STANDARD'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.noSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-PageBody t-PageBody--hideLeft t-PageBody--hideActions no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'<a href="#main" id="t_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding" role="banner">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" aria-label="#EXPAND_COLLAPSE_NAV_LABEL#" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Header-controlsIcon" aria-hidden="t'
||'rue"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">#NAVIGATION_BAR#</div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>',
''))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">#REGION_POSITION_01#</div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      <main id="main" class="t-Body-mainContent">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-fullContent">#REGION_POSITION_08#</div>',
'        <div class="t-Body-contentInner">#BODY#</div>',
'      </main>',
'      <footer class="t-Footer" role="contentinfo">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">#REGION_POSITION_04#</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>',
''))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar t-NavigationBar--classic" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'      <span class="t-Icon a-Icon icon-user"></span>',
'      <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header" href="#LINK#">',
'    <span class="t-Icon #IMAGE#"></span>',
'    <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>1
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>4070909157481059304
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19125910712620429)
,p_page_template_id=>wwv_flow_api.id(19125694513620429)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19126224949620429)
,p_page_template_id=>wwv_flow_api.id(19125694513620429)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19126559026620429)
,p_page_template_id=>wwv_flow_api.id(19125694513620429)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19126853463620429)
,p_page_template_id=>wwv_flow_api.id(19125694513620429)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19127161619620430)
,p_page_template_id=>wwv_flow_api.id(19125694513620429)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19127461488620430)
,p_page_template_id=>wwv_flow_api.id(19125694513620429)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(19127759556620430)
,p_page_template_id=>wwv_flow_api.id(19125694513620429)
,p_name=>'Before Content Body'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/button/icon
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(19212414192620495)
,p_template_name=>'Icon'
,p_internal_name=>'ICON'
,p_template=>'<button class="t-Button t-Button--noLabel t-Button--icon #BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" title="#LABEL#" aria-label="#LABEL#"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"><'
||'/span></button>'
,p_hot_template=>'<button class="t-Button t-Button--noLabel t-Button--icon #BUTTON_CSS_CLASSES# t-Button--hot" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" title="#LABEL#" aria-label="#LABEL#"><span class="t-Icon #ICON_CSS_CLASSES#" aria-h'
||'idden="true"></span></button>'
,p_reference_id=>2347660919680321258
,p_translate_this_template=>'N'
,p_theme_class_id=>5
,p_theme_id=>42
);
end;
/
prompt --application/shared_components/user_interface/templates/button/text
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(19213196014620497)
,p_template_name=>'Text'
,p_internal_name=>'TEXT'
,p_template=>'<button onclick="#JAVASCRIPT#" class="t-Button #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#"><span class="t-Button-label">#LABEL#</span></button>'
,p_hot_template=>'<button onclick="#JAVASCRIPT#" class="t-Button t-Button--hot #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#"><span class="t-Button-label">#LABEL#</span></button>'
,p_reference_id=>4070916158035059322
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>42
);
end;
/
prompt --application/shared_components/user_interface/templates/button/text_with_icon
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(19213236022620498)
,p_template_name=>'Text with Icon'
,p_internal_name=>'TEXT_WITH_ICON'
,p_template=>'<button class="t-Button t-Button--icon #BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#"><span class="t-Icon t-Icon--left #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-Button-label">#LABEL#'
||'</span><span class="t-Icon t-Icon--right #ICON_CSS_CLASSES#" aria-hidden="true"></span></button>'
,p_hot_template=>'<button class="t-Button t-Button--icon #BUTTON_CSS_CLASSES# t-Button--hot" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#"><span class="t-Icon t-Icon--left #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-Button-'
||'label">#LABEL#</span><span class="t-Icon t-Icon--right #ICON_CSS_CLASSES#" aria-hidden="true"></span></button>'
,p_reference_id=>2081382742158699622
,p_translate_this_template=>'N'
,p_theme_class_id=>4
,p_preset_template_options=>'t-Button--iconRight'
,p_theme_id=>42
);
end;
/
prompt --application/shared_components/user_interface/templates/region/alert
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(19128129091620433)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-header">',
'        <h2 class="t-Alert-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'      </div>',
'      <div class="t-Alert-body">#BODY#</div>',
'    </div>',
'    <div class="t-Alert-buttons">#PREVIOUS##CLOSE##CREATE##NEXT#</div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Alert'
,p_internal_name=>'ALERT'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>21
,p_preset_template_options=>'t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--warning'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2039236646100190748
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(19128401488620437)
,p_plug_template_id=>wwv_flow_api.id(19128129091620433)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/blank_with_attributes
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(19131823225620443)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="#REGION_CSS_CLASSES#"> ',
'#PREVIOUS##BODY##SUB_REGIONS##NEXT#',
'</div>'))
,p_page_plug_template_name=>'Blank with Attributes'
,p_internal_name=>'BLANK_WITH_ATTRIBUTES'
,p_theme_id=>42
,p_theme_class_id=>7
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>4499993862448380551
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/blank_with_attributes_no_grid
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(19132053238620443)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="#REGION_CSS_CLASSES#"> ',
'#PREVIOUS##BODY##SUB_REGIONS##NEXT#',
'</div>'))
,p_page_plug_template_name=>'Blank with Attributes (No Grid)'
,p_internal_name=>'BLANK_WITH_ATTRIBUTES_NO_GRID'
,p_theme_id=>42
,p_theme_class_id=>7
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>3369790999010910123
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(19132303926620443)
,p_plug_template_id=>wwv_flow_api.id(19132053238620443)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(19132696285620444)
,p_plug_template_id=>wwv_flow_api.id(19132053238620443)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/buttons_container
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(19132834427620444)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ButtonRegion t-Form--floatLeft #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-ButtonRegion-wrap">',
'    <div class="t-ButtonRegion-col t-ButtonRegion-col--left"><div class="t-ButtonRegion-buttons">#PREVIOUS##CLOSE##DELETE#</div></div>',
'    <div class="t-ButtonRegion-col t-ButtonRegion-col--content">',
'      <h2 class="t-ButtonRegion-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'      #BODY#',
'      <div class="t-ButtonRegion-buttons">#CHANGE#</div>',
'    </div>',
'    <div class="t-ButtonRegion-col t-ButtonRegion-col--right"><div class="t-ButtonRegion-buttons">#EDIT##CREATE##NEXT#</div></div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Buttons Container'
,p_internal_name=>'BUTTONS_CONTAINER'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>17
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2124982336649579661
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(19133117240620444)
,p_plug_template_id=>wwv_flow_api.id(19132834427620444)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(19133451562620444)
,p_plug_template_id=>wwv_flow_api.id(19132834427620444)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/carousel_container
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(19135013278620445)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Region t-Region--carousel #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
' <div class="t-Region-header">',
'  <div class="t-Region-headerItems t-Region-headerItems--title">',
'    <span class="t-Region-headerIcon"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span></span>',
'    <h2 class="t-Region-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--buttons">#COPY##EDIT#<span class="js-maximizeButtonContainer"></span></div>',
' </div>',
' <div class="t-Region-bodyWrap">',
'   <div class="t-Region-buttons t-Region-buttons--top">',
'    <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'    <div class="t-Region-buttons-right">#NEXT#</div>',
'   </div>',
'   <div class="t-Region-body">',
'     #BODY#',
'   <div class="t-Region-carouselRegions">',
'     #SUB_REGIONS#',
'   </div>',
'   </div>',
'   <div class="t-Region-buttons t-Region-buttons--bottom">',
'    <div class="t-Region-buttons-left">#CLOSE##HELP#</div>',
'    <div class="t-Region-buttons-right">#DELETE##CHANGE##CREATE#</div>',
'   </div>',
' </div>',
'</div>'))
,p_sub_plug_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div data-label="#SUB_REGION_TITLE#" id="SR_#SUB_REGION_ID#">',
'  #SUB_REGION#',
'</div>'))
,p_page_plug_template_name=>'Carousel Container'
,p_internal_name=>'CAROUSEL_CONTAINER'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#plugins/com.oracle.apex.carousel/1.1/com.oracle.apex.carousel#MIN#.js?v=#APEX_VERSION#'))
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>5
,p_default_template_options=>'t-Region--showCarouselControls'
,p_preset_template_options=>'t-Region--hiddenOverflow'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2865840475322558786
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(19135312496620445)
,p_plug_template_id=>wwv_flow_api.id(19135013278620445)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(19135638557620445)
,p_plug_template_id=>wwv_flow_api.id(19135013278620445)
,p_name=>'Slides'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/collapsible
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(19142249258620449)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Region t-Region--hideShow #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
' <div class="t-Region-header">',
'  <div class="t-Region-headerItems  t-Region-headerItems--controls"><button class="t-Button t-Button--icon t-Button--hideShow" type="button"></button></div>',
'  <div class="t-Region-headerItems t-Region-headerItems--title">',
'    <h2 class="t-Region-title">#TITLE#</h2>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--buttons">#EDIT#</div>',
' </div>',
' <div class="t-Region-bodyWrap">',
'   <div class="t-Region-buttons t-Region-buttons--top">',
'    <div class="t-Region-buttons-left">#CLOSE#</div>',
'    <div class="t-Region-buttons-right">#CREATE#</div>',
'   </div>',
'   <div class="t-Region-body">',
'     #COPY#',
'     #BODY#',
'     #SUB_REGIONS#',
'     #CHANGE#',
'   </div>',
'   <div class="t-Region-buttons t-Region-buttons--bottom">',
'    <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'    <div class="t-Region-buttons-right">#NEXT#</div>',
'   </div>',
' </div>',
'</div>'))
,p_page_plug_template_name=>'Collapsible'
,p_internal_name=>'COLLAPSIBLE'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>1
,p_preset_template_options=>'is-expanded:t-Region--scrollBody'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2662888092628347716
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(19142511527620449)
,p_plug_template_id=>wwv_flow_api.id(19142249258620449)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(19142826651620449)
,p_plug_template_id=>wwv_flow_api.id(19142249258620449)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/content_block
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(19147675423620451)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ContentBlock #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-ContentBlock-header">',
'    <div class="t-ContentBlock-headerItems t-ContentBlock-headerItems--title">',
'      <span class="t-ContentBlock-headerIcon"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span></span>',
'      <h1 class="t-ContentBlock-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h1>',
'      #EDIT#',
'    </div>',
'    <div class="t-ContentBlock-headerItems t-ContentBlock-headerItems--buttons">#CHANGE#</div>',
'  </div>',
'  <div class="t-ContentBlock-body">#BODY#</div>',
'  <div class="t-ContentBlock-buttons">#PREVIOUS##NEXT#</div>',
'</div>',
''))
,p_page_plug_template_name=>'Content Block'
,p_internal_name=>'CONTENT_BLOCK'
,p_theme_id=>42
,p_theme_class_id=>21
,p_preset_template_options=>'t-ContentBlock--h1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2320668864738842174
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/hero
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(19149613375620452)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-HeroRegion #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-HeroRegion-wrap">',
'    <div class="t-HeroRegion-col t-HeroRegion-col--left"><span class="t-HeroRegion-icon t-Icon #ICON_CSS_CLASSES#"></span></div>',
'    <div class="t-HeroRegion-col t-HeroRegion-col--content">',
'      <h1 class="t-HeroRegion-title">#TITLE#</h1>',
'      #BODY#',
'    </div>',
'    <div class="t-HeroRegion-col t-HeroRegion-col--right"><div class="t-HeroRegion-form">#SUB_REGIONS#</div><div class="t-HeroRegion-buttons">#NEXT#</div></div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Hero'
,p_internal_name=>'HERO'
,p_theme_id=>42
,p_theme_class_id=>22
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2672571031438297268
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(19149988486620453)
,p_plug_template_id=>wwv_flow_api.id(19149613375620452)
,p_name=>'Region Body'
,p_placeholder=>'#BODY#'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/inline_dialog
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(19151727036620453)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#_parent">',
'<div id="#REGION_STATIC_ID#"  class="t-DialogRegion #REGION_CSS_CLASSES# js-regionDialog" #REGION_ATTRIBUTES# style="display:none" title="#TITLE#">',
'  <div class="t-DialogRegion-wrap">',
'    <div class="t-DialogRegion-bodyWrapperOut"><div class="t-DialogRegion-bodyWrapperIn"><div class="t-DialogRegion-body">#BODY#</div></div></div>',
'    <div class="t-DialogRegion-buttons">',
'       <div class="t-ButtonRegion t-ButtonRegion--dialogRegion">',
'         <div class="t-ButtonRegion-wrap">',
'           <div class="t-ButtonRegion-col t-ButtonRegion-col--left"><div class="t-ButtonRegion-buttons">#PREVIOUS##DELETE##CLOSE#</div></div>',
'           <div class="t-ButtonRegion-col t-ButtonRegion-col--right"><div class="t-ButtonRegion-buttons">#EDIT##CREATE##NEXT#</div></div>',
'         </div>',
'       </div>',
'    </div>',
'  </div>',
'</div>',
'</div>'))
,p_page_plug_template_name=>'Inline Dialog'
,p_internal_name=>'INLINE_DIALOG'
,p_theme_id=>42
,p_theme_class_id=>24
,p_default_template_options=>'js-modal:js-draggable:js-resizable'
,p_preset_template_options=>'js-dialog-size600x400'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2671226943886536762
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(19152040494620453)
,p_plug_template_id=>wwv_flow_api.id(19151727036620453)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/inline_popup
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(19154053425620454)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#_parent">',
'<div id="#REGION_STATIC_ID#"  class="t-DialogRegion #REGION_CSS_CLASSES# js-regionPopup" #REGION_ATTRIBUTES# style="display:none" title="#TITLE#">',
'  <div class="t-DialogRegion-wrap">',
'    <div class="t-DialogRegion-bodyWrapperOut"><div class="t-DialogRegion-bodyWrapperIn"><div class="t-DialogRegion-body">#BODY#</div></div></div>',
'    <div class="t-DialogRegion-buttons">',
'       <div class="t-ButtonRegion t-ButtonRegion--dialogRegion">',
'         <div class="t-ButtonRegion-wrap">',
'           <div class="t-ButtonRegion-col t-ButtonRegion-col--left"><div class="t-ButtonRegion-buttons">#PREVIOUS##DELETE##CLOSE#</div></div>',
'           <div class="t-ButtonRegion-col t-ButtonRegion-col--right"><div class="t-ButtonRegion-buttons">#EDIT##CREATE##NEXT#</div></div>',
'         </div>',
'       </div>',
'    </div>',
'  </div>',
'</div>',
'</div>'))
,p_page_plug_template_name=>'Inline Popup'
,p_internal_name=>'INLINE_POPUP'
,p_theme_id=>42
,p_theme_class_id=>24
,p_preset_template_options=>'js-dialog-size600x400'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>1483922538999385230
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(19154312231620454)
,p_plug_template_id=>wwv_flow_api.id(19154053425620454)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/interactive_report
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(19155944385620455)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="t-IRR-region #REGION_CSS_CLASSES#">',
'  <h2 class="u-VisuallyHidden" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'#PREVIOUS##BODY##SUB_REGIONS##NEXT#',
'</div>'))
,p_page_plug_template_name=>'Interactive Report'
,p_internal_name=>'INTERACTIVE_REPORT'
,p_theme_id=>42
,p_theme_class_id=>9
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2099079838218790610
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/login
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(19156553245620455)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Login-region t-Form--stretchInputs t-Form--labelsAbove #REGION_CSS_CLASSES#" id="#REGION_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-Login-header">',
'    <span class="t-Login-logo #ICON_CSS_CLASSES#"></span>',
'    <h1 class="t-Login-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h1>',
'  </div>',
'  <div class="t-Login-body">',
'    #BODY#',
'  </div>',
'  <div class="t-Login-buttons">',
'    #NEXT#',
'  </div>',
'  <div class="t-Login-links">',
'    #EDIT##CREATE#',
'  </div>',
'  #SUB_REGIONS#',
'</div>'))
,p_page_plug_template_name=>'Login'
,p_internal_name=>'LOGIN'
,p_theme_id=>42
,p_theme_class_id=>23
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2672711194551076376
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(19156823027620456)
,p_plug_template_id=>wwv_flow_api.id(19156553245620455)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/standard
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(19157096164620456)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Region #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
' <div class="t-Region-header">',
'  <div class="t-Region-headerItems t-Region-headerItems--title">',
'    <span class="t-Region-headerIcon"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span></span>',
'    <h2 class="t-Region-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--buttons">#COPY##EDIT#<span class="js-maximizeButtonContainer"></span></div>',
' </div>',
' <div class="t-Region-bodyWrap">',
'   <div class="t-Region-buttons t-Region-buttons--top">',
'    <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'    <div class="t-Region-buttons-right">#NEXT#</div>',
'   </div>',
'   <div class="t-Region-body">',
'     #BODY#',
'     #SUB_REGIONS#',
'   </div>',
'   <div class="t-Region-buttons t-Region-buttons--bottom">',
'    <div class="t-Region-buttons-left">#CLOSE##HELP#</div>',
'    <div class="t-Region-buttons-right">#DELETE##CHANGE##CREATE#</div>',
'   </div>',
' </div>',
'</div>',
''))
,p_page_plug_template_name=>'Standard'
,p_internal_name=>'STANDARD'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>8
,p_preset_template_options=>'t-Region--scrollBody'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>4070912133526059312
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(19157387103620456)
,p_plug_template_id=>wwv_flow_api.id(19157096164620456)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(19157697729620456)
,p_plug_template_id=>wwv_flow_api.id(19157096164620456)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/tabs_container
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(19163838539620459)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-TabsRegion #REGION_CSS_CLASSES# apex-tabs-region" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  #BODY#',
'  <div class="t-TabsRegion-items">',
'    #SUB_REGIONS#',
'  </div>',
'</div>'))
,p_sub_plug_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div data-label="#SUB_REGION_TITLE#" id="SR_#SUB_REGION_ID#">',
'  #SUB_REGION#',
'</div>'))
,p_page_plug_template_name=>'Tabs Container'
,p_internal_name=>'TABS_CONTAINER'
,p_javascript_file_urls=>'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#'
,p_theme_id=>42
,p_theme_class_id=>5
,p_preset_template_options=>'t-TabsRegion-mod--simple'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>3221725015618492759
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(19164188102620459)
,p_plug_template_id=>wwv_flow_api.id(19163838539620459)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(19164422166620459)
,p_plug_template_id=>wwv_flow_api.id(19163838539620459)
,p_name=>'Tabs'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/title_bar
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(19166411098620460)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="t-BreadcrumbRegion #REGION_CSS_CLASSES#"> ',
'  <div class="t-BreadcrumbRegion-body">',
'    <div class="t-BreadcrumbRegion-breadcrumb">',
'      #BODY#',
'    </div>',
'    <div class="t-BreadcrumbRegion-title">',
'      <h1 class="t-BreadcrumbRegion-titleText">#TITLE#</h1>',
'    </div>',
'  </div>',
'  <div class="t-BreadcrumbRegion-buttons">#PREVIOUS##CLOSE##DELETE##HELP##CHANGE##EDIT##COPY##CREATE##NEXT#</div>',
'</div>'))
,p_page_plug_template_name=>'Title Bar'
,p_internal_name=>'TITLE_BAR'
,p_theme_id=>42
,p_theme_class_id=>6
,p_default_template_options=>'t-BreadcrumbRegion--showBreadcrumb'
,p_preset_template_options=>'t-BreadcrumbRegion--useBreadcrumbTitle'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2530016523834132090
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/wizard_container
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(19167489375620460)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Wizard #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-Wizard-header">',
'    <h1 class="t-Wizard-title">#TITLE#</h1>',
'    <div class="u-Table t-Wizard-controls">',
'      <div class="u-Table-fit t-Wizard-buttons">#PREVIOUS##CLOSE#</div>',
'      <div class="u-Table-fill t-Wizard-steps">',
'        #BODY#',
'      </div>',
'      <div class="u-Table-fit t-Wizard-buttons">#NEXT#</div>',
'    </div>',
'  </div>',
'  <div class="t-Wizard-body">',
'    #SUB_REGIONS#',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Wizard Container'
,p_internal_name=>'WIZARD_CONTAINER'
,p_theme_id=>42
,p_theme_class_id=>8
,p_preset_template_options=>'t-Wizard--hideStepsXSmall'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2117602213152591491
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(19167702086620461)
,p_plug_template_id=>wwv_flow_api.id(19167489375620460)
,p_name=>'Wizard Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/list/badge_list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(19189554049620475)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item #A02#">',
'  <a class="t-BadgeList-wrap u-color #A04#" href="#LINK#" #A03#>',
'  <span class="t-BadgeList-label">#TEXT#</span>',
'  <span class="t-BadgeList-value">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item #A02#">',
'  <a class="t-BadgeList-wrap u-color #A04#" href="#LINK#" #A03#>',
'  <span class="t-BadgeList-label">#TEXT#</span>',
'  <span class="t-BadgeList-value">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_name=>'Badge List'
,p_internal_name=>'BADGE_LIST'
,p_theme_id=>42
,p_theme_class_id=>3
,p_preset_template_options=>'t-BadgeList--large:t-BadgeList--cols t-BadgeList--3cols:t-BadgeList--circular'
,p_list_template_before_rows=>'<ul class="t-BadgeList #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Value'
,p_a02_label=>'List item CSS Classes'
,p_a03_label=>'Link Attributes'
,p_a04_label=>'Link Classes'
,p_reference_id=>2062482847268086664
,p_list_template_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'A01: Large Number',
'A02: List Item Classes',
'A03: Link Attributes'))
);
end;
/
prompt --application/shared_components/user_interface/templates/list/cards
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(19193581854620481)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item is-active #A04#">',
'  <div class="t-Card">',
'    <a href="#LINK#" class="t-Card-wrap" #A05#>',
'      <div class="t-Card-icon u-color #A06#"><span class="t-Icon #ICON_CSS_CLASSES#"><span class="t-Card-initials" role="presentation">#A03#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#TEXT#</h3><h4 class="t-Card-subtitle">#A07#</h4></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#A01#</div>',
'        <div class="t-Card-info">#A02#</div>',
'      </div>',
'      <span class="t-Card-colorFill u-color #A06#"></span>',
'    </a>',
'  </div>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item #A04#">',
'  <div class="t-Card">',
'    <a href="#LINK#" class="t-Card-wrap" #A05#>',
'      <div class="t-Card-icon u-color #A06#"><span class="t-Icon #ICON_CSS_CLASSES#"><span class="t-Card-initials" role="presentation">#A03#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#TEXT#</h3><h4 class="t-Card-subtitle">#A07#</h4></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#A01#</div>',
'        <div class="t-Card-info">#A02#</div>',
'      </div>',
'      <span class="t-Card-colorFill u-color #A06#"></span>',
'    </a>',
'  </div>',
'</li>'))
,p_list_template_name=>'Cards'
,p_internal_name=>'CARDS'
,p_theme_id=>42
,p_theme_class_id=>4
,p_preset_template_options=>'t-Cards--animColorFill:t-Cards--3cols:t-Cards--basic'
,p_list_template_before_rows=>'<ul class="t-Cards #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Description'
,p_a02_label=>'Secondary Information'
,p_a03_label=>'Initials'
,p_a04_label=>'List Item CSS Classes'
,p_a05_label=>'Link Attributes'
,p_a06_label=>'Card Color Class'
,p_a07_label=>'Subtitle'
,p_reference_id=>2885322685880632508
);
end;
/
prompt --application/shared_components/user_interface/templates/list/media_list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(19199145658620484)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MediaList-item is-active #A04#">',
'    <a href="#LINK#" class="t-MediaList-itemWrap #A05#" #A03#>',
'        <div class="t-MediaList-iconWrap">',
'            <span class="t-MediaList-icon u-color #A06#"><span class="t-Icon #ICON_CSS_CLASSES#" #IMAGE_ATTR#></span></span>',
'        </div>',
'        <div class="t-MediaList-body">',
'            <h3 class="t-MediaList-title">#TEXT#</h3>',
'            <p class="t-MediaList-desc">#A01#</p>',
'        </div>',
'        <div class="t-MediaList-badgeWrap">',
'            <span class="t-MediaList-badge">#A02#</span>',
'        </div>',
'    </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MediaList-item  #A04#">',
'    <a href="#LINK#" class="t-MediaList-itemWrap #A05#" #A03#>',
'        <div class="t-MediaList-iconWrap">',
'            <span class="t-MediaList-icon u-color #A06#"><span class="t-Icon #ICON_CSS_CLASSES#" #IMAGE_ATTR#></span></span>',
'        </div>',
'        <div class="t-MediaList-body">',
'            <h3 class="t-MediaList-title">#TEXT#</h3>',
'            <p class="t-MediaList-desc">#A01#</p>',
'        </div>',
'        <div class="t-MediaList-badgeWrap">',
'            <span class="t-MediaList-badge">#A02#</span>',
'        </div>',
'    </a>',
'</li>'))
,p_list_template_name=>'Media List'
,p_internal_name=>'MEDIA_LIST'
,p_theme_id=>42
,p_theme_class_id=>5
,p_default_template_options=>'t-MediaList--showIcons:t-MediaList--showDesc'
,p_list_template_before_rows=>'<ul class="t-MediaList #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Description'
,p_a02_label=>'Badge Value'
,p_a03_label=>'Link Attributes'
,p_a04_label=>'List Item CSS Classes'
,p_a05_label=>'Link Class'
,p_a06_label=>'Icon Color Class'
,p_reference_id=>2066548068783481421
);
end;
/
prompt --application/shared_components/user_interface/templates/list/navigation_bar
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(19201987004620485)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item is-active #A02#">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item #A02#">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_name=>'Navigation Bar'
,p_internal_name=>'NAVIGATION_BAR'
,p_theme_id=>42
,p_theme_class_id=>20
,p_list_template_before_rows=>'<ul class="t-NavigationBar #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'
,p_list_template_after_rows=>'</ul>'
,p_before_sub_list=>'<div class="t-NavigationBar-menu" style="display: none" id="menu_#PARENT_LIST_ITEM_ID#"><ul>'
,p_after_sub_list=>'</ul></div></li>'
,p_sub_list_item_current=>'<li data-current="true" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-current="false" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item is-active #A02#">',
'  <button class="t-Button t-Button--icon t-Button t-Button--header t-Button--navBar js-menuButton" type="button" id="#LIST_ITEM_ID#" data-menu="menu_#LIST_ITEM_ID#">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span><span class="a-Icon icon-down-arrow"></span>',
'  </button>'))
,p_item_templ_noncurr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item #A02#">',
'  <button class="t-Button t-Button--icon t-Button t-Button--header t-Button--navBar js-menuButton" type="button" id="#LIST_ITEM_ID#" data-menu="menu_#LIST_ITEM_ID#">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span><span class="a-Icon icon-down-arrow"></span>',
'  </button>'))
,p_sub_templ_curr_w_child=>'<li data-current="true" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_sub_templ_noncurr_w_child=>'<li data-current="false" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_a01_label=>'Badge Value'
,p_a02_label=>'List  Item CSS Classes'
,p_reference_id=>2846096252961119197
);
end;
/
prompt --application/shared_components/user_interface/templates/list/side_navigation_menu
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(19202181926620485)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Side Navigation Menu'
,p_internal_name=>'SIDE_NAVIGATION_MENU'
,p_javascript_file_urls=>'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.treeView#MIN#.js?v=#APEX_VERSION#'
,p_javascript_code_onload=>'apex.jQuery(''body'').addClass(''t-PageBody--leftNav'');'
,p_theme_id=>42
,p_theme_class_id=>19
,p_preset_template_options=>'t-TreeNav--styleA'
,p_list_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-nav" id="t_Body_nav" role="navigation" aria-label="&APP_TITLE!ATTR.">',
'<div class="t-TreeNav #COMPONENT_CSS_CLASSES#" id="t_TreeNav" data-id="#PARENT_STATIC_ID#_tree" aria-label="&APP_TITLE!ATTR."><ul style="display:none">'))
,p_list_template_after_rows=>'</ul></div></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'ID Attribute'
,p_a02_label=>'Disabled True/False'
,p_a04_label=>'Title'
,p_reference_id=>2466292414354694776
);
end;
/
prompt --application/shared_components/user_interface/templates/list/top_navigation_menu
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(19203162589620486)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Top Navigation Menu'
,p_internal_name=>'TOP_NAVIGATION_MENU'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("##PARENT_STATIC_ID#_menubar", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  if ( apex.actions ) {',
'    apex.actions.addFromMarkup( e );',
'  } else {',
'    apex.debug.warn("Include actions.js to support menu shortcuts");',
'  }',
'}',
'e.menu({',
'  behaveLikeTabs: e.hasClass("js-tabLike"),',
'  menubarShowSubMenuIcon: e.hasClass("js-showSubMenuIcons") || null,',
'  slide: e.hasClass("js-slide"),',
'  menubar: true,',
'  menubarOverflow: true',
'});'))
,p_theme_id=>42
,p_theme_class_id=>20
,p_default_template_options=>'js-tabLike'
,p_list_template_before_rows=>'<div class="t-Header-nav-list #COMPONENT_CSS_CLASSES#" id="#PARENT_STATIC_ID#_menubar"><ul style="display:none">'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'ID Attribute'
,p_a02_label=>'Disabled True / False'
,p_a03_label=>'Hide'
,p_a04_label=>'Title Attribute'
,p_a05_label=>'Shortcut Key'
,p_reference_id=>2525307901300239072
);
end;
/
prompt --application/shared_components/user_interface/templates/list/links_list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(19204179606620487)
,p_list_template_current=>'<li class="t-LinksList-item is-current #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-b'
||'adge">#A01#</span></a></li>'
,p_list_template_noncurrent=>'<li class="t-LinksList-item #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-badge">#A01#'
||'</span></a></li>'
,p_list_template_name=>'Links List'
,p_internal_name=>'LINKS_LIST'
,p_theme_id=>42
,p_theme_class_id=>18
,p_list_template_before_rows=>'<ul class="t-LinksList #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'
,p_list_template_after_rows=>'</ul>'
,p_before_sub_list=>'<ul class="t-LinksList-list">'
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>'<li class="t-LinksList-item is-current #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-b'
||'adge">#A01#</span></a></li>'
,p_sub_list_item_noncurrent=>'<li class="t-LinksList-item #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-badge">#A01#'
||'</span></a></li>'
,p_item_templ_curr_w_child=>'<li class="t-LinksList-item is-current is-expanded #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t'
||'-LinksList-badge">#A01#</span></a>#SUB_LISTS#</li>'
,p_item_templ_noncurr_w_child=>'<li class="t-LinksList-item #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-badge">#A01#'
||'</span></a></li>'
,p_a01_label=>'Badge Value'
,p_a02_label=>'Link Attributes'
,p_a03_label=>'List Item CSS Classes'
,p_reference_id=>4070914341144059318
);
end;
/
prompt --application/shared_components/user_interface/templates/list/menu_bar
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(19205782590620488)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Menu Bar'
,p_internal_name=>'MENU_BAR'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("##PARENT_STATIC_ID#_menubar", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  apex.actions.addFromMarkup( e );',
'}',
'e.menu({',
'  behaveLikeTabs: e.hasClass("js-tabLike"),',
'  menubarShowSubMenuIcon: e.hasClass("js-showSubMenuIcons") || null,',
'  iconType: ''fa'',',
'  slide: e.hasClass("js-slide"),',
'  menubar: true,',
'  menubarOverflow: true',
'});'))
,p_theme_id=>42
,p_theme_class_id=>20
,p_default_template_options=>'js-showSubMenuIcons'
,p_list_template_before_rows=>'<div class="t-MenuBar #COMPONENT_CSS_CLASSES#" id="#PARENT_STATIC_ID#_menubar"><ul style="display:none">'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_reference_id=>2008709236185638887
);
end;
/
prompt --application/shared_components/user_interface/templates/list/top_navigation_tabs
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(19206767867620488)
,p_list_template_current=>'<li class="t-NavTabs-item #A03# is-active" id="#A01#"><a href="#LINK#" class="t-NavTabs-link #A04# " title="#TEXT_ESC_SC#"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-NavTabs-label">#TEXT_ESC_SC#</span><span class'
||'="t-NavTabs-badge #A05#">#A02#</span></a></li>'
,p_list_template_noncurrent=>'<li class="t-NavTabs-item #A03#" id="#A01#"><a href="#LINK#" class="t-NavTabs-link #A04# " title="#TEXT_ESC_SC#"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-NavTabs-label">#TEXT_ESC_SC#</span><span class="t-NavTab'
||'s-badge #A05#">#A02#</span></a></li>'
,p_list_template_name=>'Top Navigation Tabs'
,p_internal_name=>'TOP_NAVIGATION_TABS'
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-NavTabs--inlineLabels-lg:t-NavTabs--displayLabels-sm'
,p_list_template_before_rows=>'<ul class="t-NavTabs #COMPONENT_CSS_CLASSES#" id="#PARENT_STATIC_ID#_navtabs">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'List Item ID'
,p_a02_label=>'Badge Value'
,p_a03_label=>'List Item Class'
,p_a04_label=>'Link Class'
,p_a05_label=>'Badge Class'
,p_reference_id=>1453011561172885578
);
end;
/
prompt --application/shared_components/user_interface/templates/list/wizard_progress
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(19208347519620489)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-WizardSteps-step is-active" id="#LIST_ITEM_ID#"><div class="t-WizardSteps-wrap" data-link="#LINK#"><span class="t-WizardSteps-marker"></span><span class="t-WizardSteps-label">#TEXT# <span class="t-WizardSteps-labelState"></span></span></'
||'div></li>',
''))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-WizardSteps-step" id="#LIST_ITEM_ID#"><div class="t-WizardSteps-wrap" data-link="#LINK#"><span class="t-WizardSteps-marker"></span><span class="t-WizardSteps-label">#TEXT# <span class="t-WizardSteps-labelState"></span></span></div></li>',
''))
,p_list_template_name=>'Wizard Progress'
,p_internal_name=>'WIZARD_PROGRESS'
,p_javascript_code_onload=>'apex.theme.initWizardProgressBar();'
,p_theme_id=>42
,p_theme_class_id=>17
,p_preset_template_options=>'t-WizardSteps--displayLabels'
,p_list_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h2 class="u-VisuallyHidden">#CURRENT_PROGRESS#</h2>',
'<ul class="t-WizardSteps #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'))
,p_list_template_after_rows=>'</ul>'
,p_reference_id=>2008702338707394488
);
end;
/
prompt --application/shared_components/user_interface/templates/list/menu_popup
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(19209742502620489)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>',
''))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>',
''))
,p_list_template_name=>'Menu Popup'
,p_internal_name=>'MENU_POPUP'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("##PARENT_STATIC_ID#_menu", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  apex.actions.addFromMarkup( e );',
'}',
'e.menu({ slide: e.hasClass("js-slide"), iconType: ''fa''});'))
,p_theme_id=>42
,p_theme_class_id=>20
,p_list_template_before_rows=>'<div id="#PARENT_STATIC_ID#_menu" class="#COMPONENT_CSS_CLASSES#" style="display:none;"><ul>'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'Data ID'
,p_a02_label=>'Disabled (True/False)'
,p_a03_label=>'Hidden (True/False)'
,p_a04_label=>'Title Attribute'
,p_a05_label=>'Shortcut'
,p_reference_id=>3492264004432431646
);
end;
/
prompt --application/shared_components/user_interface/templates/list/tabs
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(19210189397620490)
,p_list_template_current=>'<li class="t-Tabs-item is-active"><a href="#LINK#" class="t-Tabs-link"><span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Tabs-label">#TEXT#</span></a></li>'
,p_list_template_noncurrent=>'<li class="t-Tabs-item"><a href="#LINK#" class="t-Tabs-link"><span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Tabs-label">#TEXT#</span></a></li>'
,p_list_template_name=>'Tabs'
,p_internal_name=>'TABS'
,p_javascript_file_urls=>'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#'
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-Tabs--simple'
,p_list_template_before_rows=>'<ul class="t-Tabs #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_reference_id=>3288206686691809997
);
end;
/
prompt --application/shared_components/user_interface/templates/report/alerts
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(19168762216620461)
,p_row_template_name=>'Alerts'
,p_internal_name=>'ALERTS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--horizontal t-Alert--colorBG t-Alert--defaultIcons t-Alert--#ALERT_TYPE#" role="alert">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-header">',
'        <h2 class="t-Alert-title">#ALERT_TITLE#</h2>',
'      </div>',
'      <div class="t-Alert-body">',
'        #ALERT_DESC#',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      #ALERT_ACTION#',
'    </div>',
'  </div>',
'</div>'))
,p_row_template_before_rows=>'<div class="t-Alerts #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_alerts" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</div>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>14
,p_reference_id=>2881456138952347027
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/badge_list
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(19168911631620463)
,p_row_template_name=>'Badge List'
,p_internal_name=>'BADGE_LIST'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item">',
' <span class="t-BadgeList-wrap u-color">',
'  <span class="t-BadgeList-label">#COLUMN_HEADER#</span>',
'  <span class="t-BadgeList-value">#COLUMN_VALUE#</span>',
' </span>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-BadgeList #COMPONENT_CSS_CLASSES#" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>6
,p_preset_template_options=>'t-BadgeList--large:t-BadgeList--fixed:t-BadgeList--circular'
,p_reference_id=>2103197159775914759
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/comments
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(19172979369620465)
,p_row_template_name=>'Comments'
,p_internal_name=>'COMMENTS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Comments-item #COMMENT_MODIFIERS#">',
'    <div class="t-Comments-icon">',
'        <div class="t-Comments-userIcon #ICON_MODIFIER#" aria-hidden="true">#USER_ICON#</div>',
'    </div>',
'    <div class="t-Comments-body">',
'        <div class="t-Comments-info">',
'            #USER_NAME# <span class="t-Comments-date">#COMMENT_DATE#</span> <span class="t-Comments-actions">#ACTIONS#</span>',
'        </div>',
'        <div class="t-Comments-comment">',
'            #COMMENT_TEXT##ATTRIBUTE_1##ATTRIBUTE_2##ATTRIBUTE_3##ATTRIBUTE_4#',
'        </div>',
'    </div>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-Comments #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_report" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>',
''))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-Comments--chat'
,p_reference_id=>2611722012730764232
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/media_list
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(19174322939620466)
,p_row_template_name=>'Media List'
,p_internal_name=>'MEDIA_LIST'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MediaList-item #LIST_CLASS#">',
'    <a href="#LINK#" class="t-MediaList-itemWrap #LINK_CLASS#" #LINK_ATTR#>',
'        <div class="t-MediaList-iconWrap">',
'            <span class="t-MediaList-icon u-color #ICON_COLOR_CLASS#"><span class="t-Icon #ICON_CLASS#"></span></span>',
'        </div>',
'        <div class="t-MediaList-body">',
'            <h3 class="t-MediaList-title">#LIST_TITLE#</h3>',
'            <p class="t-MediaList-desc">#LIST_TEXT#</p>',
'        </div>',
'        <div class="t-MediaList-badgeWrap">',
'            <span class="t-MediaList-badge">#LIST_BADGE#</span>',
'        </div>',
'    </a>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-MediaList #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_report" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>1
,p_default_template_options=>'t-MediaList--showDesc:t-MediaList--showIcons'
,p_preset_template_options=>'t-MediaList--stack'
,p_reference_id=>2092157460408299055
,p_translate_this_template=>'N'
,p_row_template_comment=>' (SELECT link_text, link_target, detail1, detail2, last_modified)'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/standard
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(19177373070620468)
,p_row_template_name=>'Standard'
,p_internal_name=>'STANDARD'
,p_row_template1=>'<td class="t-Report-cell" #ALIGNMENT# headers="#COLUMN_HEADER_NAME#">#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Report #COMPONENT_CSS_CLASSES#" id="report_#REGION_STATIC_ID#" #REPORT_ATTRIBUTES# data-region-id="#REGION_STATIC_ID#">',
'  <div class="t-Report-wrap">',
'    <table class="t-Report-pagination" role="presentation">#TOP_PAGINATION#</table>',
'    <div class="t-Report-tableWrap">',
'    <table class="t-Report-report" aria-label="#REGION_TITLE#">'))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'      </tbody>',
'    </table>',
'    </div>',
'    <div class="t-Report-links">#EXTERNAL_LINK##CSV_LINK#</div>',
'    <table class="t-Report-pagination t-Report-pagination--bottom" role="presentation">#PAGINATION#</table>',
'  </div>',
'</div>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_before_column_heading=>'<thead>'
,p_column_heading_template=>'<th class="t-Report-colHead" #ALIGNMENT# id="#COLUMN_HEADER_NAME#" #COLUMN_WIDTH#>#COLUMN_HEADER#</th>'
,p_after_column_heading=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</thead>',
'<tbody>'))
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>4
,p_preset_template_options=>'t-Report--altRowsDefault:t-Report--rowHighlight'
,p_reference_id=>2537207537838287671
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(19177373070620468)
,p_row_template_before_first=>'<tr>'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
end;
/
prompt --application/shared_components/user_interface/templates/report/value_attribute_pairs_column
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(19179953888620469)
,p_row_template_name=>'Value Attribute Pairs - Column'
,p_internal_name=>'VALUE_ATTRIBUTE_PAIRS_COLUMN'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<dt class="t-AVPList-label">',
'  #COLUMN_HEADER#',
'</dt>',
'<dd class="t-AVPList-value">',
'  #COLUMN_VALUE#',
'</dd>'))
,p_row_template_before_rows=>'<dl class="t-AVPList #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</dl>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>6
,p_preset_template_options=>'t-AVPList--leftAligned'
,p_reference_id=>2099068636272681754
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/value_attribute_pairs_row
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(19181987399620470)
,p_row_template_name=>'Value Attribute Pairs - Row'
,p_internal_name=>'VALUE_ATTRIBUTE_PAIRS_ROW'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<dt class="t-AVPList-label">',
'  #1#',
'</dt>',
'<dd class="t-AVPList-value">',
'  #2#',
'</dd>'))
,p_row_template_before_rows=>'<dl class="t-AVPList #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</dl>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-AVPList--leftAligned'
,p_reference_id=>2099068321678681753
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/timeline
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(19183700977620471)
,p_row_template_name=>'Timeline'
,p_internal_name=>'TIMELINE'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Timeline-item #EVENT_MODIFIERS#" #EVENT_ATTRIBUTES#>',
'  <div class="t-Timeline-wrap">',
'    <div class="t-Timeline-user">',
'      <div class="t-Timeline-avatar #USER_COLOR#">',
'        #USER_AVATAR#',
'      </div>',
'      <div class="t-Timeline-userinfo">',
'        <span class="t-Timeline-username">#USER_NAME#</span>',
'        <span class="t-Timeline-date">#EVENT_DATE#</span>',
'      </div>',
'    </div>',
'    <div class="t-Timeline-content">',
'      <div class="t-Timeline-typeWrap">',
'        <div class="t-Timeline-type #EVENT_STATUS#">',
'          <span class="t-Icon #EVENT_ICON#"></span>',
'          <span class="t-Timeline-typename">#EVENT_TYPE#</span>',
'        </div>',
'      </div>',
'      <div class="t-Timeline-body">',
'        <h3 class="t-Timeline-title">#EVENT_TITLE#</h3>',
'        <p class="t-Timeline-desc">#EVENT_DESC#</p>',
'      </div>',
'    </div>',
'  </div>',
'</li>'))
,p_row_template_condition1=>':EVENT_LINK is null'
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Timeline-item #EVENT_MODIFIERS#" #EVENT_ATTRIBUTES#>',
'  <a href="#EVENT_LINK#" class="t-Timeline-wrap">',
'    <div class="t-Timeline-user">',
'      <div class="t-Timeline-avatar #USER_COLOR#">',
'        #USER_AVATAR#',
'      </div>',
'      <div class="t-Timeline-userinfo">',
'        <span class="t-Timeline-username">#USER_NAME#</span>',
'        <span class="t-Timeline-date">#EVENT_DATE#</span>',
'      </div>',
'    </div>',
'    <div class="t-Timeline-content">',
'      <div class="t-Timeline-typeWrap">',
'        <div class="t-Timeline-type #EVENT_STATUS#">',
'          <span class="t-Icon #EVENT_ICON#"></span>',
'          <span class="t-Timeline-typename">#EVENT_TYPE#</span>',
'        </div>',
'      </div>',
'      <div class="t-Timeline-body">',
'        <h3 class="t-Timeline-title">#EVENT_TITLE#</h3>',
'        <p class="t-Timeline-desc">#EVENT_DESC#</p>',
'      </div>',
'    </div>',
'  </a>',
'</li>'))
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-Timeline #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_timeline" data-region-id="#REGION_STATIC_ID#">',
''))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_reference_id=>1513373588340069864
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/cards
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(19184166399620472)
,p_row_template_name=>'Cards'
,p_internal_name=>'CARDS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item #CARD_MODIFIERS#">',
'  <div class="t-Card">',
'    <a href="#CARD_LINK#" class="t-Card-wrap">',
'      <div class="t-Card-icon u-color #CARD_COLOR#"><span class="t-Icon fa #CARD_ICON#"><span class="t-Card-initials" role="presentation">#CARD_INITIALS#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#CARD_TITLE#</h3><h4 class="t-Card-subtitle">#CARD_SUBTITLE#</h4></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#CARD_TEXT#</div>',
'        <div class="t-Card-info">#CARD_SUBTEXT#</div>',
'      </div>',
'      <span class="t-Card-colorFill u-color #CARD_COLOR#"></span>',
'    </a>',
'  </div>',
'</li>'))
,p_row_template_condition1=>':CARD_LINK is not null'
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item #CARD_MODIFIERS#">',
'  <div class="t-Card">',
'    <div class="t-Card-wrap">',
'      <div class="t-Card-icon u-color #CARD_COLOR#"><span class="t-Icon fa #CARD_ICON#"><span class="t-Card-initials" role="presentation">#CARD_INITIALS#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#CARD_TITLE#</h3><h4 class="t-Card-subtitle">#CARD_SUBTITLE#</h4></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#CARD_TEXT#</div>',
'        <div class="t-Card-info">#CARD_SUBTEXT#</div>',
'      </div>',
'      <span class="t-Card-colorFill u-color #CARD_COLOR#"></span>',
'    </div>',
'  </div>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-Cards #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_cards" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-Cards--animColorFill:t-Cards--3cols:t-Cards--basic'
,p_reference_id=>2973535649510699732
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/search_results
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(19189373732620474)
,p_row_template_name=>'Search Results'
,p_internal_name=>'SEARCH_RESULTS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition1=>':LABEL_02 is null'
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'      <span class="t-SearchResults-misc">#LABEL_02#: #VALUE_02#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition2=>':LABEL_03 is null'
,p_row_template3=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'      <span class="t-SearchResults-misc">#LABEL_02#: #VALUE_02#</span>',
'      <span class="t-SearchResults-misc">#LABEL_03#: #VALUE_03#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition3=>':LABEL_04 is null'
,p_row_template4=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'      <span class="t-SearchResults-misc">#LABEL_02#: #VALUE_02#</span>',
'      <span class="t-SearchResults-misc">#LABEL_03#: #VALUE_03#</span>',
'      <span class="t-SearchResults-misc">#LABEL_04#: #VALUE_04#</span>',
'    </div>',
'  </li>'))
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-SearchResults #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_report" data-region-id="#REGION_STATIC_ID#">',
'<ul class="t-SearchResults-list">'))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>',
'</div>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'NOT_CONDITIONAL'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>4070913431524059316
,p_translate_this_template=>'N'
,p_row_template_comment=>' (SELECT link_text, link_target, detail1, detail2, last_modified)'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/hidden
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(19211772741620491)
,p_template_name=>'Hidden'
,p_internal_name=>'HIDDEN'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer t-Form-labelContainer--hiddenLabel col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label u-VisuallyHidden">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</label>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--hiddenLabel rel-col #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer col col-#ITEM_COLUMN_SPAN_NUMBER#"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT##HELP_TEMPLATE#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>13
,p_reference_id=>2039339104148359505
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/optional
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(19211857718620493)
,p_template_name=>'Optional'
,p_internal_name=>'OPTIONAL'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</label>',
'</div>',
''))
,p_before_item=>'<div class="t-Form-fieldContainer rel-col #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer col col-#ITEM_COLUMN_SPAN_NUMBER#"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT##HELP_TEMPLATE#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>3
,p_reference_id=>2317154212072806530
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/optional_above
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(19211954747620493)
,p_template_name=>'Optional - Above'
,p_internal_name=>'OPTIONAL_ABOVE'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</label>#HELP_TEMPLATE#',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--stacked #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>3
,p_reference_id=>3030114864004968404
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/optional_floating
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(19212048692620493)
,p_template_name=>'Optional - Floating'
,p_internal_name=>'OPTIONAL_FLOATING'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</label>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--floatingLabel #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT##HELP_TEMPLATE#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>3
,p_reference_id=>1607675164727151865
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/required
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(19212181891620493)
,p_template_name=>'Required'
,p_internal_name=>'REQUIRED'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'  <label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
' <span class="u-VisuallyHidden">(#VALUE_REQUIRED#)</span></label>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer is-required rel-col #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer col col-#ITEM_COLUMN_SPAN_NUMBER#"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT##HELP_TEMPLATE#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>4
,p_reference_id=>2525313812251712801
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/required_above
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(19212234953620493)
,p_template_name=>'Required - Above'
,p_internal_name=>'REQUIRED_ABOVE'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'  <label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
' <span class="u-VisuallyHidden">(#VALUE_REQUIRED#)</span></label> #HELP_TEMPLATE#',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--stacked is-required #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>4
,p_reference_id=>3030115129444970113
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/required_floating
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(19212388544620493)
,p_template_name=>'Required - Floating'
,p_internal_name=>'REQUIRED_FLOATING'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'  <label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
' <span class="u-VisuallyHidden">(#VALUE_REQUIRED#)</span></label>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--floatingLabel is-required #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT##HELP_TEMPLATE#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>4
,p_reference_id=>1607675344320152883
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/breadcrumb/breadcrumb
begin
wwv_flow_api.create_menu_template(
 p_id=>wwv_flow_api.id(19214590506620499)
,p_name=>'Breadcrumb'
,p_internal_name=>'BREADCRUMB'
,p_before_first=>'<ul class="t-Breadcrumb #COMPONENT_CSS_CLASSES#">'
,p_current_page_option=>'<li class="t-Breadcrumb-item is-active"><h1 class="t-Breadcrumb-label">#NAME#</h1></li>'
,p_non_current_page_option=>'<li class="t-Breadcrumb-item"><a href="#LINK#" class="t-Breadcrumb-label">#NAME#</a></li>'
,p_after_last=>'</ul>'
,p_max_levels=>6
,p_start_with_node=>'PARENT_TO_LEAF'
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>4070916542570059325
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/popuplov
begin
wwv_flow_api.create_popup_lov_template(
 p_id=>wwv_flow_api.id(19214740554620516)
,p_page_name=>'winlov'
,p_page_title=>'Search Dialog'
,p_page_html_head=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html lang="&BROWSER_LANGUAGE.">',
'<head>',
'<title>#TITLE#</title>',
'#APEX_CSS#',
'#THEME_CSS#',
'#THEME_STYLE_CSS#',
'#FAVICONS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'<meta name="viewport" content="width=device-width,initial-scale=1.0" />',
'</head>'))
,p_page_body_attr=>'onload="first_field()" class="t-Page t-Page--popupLOV"'
,p_before_field_text=>'<div class="t-PopupLOV-actions t-Form--large">'
,p_filter_width=>'20'
,p_filter_max_width=>'100'
,p_filter_text_attr=>'class="apex-item-text"'
,p_find_button_text=>'Search'
,p_find_button_attr=>'class="t-Button t-Button--hot t-Button--padLeft"'
,p_close_button_text=>'Close'
,p_close_button_attr=>'class="t-Button u-pullRight"'
,p_next_button_text=>'Next &gt;'
,p_next_button_attr=>'class="t-Button t-PopupLOV-button"'
,p_prev_button_text=>'&lt; Previous'
,p_prev_button_attr=>'class="t-Button t-PopupLOV-button"'
,p_after_field_text=>'</div>'
,p_scrollbars=>'1'
,p_resizable=>'1'
,p_width=>'380'
,p_result_row_x_of_y=>'<div class="t-PopupLOV-pagination">Row(s) #FIRST_ROW# - #LAST_ROW#</div>'
,p_result_rows_per_pg=>100
,p_before_result_set=>'<div class="t-PopupLOV-links">'
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>2885398517835871876
,p_translate_this_template=>'N'
,p_after_result_set=>'</div>'
);
end;
/
prompt --application/shared_components/user_interface/templates/calendar/calendar
begin
wwv_flow_api.create_calendar_template(
 p_id=>wwv_flow_api.id(19214681300620501)
,p_cal_template_name=>'Calendar'
,p_internal_name=>'CALENDAR'
,p_day_of_week_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<th id="#DY#" scope="col" class="t-ClassicCalendar-dayColumn">',
'  <span class="visible-md visible-lg">#IDAY#</span>',
'  <span class="hidden-md hidden-lg">#IDY#</span>',
'</th>'))
,p_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar">',
'<h1 class="t-ClassicCalendar-title">#IMONTH# #YYYY#</h1>'))
,p_month_open_format=>'<table class="t-ClassicCalendar-calendar" cellpadding="0" cellspacing="0" border="0" aria-label="#IMONTH# #YYYY#">'
,p_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>',
''))
,p_day_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#">#TITLE_FORMAT#<div class="t-ClassicCalendar-dayEvents">#DATA#</div>'
,p_day_close_format=>'</td>'
,p_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#">#TITLE_FORMAT#<div class="t-ClassicCalendar-dayEvents">#DATA#</div>'
,p_weekend_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_weekend_open_format=>'<td class="t-ClassicCalendar-day is-weekend" headers="#DY#">#TITLE_FORMAT#<div class="t-ClassicCalendar-dayEvents">#DATA#</div>'
,p_weekend_close_format=>'</td>'
,p_nonday_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_nonday_open_format=>'<td class="t-ClassicCalendar-day is-inactive" headers="#DY#">'
,p_nonday_close_format=>'</td>'
,p_week_open_format=>'<tr>'
,p_week_close_format=>'</tr> '
,p_daily_title_format=>'<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1DayCalendarHolder"> <tr> <td class="t1MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>'
,p_daily_open_format=>'<tr>'
,p_daily_close_format=>'</tr>'
,p_weekly_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--weekly">',
'<h1 class="t-ClassicCalendar-title">#WTITLE#</h1>'))
,p_weekly_day_of_week_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<th scope="col" class="t-ClassicCalendar-dayColumn" id="#DY#">',
'  <span class="visible-md visible-lg">#DD# #IDAY#</span>',
'  <span class="hidden-md hidden-lg">#DD# #IDY#</span>',
'</th>'))
,p_weekly_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" aria-label="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="t-ClassicCalendar-calendar">'
,p_weekly_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_weekly_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_weekly_day_close_format=>'</div></td>'
,p_weekly_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_weekly_weekend_open_format=>'<td class="t-ClassicCalendar-day is-weekend" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_weekly_weekend_close_format=>'</div></td>'
,p_weekly_time_open_format=>'<th scope="row" class="t-ClassicCalendar-day t-ClassicCalendar-timeCol">'
,p_weekly_time_close_format=>'</th>'
,p_weekly_time_title_format=>'#TIME#'
,p_weekly_hour_open_format=>'<tr>'
,p_weekly_hour_close_format=>'</tr>'
,p_daily_day_of_week_format=>'<th scope="col" id="#DY#" class="t-ClassicCalendar-dayColumn">#IDAY#</th>'
,p_daily_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--daily">',
'<h1 class="t-ClassicCalendar-title">#IMONTH# #DD#, #YYYY#</h1>'))
,p_daily_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" aria-label="#CALENDAR_TITLE# #START_DL#" class="t-ClassicCalendar-calendar">'
,p_daily_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_daily_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_daily_day_close_format=>'</div></td>'
,p_daily_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_daily_time_open_format=>'<th scope="row" class="t-ClassicCalendar-day t-ClassicCalendar-timeCol" id="#TIME#">'
,p_daily_time_close_format=>'</th>'
,p_daily_time_title_format=>'#TIME#'
,p_daily_hour_open_format=>'<tr>'
,p_daily_hour_close_format=>'</tr>'
,p_cust_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar">',
'<h1 class="t-ClassicCalendar-title">#IMONTH# #YYYY#</h1>'))
,p_cust_day_of_week_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<th id="#DY#" scope="col" class="t-ClassicCalendar-dayColumn">',
'  <span class="visible-md visible-lg">#IDAY#</span>',
'  <span class="hidden-md hidden-lg">#IDY#</span>',
'</th>'))
,p_cust_month_open_format=>'<table class="t-ClassicCalendar-calendar" cellpadding="0" cellspacing="0" border="0" aria-label="#IMONTH# #YYYY#">'
,p_cust_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_cust_week_open_format=>'<tr>'
,p_cust_week_close_format=>'</tr> '
,p_cust_day_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_cust_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#">'
,p_cust_day_close_format=>'</td>'
,p_cust_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#">'
,p_cust_nonday_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_cust_nonday_open_format=>'<td class="t-ClassicCalendar-day is-inactive" headers="#DY#">'
,p_cust_nonday_close_format=>'</td>'
,p_cust_weekend_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_cust_weekend_open_format=>'<td class="t-ClassicCalendar-day is-weekend" headers="#DY#">'
,p_cust_weekend_close_format=>'</td>'
,p_cust_hour_open_format=>'<tr>'
,p_cust_hour_close_format=>'</tr>'
,p_cust_time_title_format=>'#TIME#'
,p_cust_time_open_format=>'<th scope="row" class="t-ClassicCalendar-day t-ClassicCalendar-timeCol">'
,p_cust_time_close_format=>'</th>'
,p_cust_wk_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar">',
'<h1 class="t-ClassicCalendar-title">#WTITLE#</h1>'))
,p_cust_wk_day_of_week_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<th scope="col" class="t-ClassicCalendar-dayColumn" id="#DY#">',
'  <span class="visible-md visible-lg">#DD# #IDAY#</span>',
'  <span class="hidden-md hidden-lg">#DD# #IDY#</span>',
'</th>'))
,p_cust_wk_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="t-ClassicCalendar-calendar">'
,p_cust_wk_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_cust_wk_week_open_format=>'<tr>'
,p_cust_wk_week_close_format=>'</tr> '
,p_cust_wk_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_cust_wk_day_close_format=>'</div></td>'
,p_cust_wk_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_cust_wk_weekend_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#">'
,p_cust_wk_weekend_close_format=>'</td>'
,p_agenda_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--list">',
'  <div class="t-ClassicCalendar-title">#IMONTH# #YYYY#</div>',
'  <ul class="t-ClassicCalendar-list">',
'    #DAYS#',
'  </ul>',
'</div>'))
,p_agenda_past_day_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-past">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_today_day_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-today">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_future_day_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-future">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_past_entry_format=>'  <li class="t-ClassicCalendar-listEvent is-past">#DATA#</li>'
,p_agenda_today_entry_format=>'  <li class="t-ClassicCalendar-listEvent is-today">#DATA#</li>'
,p_agenda_future_entry_format=>'  <li class="t-ClassicCalendar-listEvent is-future">#DATA#</li>'
,p_month_data_format=>'#DAYS#'
,p_month_data_entry_format=>'<span class="t-ClassicCalendar-event">#DATA#</span>'
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>4070916747979059326
);
end;
/
prompt --application/shared_components/user_interface/themes
begin
wwv_flow_api.create_theme(
 p_id=>wwv_flow_api.id(19215992277620533)
,p_theme_id=>42
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_ui_type_name=>'DESKTOP'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_reference_id=>4070917134413059350
,p_is_locked=>false
,p_default_page_template=>wwv_flow_api.id(19125694513620429)
,p_default_dialog_template=>wwv_flow_api.id(19121669008620427)
,p_error_template=>wwv_flow_api.id(19113495258620423)
,p_printer_friendly_template=>wwv_flow_api.id(19125694513620429)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_api.id(19113495258620423)
,p_default_button_template=>wwv_flow_api.id(19213196014620497)
,p_default_region_template=>wwv_flow_api.id(19157096164620456)
,p_default_chart_template=>wwv_flow_api.id(19157096164620456)
,p_default_form_template=>wwv_flow_api.id(19157096164620456)
,p_default_reportr_template=>wwv_flow_api.id(19157096164620456)
,p_default_tabform_template=>wwv_flow_api.id(19157096164620456)
,p_default_wizard_template=>wwv_flow_api.id(19157096164620456)
,p_default_menur_template=>wwv_flow_api.id(19166411098620460)
,p_default_listr_template=>wwv_flow_api.id(19157096164620456)
,p_default_irr_template=>wwv_flow_api.id(19155944385620455)
,p_default_report_template=>wwv_flow_api.id(19177373070620468)
,p_default_label_template=>wwv_flow_api.id(19212048692620493)
,p_default_menu_template=>wwv_flow_api.id(19214590506620499)
,p_default_calendar_template=>wwv_flow_api.id(19214681300620501)
,p_default_list_template=>wwv_flow_api.id(19204179606620487)
,p_default_nav_list_template=>wwv_flow_api.id(19203162589620486)
,p_default_top_nav_list_temp=>wwv_flow_api.id(19203162589620486)
,p_default_side_nav_list_temp=>wwv_flow_api.id(19202181926620485)
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>wwv_flow_api.id(19132834427620444)
,p_default_dialogr_template=>wwv_flow_api.id(19131823225620443)
,p_default_option_label=>wwv_flow_api.id(19212048692620493)
,p_default_required_label=>wwv_flow_api.id(19212388544620493)
,p_default_page_transition=>'NONE'
,p_default_popup_transition=>'NONE'
,p_default_navbar_list_template=>wwv_flow_api.id(19201987004620485)
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#IMAGE_PREFIX#themes/theme_42/1.3/')
,p_files_version=>64
,p_icon_library=>'FONTAPEX'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#THEME_IMAGES#js/theme42#MIN#.js?v=#APEX_VERSION#'))
,p_css_file_urls=>'#THEME_IMAGES#css/Core#MIN#.css?v=#APEX_VERSION#'
);
end;
/
prompt --application/shared_components/user_interface/theme_style
begin
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(19214907775620519)
,p_theme_id=>42
,p_name=>'Vista'
,p_css_file_urls=>'#THEME_IMAGES#css/Vista#MIN#.css?v=#APEX_VERSION#'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_read_only=>true
,p_reference_id=>4007676303523989775
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(19215118036620519)
,p_theme_id=>42
,p_name=>'Vita'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>true
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>2719875314571594493
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(19215321968620519)
,p_theme_id=>42
,p_name=>'Vita - Dark'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Dark.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Dark#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>3543348412015319650
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(19215511407620520)
,p_theme_id=>42
,p_name=>'Vita - Red'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Red.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Red#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>1938457712423918173
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(19215712495620520)
,p_theme_id=>42
,p_name=>'Vita - Slate'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Slate.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Slate#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>3291983347983194966
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(19396030541830856)
,p_theme_id=>42
,p_name=>'Vita - Dark - Deezer'
,p_is_current=>true
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Dark.less'
,p_theme_roller_config=>'{"customCSS":"html {  \n  font-size: 82% !important;  \n}  ","vars":{}}'
,p_theme_roller_output_file_url=>'#THEME_DB_IMAGES#19396030541830856.css'
,p_theme_roller_read_only=>false
);
end;
/
prompt --application/shared_components/user_interface/theme_files
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A200D0A202A2056697461202D204461726B202D204465657A65720D0A202A20202020284F7261636C65204170706C69636174696F6E2045787072657373205468656D65205374796C65290D0A202A200D0A202A2054686973204353532066696C6520';
wwv_flow_api.g_varchar2_table(2) := '7761732067656E657261746564207573696E6720746865204F7261636C65204170706C69636174696F6E204578707265737320352E30205468656D6520526F6C6C65722E200D0A202A200D0A202A2F0D0A0D0A2E742D486561646572207B0D0A2020626F';
wwv_flow_api.g_varchar2_table(3) := '782D736861646F773A2030203170782030207267626128302C20302C20302C20302E3135293B0D0A7D0D0A2E742D486561646572202E742D427574746F6E2D2D6865616465722E69732D616374697665207B0D0A2020636F6C6F723A2023666666666666';
wwv_flow_api.g_varchar2_table(4) := '3B0D0A7D0D0A2E742D426F6479207B0D0A20200D0A20200D0A20200D0A7D0D0A2E742D426F6479202E612D4D696E6943616C207B0D0A2020626F726465723A2031707820736F6C696420236466646664663B0D0A2020626F726465722D7261646975733A';
wwv_flow_api.g_varchar2_table(5) := '203270783B0D0A20206261636B67726F756E642D636F6C6F723A20236638663866383B0D0A7D0D0A2E742D426F6479202E612D4D696E6943616C2D7469746C65207B0D0A2020636F6C6F723A20233166316631663B0D0A7D0D0A2E742D426F6479202E61';
wwv_flow_api.g_varchar2_table(6) := '2D4D696E6943616C2D6461794F665765656B207B0D0A2020636F6C6F723A20233739373937393B0D0A7D0D0A2E742D426F6479202E612D4D696E6943616C2D646179207B0D0A2020626F726465722D636F6C6F723A20236632663266323B0D0A2020636F';
wwv_flow_api.g_varchar2_table(7) := '6C6F723A20233339333933393B0D0A7D0D0A2E742D426F6479202E612D4D696E6943616C2D6461792E69732D746F646179202E612D4D696E6943616C2D64617465207B0D0A20206261636B67726F756E642D636F6C6F723A20233332333333363B0D0A20';
wwv_flow_api.g_varchar2_table(8) := '20636F6C6F723A20236633663366343B0D0A7D0D0A2E742D426F6479202E612D4D696E6943616C2D6461792E69732D616374697665202E612D4D696E6943616C2D64617465207B0D0A20206261636B67726F756E642D636F6C6F723A2023666263653461';
wwv_flow_api.g_varchar2_table(9) := '3B0D0A2020636F6C6F723A20233434333330323B0D0A7D0D0A2E742D426F6479202E612D4D696E6943616C2D6461792E69732D7765656B656E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236633663366333B0D0A7D0D0A2E742D426F';
wwv_flow_api.g_varchar2_table(10) := '6479202E612D4D696E6943616C2D6461792E69732D6E756C6C207B0D0A20206261636B67726F756E642D636F6C6F723A20236565656565653B0D0A7D0D0A2E742D526567696F6E207B0D0A20200D0A20200D0A20200D0A7D0D0A2E742D526567696F6E20';
wwv_flow_api.g_varchar2_table(11) := '2E612D4D696E6943616C207B0D0A2020626F726465723A2031707820736F6C696420236536653665363B0D0A2020626F726465722D7261646975733A203270783B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A';
wwv_flow_api.g_varchar2_table(12) := '2E742D526567696F6E202E612D4D696E6943616C2D7469746C65207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D526567696F6E202E612D4D696E6943616C2D6461794F665765656B207B0D0A2020636F6C6F723A202338303830';
wwv_flow_api.g_varchar2_table(13) := '38303B0D0A7D0D0A2E742D526567696F6E202E612D4D696E6943616C2D646179207B0D0A2020626F726465722D636F6C6F723A20236639663966393B0D0A2020636F6C6F723A20233430343034303B0D0A7D0D0A2E742D526567696F6E202E612D4D696E';
wwv_flow_api.g_varchar2_table(14) := '6943616C2D6461792E69732D746F646179202E612D4D696E6943616C2D64617465207B0D0A20206261636B67726F756E642D636F6C6F723A20233332333333363B0D0A2020636F6C6F723A20236633663366343B0D0A7D0D0A2E742D526567696F6E202E';
wwv_flow_api.g_varchar2_table(15) := '612D4D696E6943616C2D6461792E69732D616374697665202E612D4D696E6943616C2D64617465207B0D0A20206261636B67726F756E642D636F6C6F723A20236662636534613B0D0A2020636F6C6F723A20233434333330323B0D0A7D0D0A2E742D5265';
wwv_flow_api.g_varchar2_table(16) := '67696F6E202E612D4D696E6943616C2D6461792E69732D7765656B656E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236661666166613B0D0A7D0D0A2E742D526567696F6E202E612D4D696E6943616C2D6461792E69732D6E756C6C20';
wwv_flow_api.g_varchar2_table(17) := '7B0D0A20206261636B67726F756E642D636F6C6F723A20236635663566353B0D0A7D0D0A2E742D426F64792D616374696F6E73207B0D0A20200D0A20200D0A20200D0A7D0D0A2E742D426F64792D616374696F6E73202E612D4D696E6943616C207B0D0A';
wwv_flow_api.g_varchar2_table(18) := '2020626F726465723A2031707820736F6C696420236462646264623B0D0A2020626F726465722D7261646975733A203270783B0D0A20206261636B67726F756E642D636F6C6F723A20236634663466343B0D0A7D0D0A2E742D426F64792D616374696F6E';
wwv_flow_api.g_varchar2_table(19) := '73202E612D4D696E6943616C2D7469746C65207B0D0A2020636F6C6F723A20233162316231623B0D0A7D0D0A2E742D426F64792D616374696F6E73202E612D4D696E6943616C2D6461794F665765656B207B0D0A2020636F6C6F723A2023373537353735';
wwv_flow_api.g_varchar2_table(20) := '3B0D0A7D0D0A2E742D426F64792D616374696F6E73202E612D4D696E6943616C2D646179207B0D0A2020626F726465722D636F6C6F723A20236565656565653B0D0A2020636F6C6F723A20233335333533353B0D0A7D0D0A2E742D426F64792D61637469';
wwv_flow_api.g_varchar2_table(21) := '6F6E73202E612D4D696E6943616C2D6461792E69732D746F646179202E612D4D696E6943616C2D64617465207B0D0A20206261636B67726F756E642D636F6C6F723A20233332333333363B0D0A2020636F6C6F723A20236633663366343B0D0A7D0D0A2E';
wwv_flow_api.g_varchar2_table(22) := '742D426F64792D616374696F6E73202E612D4D696E6943616C2D6461792E69732D616374697665202E612D4D696E6943616C2D64617465207B0D0A20206261636B67726F756E642D636F6C6F723A20236662636534613B0D0A2020636F6C6F723A202334';
wwv_flow_api.g_varchar2_table(23) := '34333330323B0D0A7D0D0A2E742D426F64792D616374696F6E73202E612D4D696E6943616C2D6461792E69732D7765656B656E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236566656665663B0D0A7D0D0A2E742D426F64792D616374';
wwv_flow_api.g_varchar2_table(24) := '696F6E73202E612D4D696E6943616C2D6461792E69732D6E756C6C207B0D0A20206261636B67726F756E642D636F6C6F723A20236561656165613B0D0A7D0D0A2E742D426F64792D696E666F207B0D0A20200D0A20200D0A20200D0A7D0D0A2E742D426F';
wwv_flow_api.g_varchar2_table(25) := '64792D696E666F202E612D4D696E6943616C207B0D0A2020626F726465723A2031707820736F6C696420236536653665363B0D0A2020626F726465722D7261646975733A203270783B0D0A20206261636B67726F756E642D636F6C6F723A202366666666';
wwv_flow_api.g_varchar2_table(26) := '66663B0D0A7D0D0A2E742D426F64792D696E666F202E612D4D696E6943616C2D7469746C65207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D426F64792D696E666F202E612D4D696E6943616C2D6461794F665765656B207B0D0A';
wwv_flow_api.g_varchar2_table(27) := '2020636F6C6F723A20233830383038303B0D0A7D0D0A2E742D426F64792D696E666F202E612D4D696E6943616C2D646179207B0D0A2020626F726465722D636F6C6F723A20236639663966393B0D0A2020636F6C6F723A20233430343034303B0D0A7D0D';
wwv_flow_api.g_varchar2_table(28) := '0A2E742D426F64792D696E666F202E612D4D696E6943616C2D6461792E69732D746F646179202E612D4D696E6943616C2D64617465207B0D0A20206261636B67726F756E642D636F6C6F723A20233332333333363B0D0A2020636F6C6F723A2023663366';
wwv_flow_api.g_varchar2_table(29) := '3366343B0D0A7D0D0A2E742D426F64792D696E666F202E612D4D696E6943616C2D6461792E69732D616374697665202E612D4D696E6943616C2D64617465207B0D0A20206261636B67726F756E642D636F6C6F723A20236662636534613B0D0A2020636F';
wwv_flow_api.g_varchar2_table(30) := '6C6F723A20233434333330323B0D0A7D0D0A2E742D426F64792D696E666F202E612D4D696E6943616C2D6461792E69732D7765656B656E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236661666166613B0D0A7D0D0A2E742D426F6479';
wwv_flow_api.g_varchar2_table(31) := '2D696E666F202E612D4D696E6943616C2D6461792E69732D6E756C6C207B0D0A20206261636B67726F756E642D636F6C6F723A20236635663566353B0D0A7D0D0A2E742D4156504C6973742D76616C7565207B0D0A2020636F6C6F723A20233436343634';
wwv_flow_api.g_varchar2_table(32) := '363B0D0A7D0D0A2E742D426F64792D696E666F202E742D4156504C6973742D76616C7565207B0D0A2020636F6C6F723A20233464346434643B0D0A7D0D0A2E742D526567696F6E202E742D4156504C6973742D76616C7565207B0D0A2020636F6C6F723A';
wwv_flow_api.g_varchar2_table(33) := '20233464346434643B0D0A7D0D0A2E742D4156504C6973742D6C6162656C207B0D0A2020636F6C6F723A20233166316631663B0D0A7D0D0A2E742D426F64792D696E666F202E742D4156504C6973742D6C6162656C207B0D0A2020636F6C6F723A202332';
wwv_flow_api.g_varchar2_table(34) := '36323632363B0D0A7D0D0A2E742D526567696F6E202E742D4156504C6973742D6C6162656C207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A0D0A2E742D416C6572742D2D77697A6172642C0D0A2E742D416C6572742D2D686F72697A6F';
wwv_flow_api.g_varchar2_table(35) := '6E74616C207B0D0A2020626F726465722D7261646975733A203270783B0D0A7D0D0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D7761726E696E672C0D0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D7965';
wwv_flow_api.g_varchar2_table(36) := '6C6C6F77207B0D0A20206261636B67726F756E642D636F6C6F723A20236665663765303B0D0A2020636F6C6F723A20233030303030303B0D0A7D0D0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D73756363657373207B0D0A2020';
wwv_flow_api.g_varchar2_table(37) := '6261636B67726F756E642D636F6C6F723A20236635666166343B0D0A2020636F6C6F723A20233030303030303B0D0A7D0D0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D64616E6765722C0D0A2E742D416C6572742D2D636F6C6F';
wwv_flow_api.g_varchar2_table(38) := '7242472E742D416C6572742D2D726564207B0D0A20206261636B67726F756E642D636F6C6F723A20236666663866373B0D0A2020636F6C6F723A20233030303030303B0D0A7D0D0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D69';
wwv_flow_api.g_varchar2_table(39) := '6E666F207B0D0A20206261636B67726F756E642D636F6C6F723A20236639666366663B0D0A2020636F6C6F723A20233030303030303B0D0A7D0D0A2E742D416C6572742D69636F6E202E742D49636F6E207B0D0A2020636F6C6F723A20234646463B0D0A';
wwv_flow_api.g_varchar2_table(40) := '7D0D0A0D0A2E742D416C6572742D2D7761726E696E67202E742D416C6572742D69636F6E202E742D49636F6E2C0D0A2E742D416C6572742D2D79656C6C6F77202E742D416C6572742D69636F6E202E742D49636F6E207B0D0A2020636F6C6F723A202366';
wwv_flow_api.g_varchar2_table(41) := '62636534613B0D0A7D0D0A2E742D416C6572742D2D7761726E696E672E742D416C6572742D2D686F72697A6F6E74616C202E742D416C6572742D69636F6E2C0D0A2E742D416C6572742D2D79656C6C6F772E742D416C6572742D2D686F72697A6F6E7461';
wwv_flow_api.g_varchar2_table(42) := '6C202E742D416C6572742D69636F6E207B0D0A20206261636B67726F756E642D636F6C6F723A2072676261283235312C203230362C2037342C20302E3135293B0D0A7D0D0A0D0A2E742D416C6572742D2D73756363657373202E742D416C6572742D6963';
wwv_flow_api.g_varchar2_table(43) := '6F6E202E742D49636F6E207B0D0A2020636F6C6F723A20233362616132633B0D0A7D0D0A2E742D416C6572742D2D737563636573732E742D416C6572742D2D686F72697A6F6E74616C202E742D416C6572742D69636F6E207B0D0A20206261636B67726F';
wwv_flow_api.g_varchar2_table(44) := '756E642D636F6C6F723A20726762612835392C203137302C2034342C20302E3135293B0D0A7D0D0A0D0A2E742D416C6572742D2D696E666F202E742D416C6572742D69636F6E202E742D49636F6E207B0D0A2020636F6C6F723A20233030373664663B0D';
wwv_flow_api.g_varchar2_table(45) := '0A7D0D0A2E742D416C6572742D2D696E666F2E742D416C6572742D2D686F72697A6F6E74616C202E742D416C6572742D69636F6E207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C203131382C203232332C20302E3135293B';
wwv_flow_api.g_varchar2_table(46) := '0D0A7D0D0A0D0A2E742D416C6572742D2D64616E676572202E742D416C6572742D69636F6E202E742D49636F6E2C0D0A2E742D416C6572742D2D726564202E742D416C6572742D69636F6E202E742D49636F6E207B0D0A2020636F6C6F723A2023663434';
wwv_flow_api.g_varchar2_table(47) := '3333363B0D0A7D0D0A2E742D416C6572742D2D64616E6765722E742D416C6572742D2D686F72697A6F6E74616C202E742D416C6572742D69636F6E2C0D0A2E742D416C6572742D2D7265642E742D416C6572742D2D686F72697A6F6E74616C202E742D41';
wwv_flow_api.g_varchar2_table(48) := '6C6572742D69636F6E207B0D0A20206261636B67726F756E642D636F6C6F723A2072676261283234342C2036372C2035342C20302E3135293B0D0A7D0D0A2E742D416C6572742D2D77697A617264202E742D416C6572742D696E736574207B0D0A202062';
wwv_flow_api.g_varchar2_table(49) := '6F726465722D7261646975733A203270783B0D0A7D0D0A2E742D416C6572742D2D686F72697A6F6E74616C2C0D0A2E742D416C6572742D2D77697A617264207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A2020636F';
wwv_flow_api.g_varchar2_table(50) := '6C6F723A20233236323632363B0D0A7D0D0A2E742D416C6572742D2D706167652E742D416C6572742D2D73756363657373207B0D0A20206261636B67726F756E642D636F6C6F723A20726762612835392C203137302C2034342C20302E39293B0D0A2020';
wwv_flow_api.g_varchar2_table(51) := '636F6C6F723A20236666666666663B0D0A7D0D0A2E742D416C6572742D2D706167652E742D416C6572742D2D73756363657373202E742D416C6572742D69636F6E207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E74';
wwv_flow_api.g_varchar2_table(52) := '3B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D416C6572742D2D706167652E742D416C6572742D2D73756363657373202E742D416C6572742D69636F6E202E742D49636F6E207B0D0A2020636F6C6F723A20696E68657269743B0D';
wwv_flow_api.g_varchar2_table(53) := '0A7D0D0A2E742D416C6572742D2D706167652E742D416C6572742D2D73756363657373202E742D427574746F6E2D2D636C6F7365416C657274207B0D0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D0D0A2E742D416C65';
wwv_flow_api.g_varchar2_table(54) := '72742D2D706167652E742D416C6572742D2D73756363657373202E742D416C6572742D636F6E74656E74207B0D0A202070616464696E672D72696768743A20303B0D0A202070616464696E672D6C6566743A20303B0D0A7D0D0A0D0A2E742D4261646765';
wwv_flow_api.g_varchar2_table(55) := '4C6973742C0D0A2E742D42616467654C6973743A6E6F74282E752D636F6C6F7273292061202E742D42616467654C6973742D6C6162656C207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D42616467654C6973742D2D6369726375';
wwv_flow_api.g_varchar2_table(56) := '6C6172202E742D42616467654C6973742D76616C7565207B0D0A2020626F782D736861646F773A2030203020302031707820726762612833382C2033382C2033382C20302E312920696E7365743B0D0A20206261636B67726F756E642D636F6C6F723A20';
wwv_flow_api.g_varchar2_table(57) := '236666666666663B0D0A7D0D0A2E742D42616467654C6973742D2D63697263756C617220612E742D42616467654C6973742D777261703A686F766572202E742D42616467654C6973742D76616C7565207B0D0A2020626F782D736861646F773A20302030';
wwv_flow_api.g_varchar2_table(58) := '203020347078202333323333333620696E7365743B0D0A20206261636B67726F756E642D636F6C6F723A20233332333333363B0D0A2020636F6C6F723A20236633663366343B0D0A7D0D0A2E742D42616467654C6973742D2D6461736820612E742D4261';
wwv_flow_api.g_varchar2_table(59) := '6467654C6973742D777261703A666F6375732C0D0A2E742D42616467654C6973742D2D64617368202E742D42616467654C6973742D777261703A666F6375732D77697468696E2C0D0A2E742D42616467654C6973742D2D63697263756C617220612E742D';
wwv_flow_api.g_varchar2_table(60) := '42616467654C6973742D777261703A666F637573202E742D42616467654C6973742D76616C75652C0D0A2E742D42616467654C6973742D2D63697263756C6172202E742D42616467654C6973742D76616C756520613A666F637573207B0D0A2020626F78';
wwv_flow_api.g_varchar2_table(61) := '2D736861646F773A20302030203020317078202330353662626620696E7365742C20302030203020327078202366666666666620696E7365743B0D0A20206261636B67726F756E642D636F6C6F723A20233332333333363B0D0A2020636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(62) := '6633663366343B0D0A7D0D0A2E742D42616467654C6973742D2D64617368202E742D42616467654C6973742D777261703A666F6375732D77697468696E2C0D0A2E742D42616467654C6973742D2D63697263756C6172202E742D42616467654C6973742D';
wwv_flow_api.g_varchar2_table(63) := '76616C756520613A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20233332333333362021696D706F7274616E743B0D0A2020636F6C6F723A20236633663366342021696D706F7274616E743B0D0A7D0D0A2E742D42616467654C';
wwv_flow_api.g_varchar2_table(64) := '6973742D2D64617368202E742D42616467654C6973742D76616C756520613A666F6375732C0D0A2E742D42616467654C6973742D2D6461736820612E742D42616467654C6973742D777261703A666F6375732D77697468696E202E742D42616467654C69';
wwv_flow_api.g_varchar2_table(65) := '73742D6C6162656C207B0D0A2020636F6C6F723A20236633663366343B0D0A7D0D0A0D0A2E742D42616467654C6973742E752D636F6C6F72732E742D42616467654C6973742D2D63697263756C6172202E742D42616467654C6973742D777261703A6265';
wwv_flow_api.g_varchar2_table(66) := '666F7265207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E742D42616467654C6973742E752D636F6C6F72732E742D42616467654C6973742D2D63697263756C6172202E742D42616467654C6973742D6C61';
wwv_flow_api.g_varchar2_table(67) := '62656C207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D42616467654C6973742E752D636F6C6F7273202E742D42616467654C6973742D76616C75652061207B0D0A2020636F6C6F723A20696E68657269743B0D0A7D0D0A2E612D';
wwv_flow_api.g_varchar2_table(68) := '4261724368617274202E612D42617243686172742D6974656D3A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20236632663266323B0D0A7D0D0A2E742D426F6479202E612D4261724368617274202E612D42617243686172742D';
wwv_flow_api.g_varchar2_table(69) := '6974656D202E612D42617243686172742D76616C7565207B0D0A2020636F6C6F723A20233739373937393B0D0A7D0D0A2E742D426F64792D7469746C65202E612D4261724368617274202E612D42617243686172742D6974656D202E612D426172436861';
wwv_flow_api.g_varchar2_table(70) := '72742D76616C7565207B0D0A2020636F6C6F723A20233830383038303B0D0A7D0D0A2E742D426F64792D696E666F202E612D4261724368617274202E612D42617243686172742D6974656D202E612D42617243686172742D76616C7565207B0D0A202063';
wwv_flow_api.g_varchar2_table(71) := '6F6C6F723A20233830383038303B0D0A7D0D0A2E742D526567696F6E202E612D4261724368617274202E612D42617243686172742D6974656D202E612D42617243686172742D76616C75652C0D0A2E742D427574746F6E526567696F6E202E612D426172';
wwv_flow_api.g_varchar2_table(72) := '4368617274202E612D42617243686172742D6974656D202E612D42617243686172742D76616C7565207B0D0A2020636F6C6F723A20233830383038303B0D0A7D0D0A2E612D4261724368617274202E612D42617243686172742D6974656D20696D67207B';
wwv_flow_api.g_varchar2_table(73) := '0D0A2020626F726465722D7261646975733A203270783B0D0A7D0D0A2E612D4261724368617274202E612D42617243686172742D626172207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E303235293B';
wwv_flow_api.g_varchar2_table(74) := '0D0A7D0D0A2E612D42617243686172742D2D636C6173736963202E612D42617243686172742D6261722C0D0A2E612D42617243686172742D2D636C6173736963202E612D42617243686172742D66696C6C6564207B0D0A2020626F726465722D72616469';
wwv_flow_api.g_varchar2_table(75) := '75733A203170783B0D0A7D0D0A2E612D42617243686172742D2D636C6173736963202E612D42617243686172742D6974656D3A686F766572202E612D42617243686172742D626172207B0D0A20206261636B67726F756E642D636F6C6F723A2072676261';
wwv_flow_api.g_varchar2_table(76) := '28302C20302C20302C20302E3035293B0D0A7D0D0A2E612D42617243686172742D2D6D6F6465726E202E612D42617243686172742D6261722C0D0A2E612D42617243686172742D2D6D6F6465726E202E612D42617243686172742D66696C6C6564207B0D';
wwv_flow_api.g_varchar2_table(77) := '0A2020626F726465722D7261646975733A203170783B0D0A7D0D0A2E612D42617243686172742D2D6D6F6465726E202E612D42617243686172742D6974656D3A686F766572202E612D42617243686172742D626172207B0D0A20206261636B67726F756E';
wwv_flow_api.g_varchar2_table(78) := '642D636F6C6F723A207267626128302C20302C20302C20302E3035293B0D0A7D0D0A2E612D42617243686172742D66696C6C6564207B0D0A20206261636B67726F756E642D636F6C6F723A20233332333333363B0D0A7D0D0A0D0A626F6479207B0D0A20';
wwv_flow_api.g_varchar2_table(79) := '206261636B67726F756E643A20236638663866383B0D0A2020636F6C6F723A20233166316631663B0D0A7D0D0A61207B0D0A2020636F6C6F723A20233035366262663B0D0A7D0D0A2E742D426F64792D616374696F6E73207B0D0A20206261636B67726F';
wwv_flow_api.g_varchar2_table(80) := '756E642D636F6C6F723A20236634663466343B0D0A2020626F726465722D6C6566743A2031707820736F6C6964207267626128302C20302C20302C20302E303735293B0D0A7D0D0A2E742D426F64792D7469746C65207B0D0A20206261636B67726F756E';
wwv_flow_api.g_varchar2_table(81) := '642D636F6C6F723A2072676261283235352C203235352C203235352C20302E39293B0D0A2020636F6C6F723A20233236323632363B0D0A2020626F726465722D626F74746F6D3A2031707820736F6C696420236536653665363B0D0A20202D7765626B69';
wwv_flow_api.g_varchar2_table(82) := '742D6261636B64726F702D66696C7465723A20736174757261746528313830252920626C757228387078293B0D0A7D0D0A2E742D50616765426F64792D2D6D617374657244657461696C2023745F426F64795F636F6E74656E745F6F6666736574207B0D';
wwv_flow_api.g_varchar2_table(83) := '0A20206261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E39293B0D0A7D0D0A2E75692D7769646765742D636F6E74656E74207B0D0A20206261636B67726F756E642D636F6C6F723A2023666666666666';
wwv_flow_api.g_varchar2_table(84) := '3B0D0A7D0D0A2E742D426F6479202E75692D7769646765742D636F6E74656E74207B0D0A2020636F6C6F723A20233339333933393B0D0A7D0D0A2E742D426F64792D7469746C65202E75692D7769646765742D636F6E74656E74207B0D0A2020636F6C6F';
wwv_flow_api.g_varchar2_table(85) := '723A20233430343034303B0D0A7D0D0A2E742D426F64792D696E666F202E75692D7769646765742D636F6E74656E74207B0D0A2020636F6C6F723A20233430343034303B0D0A7D0D0A2E742D526567696F6E202E75692D7769646765742D636F6E74656E';
wwv_flow_api.g_varchar2_table(86) := '742C0D0A2E742D427574746F6E526567696F6E202E75692D7769646765742D636F6E74656E74207B0D0A2020636F6C6F723A20233430343034303B0D0A7D0D0A2E742D426F64792D73696465207B0D0A20206261636B67726F756E642D636F6C6F723A20';
wwv_flow_api.g_varchar2_table(87) := '236666666666663B0D0A2020636F6C6F723A20233166316631663B0D0A7D0D0A2E617065782D7264732D636F6E7461696E6572207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A2E742D426F64792D';
wwv_flow_api.g_varchar2_table(88) := '696E666F202E617065782D7264732D636F6E7461696E6572207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E742D426F64792D696E666F202E617065782D7264732D636F6E7461696E65722E69732D737475';
wwv_flow_api.g_varchar2_table(89) := '636B207B0D0A20206261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E3935293B0D0A20202D7765626B69742D6261636B64726F702D66696C7465723A20626C757228347078293B0D0A7D0D0A2E742D42';
wwv_flow_api.g_varchar2_table(90) := '6F64792D696E666F207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E742D426F64792D7469746C652E6A732D6869646542726561646372756D6273207B0D0A20206261636B67726F756E642D636F6C6F723A';
wwv_flow_api.g_varchar2_table(91) := '207267626128302C20302C20302C20302E3935293B0D0A7D0D0A2E742D426F64792D746F70427574746F6E207B0D0A2020626F726465722D7261646975733A20313030253B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D';
wwv_flow_api.g_varchar2_table(92) := '0A2020636F6C6F723A20236536653665363B0D0A7D0D0A2E742D426F64792D746F70427574746F6E3A666F637573207B0D0A2020626F782D736861646F773A20302030203020317078202330353662626620696E7365742C203020317078203270782072';
wwv_flow_api.g_varchar2_table(93) := '67626128302C20302C20302C20302E3135293B0D0A7D0D0A2E742D426F64792D746F70427574746F6E3A686F7665722C0D0A2E742D426F64792D746F70427574746F6E3A666F637573207B0D0A2020636F6C6F723A20233035366262663B0D0A7D0D0A2E';
wwv_flow_api.g_varchar2_table(94) := '742D426F64792D746F70427574746F6E3A616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A2020636F6C6F723A20236536653665363B0D0A7D0D0A0D0A2E742D4865616465722D6272616E64696E6720';
wwv_flow_api.g_varchar2_table(95) := '7B0D0A20206865696768743A20343870783B0D0A7D0D0A2E742D426F64792D636F6E74656E74207B0D0A20206D696E2D6865696768743A2063616C63283130307668202D202034387078293B0D0A7D0D0A0D0A2E617065782D736964652D6E6176202E74';
wwv_flow_api.g_varchar2_table(96) := '2D426F64792D6E61762C0D0A2E617065782D736964652D6E6176202E742D426F64792D616374696F6E732C0D0A2E617065782D736964652D6E6176202E742D426F64792D7469746C65207B0D0A2020746F703A20343870783B0D0A7D0D0A406D65646961';
wwv_flow_api.g_varchar2_table(97) := '206F6E6C792073637265656E20616E6420286D696E2D77696474683A20363431707829207B0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E6176202E742D426F64792D7469746C65207B0D0A202020206C6566743A2032343070';
wwv_flow_api.g_varchar2_table(98) := '783B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E6176202E742D426F64792D7469746C65207B0D0A2020202072696768743A2032343070783B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D';
wwv_flow_api.g_varchar2_table(99) := '6E6176202E742D426F64792D7469746C65207B0D0A2020202072696768743A20303B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E6176202E742D426F64792D7469746C65207B0D0A202020206C6566743A20303B0D0A20207D0D';
wwv_flow_api.g_varchar2_table(100) := '0A7D0D0A406D65646961206F6E6C792073637265656E20616E6420286D696E2D77696474683A20363431707829207B0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E6176202E742D426F64792D636F6E74656E74207B0D0A2020';
wwv_flow_api.g_varchar2_table(101) := '20206D617267696E2D6C6566743A2032343070783B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E6176202E742D426F64792D636F6E74656E74207B0D0A202020206D617267696E2D72696768743A2032343070783B0D0A20207D';
wwv_flow_api.g_varchar2_table(102) := '0D0A7D0D0A3A6E6F74282E752D52544C29202E617065782D736964652D6E6176202E742D426F64792D6D61696E207B0D0A20206D617267696E2D6C6566743A20303B0D0A7D0D0A2E752D52544C202E617065782D736964652D6E6176202E742D426F6479';
wwv_flow_api.g_varchar2_table(103) := '2D6D61696E207B0D0A20206D617267696E2D72696768743A20303B0D0A7D0D0A0D0A2E617065782D746F702D6E6176202E742D426F64792D616374696F6E73207B0D0A2020746F703A20383870783B0D0A7D0D0A2E617065782D746F702D6E6176202E74';
wwv_flow_api.g_varchar2_table(104) := '2D426F64792D7469746C65207B0D0A2020746F703A20383870783B0D0A7D0D0A406D65646961206F6E6C792073637265656E20616E6420286D61782D77696474683A20363430707829207B0D0A20202E617065782D746F702D6E61762E6A732D6D656E75';
wwv_flow_api.g_varchar2_table(105) := '4E6176436F6C6C6170736564202E742D4865616465722D6E6176207B0D0A202020207472616E73666F726D3A207472616E736C61746559282D31303025293B0D0A20207D0D0A7D0D0A0D0A2E742D426F64792D6E6176207B0D0A202077696474683A2032';
wwv_flow_api.g_varchar2_table(106) := '343070783B0D0A7D0D0A0D0A2E742D426F64792D616374696F6E73207B0D0A202077696474683A2032303070783B0D0A7D0D0A3A6E6F74282E752D52544C29202E742D426F64792D616374696F6E73202E742D427574746F6E2D2D686561646572207B0D';
wwv_flow_api.g_varchar2_table(107) := '0A20207472616E73666F726D3A207472616E736C6174653364282D343070782C20302C2030293B0D0A7D0D0A2E752D52544C202E742D426F64792D616374696F6E73202E742D427574746F6E2D2D686561646572207B0D0A20207472616E73666F726D3A';
wwv_flow_api.g_varchar2_table(108) := '207472616E736C617465336428343070782C20302C2030293B0D0A7D0D0A0D0A406D65646961206F6E6C792073637265656E20616E6420286D696E2D77696474683A20363431707829207B0D0A20202E742D426F64792D73696465207B0D0A2020202077';
wwv_flow_api.g_varchar2_table(109) := '696474683A2032343070783B0D0A20207D0D0A7D0D0A406D65646961206F6E6C792073637265656E20616E6420286D696E2D77696474683A20363431707829207B0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E6176202E742D';
wwv_flow_api.g_varchar2_table(110) := '426F64792D73696465207B0D0A202020206C6566743A20343870783B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E6176202E742D426F64792D73696465207B0D0A2020202072696768743A20343870783B0D0A20207D0D0A7D0D';
wwv_flow_api.g_varchar2_table(111) := '0A0D0A3A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176457870616E646564202E742D426F64792D6D61696E207B0D0A20206D617267696E2D6C6566743A20343870783B0D0A7D0D0A2E752D52544C202E617065782D';
wwv_flow_api.g_varchar2_table(112) := '736964652D6E61762E6A732D6E6176457870616E646564202E742D426F64792D6D61696E207B0D0A20206D617267696E2D72696768743A20343870783B0D0A7D0D0A3A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176';
wwv_flow_api.g_varchar2_table(113) := '457870616E646564202E742D426F64792D6D61696E207B0D0A20207472616E73666F726D3A207472616E736C61746533642831393270782C20302C2030293B0D0A7D0D0A2E752D52544C202E617065782D736964652D6E61762E6A732D6E617645787061';
wwv_flow_api.g_varchar2_table(114) := '6E646564202E742D426F64792D6D61696E207B0D0A20207472616E73666F726D3A207472616E736C6174653364282D31393270782C20302C2030293B0D0A7D0D0A406D65646961206F6E6C792073637265656E20616E6420286D61782D77696474683A20';
wwv_flow_api.g_varchar2_table(115) := '343830707829207B0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176457870616E646564202E742D426F64792D7469746C652C0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E6176';
wwv_flow_api.g_varchar2_table(116) := '2E6A732D6E6176457870616E646564202E742D426F64792D736964652C0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176457870616E646564202E742D426F64792D636F6E74656E74207B0D0A202020206D';
wwv_flow_api.g_varchar2_table(117) := '617267696E2D6C6566743A20303B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176457870616E646564202E742D426F64792D7469746C652C0D0A20202E752D52544C202E617065782D736964652D6E61762E';
wwv_flow_api.g_varchar2_table(118) := '6A732D6E6176457870616E646564202E742D426F64792D736964652C0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176457870616E646564202E742D426F64792D636F6E74656E74207B0D0A202020206D617267696E2D72';
wwv_flow_api.g_varchar2_table(119) := '696768743A20303B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176457870616E646564202E742D426F64792D6D61696E207B0D0A202020206D617267696E2D6C6566743A20303B0D0A20207D';
wwv_flow_api.g_varchar2_table(120) := '0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176457870616E646564202E742D426F64792D6D61696E207B0D0A202020206D617267696E2D72696768743A20303B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E';
wwv_flow_api.g_varchar2_table(121) := '617065782D736964652D6E61762E6A732D6E6176457870616E646564202E742D426F64792D6D61696E207B0D0A202020207472616E73666F726D3A207472616E736C61746533642832343070782C20302C2030293B0D0A20207D0D0A20202E752D52544C';
wwv_flow_api.g_varchar2_table(122) := '202E617065782D736964652D6E61762E6A732D6E6176457870616E646564202E742D426F64792D6D61696E207B0D0A202020207472616E73666F726D3A207472616E736C6174653364282D32343070782C20302C2030293B0D0A20207D0D0A7D0D0A406D';
wwv_flow_api.g_varchar2_table(123) := '65646961206F6E6C792073637265656E20616E6420286D696E2D77696474683A20363431707829207B0D0A20202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D686964654C656674202E742D42';
wwv_flow_api.g_varchar2_table(124) := '6F64792D7469746C652C0D0A20202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D686964654C656674202E742D426F64792D636F6E74656E742C0D0A20202E617065782D736964652D6E61762E';
wwv_flow_api.g_varchar2_table(125) := '6A732D6E6176457870616E6465642E742D50616765426F64792D2D686964654C656674202E742D426F64792D6D61696E207B0D0A202020207472616E73666F726D3A206E6F6E653B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E617065782D';
wwv_flow_api.g_varchar2_table(126) := '736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D686964654C656674202E742D426F64792D7469746C65207B0D0A202020206C6566743A2032343070783B0D0A20207D0D0A20202E752D52544C202E617065782D';
wwv_flow_api.g_varchar2_table(127) := '736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D686964654C656674202E742D426F64792D7469746C65207B0D0A2020202072696768743A2032343070783B0D0A20207D0D0A20203A6E6F74282E752D52544C29';
wwv_flow_api.g_varchar2_table(128) := '202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D686964654C656674202E742D426F64792D7469746C65207B0D0A2020202072696768743A20303B0D0A20207D0D0A20202E752D52544C202E61';
wwv_flow_api.g_varchar2_table(129) := '7065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D686964654C656674202E742D426F64792D7469746C65207B0D0A202020206C6566743A20303B0D0A20207D0D0A20203A6E6F74282E752D52544C2920';
wwv_flow_api.g_varchar2_table(130) := '2E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D686964654C656674202E742D426F64792D636F6E74656E74207B0D0A202020206D617267696E2D6C6566743A2031393270783B0D0A20207D0D0A';
wwv_flow_api.g_varchar2_table(131) := '20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D686964654C656674202E742D426F64792D636F6E74656E74207B0D0A202020206D617267696E2D72696768743A20313932';
wwv_flow_api.g_varchar2_table(132) := '70783B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D686964654C656674202E742D426F64792D6D61696E207B0D0A202020206D617267';
wwv_flow_api.g_varchar2_table(133) := '696E2D6C6566743A20343870783B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D686964654C656674202E742D426F64792D6D61696E207B0D0A202020';
wwv_flow_api.g_varchar2_table(134) := '206D617267696E2D72696768743A20343870783B0D0A20207D0D0A20202E617065782D736964652D6E61762E6A732D6E6176457870616E646564202E742D426F64792D73696465207B0D0A202020207472616E73666F726D3A207472616E736C61746533';
wwv_flow_api.g_varchar2_table(135) := '642832343070782C20302C2030293B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176457870616E646564202E742D426F64792D73696465207B0D0A202020207472616E73666F726D3A207472616E736C6174';
wwv_flow_api.g_varchar2_table(136) := '653364282D32343070782C20302C2030293B0D0A20207D0D0A20202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D6D61696E207B0D0A202020207472';
wwv_flow_api.g_varchar2_table(137) := '616E73666F726D3A206E6F6E653B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D6D61696E20';
wwv_flow_api.g_varchar2_table(138) := '7B0D0A202020206D617267696E2D6C6566743A20303B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D6D6169';
wwv_flow_api.g_varchar2_table(139) := '6E207B0D0A202020206D617267696E2D72696768743A20303B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C656674202E74';
wwv_flow_api.g_varchar2_table(140) := '2D426F64792D73696465207B0D0A202020206C6566743A20303B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F6479';
wwv_flow_api.g_varchar2_table(141) := '2D73696465207B0D0A2020202072696768743A20303B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F';
wwv_flow_api.g_varchar2_table(142) := '64792D636F6E74656E74207B0D0A202020206D617267696E2D6C6566743A2032383870783B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C';
wwv_flow_api.g_varchar2_table(143) := '656674202E742D426F64792D636F6E74656E74207B0D0A202020206D617267696E2D72696768743A2032383870783B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E74';
wwv_flow_api.g_varchar2_table(144) := '2D50616765426F64792D2D73686F774C656674202E742D426F64792D636F6E74656E74207B0D0A202020207472616E73666F726D3A207472616E736C61746533642831393270782C20302C2030293B0D0A20207D0D0A20202E752D52544C202E61706578';
wwv_flow_api.g_varchar2_table(145) := '2D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D636F6E74656E74207B0D0A202020207472616E73666F726D3A207472616E736C6174653364282D31393270782C20';
wwv_flow_api.g_varchar2_table(146) := '302C2030293B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D7469746C65207B0D0A20202020';
wwv_flow_api.g_varchar2_table(147) := '6C6566743A20303B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D7469746C65207B0D0A2020202072696768';
wwv_flow_api.g_varchar2_table(148) := '743A20303B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D7469746C65207B0D0A2020202074';
wwv_flow_api.g_varchar2_table(149) := '72616E73666F726D3A207472616E736C61746533642832343070782C20302C2030293B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C6566';
wwv_flow_api.g_varchar2_table(150) := '74202E742D426F64792D7469746C65207B0D0A202020207472616E73666F726D3A207472616E736C6174653364282D32343070782C20302C2030293B0D0A20207D0D0A7D0D0A406D65646961206F6E6C792073637265656E20616E6420286D696E2D7769';
wwv_flow_api.g_varchar2_table(151) := '6474683A20393933707829207B0D0A20202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D6D61696E207B0D0A202020207472616E73666F726D3A206E';
wwv_flow_api.g_varchar2_table(152) := '6F6E653B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D6D61696E207B0D0A202020206D6172';
wwv_flow_api.g_varchar2_table(153) := '67696E2D6C6566743A20303B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D6D61696E207B0D0A202020206D';
wwv_flow_api.g_varchar2_table(154) := '617267696E2D72696768743A20303B0D0A20207D0D0A20202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D7469746C65207B0D0A202020207472616E';
wwv_flow_api.g_varchar2_table(155) := '73666F726D3A206E6F6E652021696D706F7274616E743B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D42';
wwv_flow_api.g_varchar2_table(156) := '6F64792D7469746C65207B0D0A202020206D617267696E2D6C6566743A2032343070783B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C65';
wwv_flow_api.g_varchar2_table(157) := '6674202E742D426F64792D7469746C65207B0D0A202020206D617267696E2D72696768743A2032343070783B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D5061';
wwv_flow_api.g_varchar2_table(158) := '6765426F64792D2D73686F774C656674202E742D426F64792D636F6E74656E74207B0D0A202020206D617267696E2D6C6566743A2034383070783B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E617645787061';
wwv_flow_api.g_varchar2_table(159) := '6E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D636F6E74656E74207B0D0A202020206D617267696E2D72696768743A2034383070783B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E617065782D736964';
wwv_flow_api.g_varchar2_table(160) := '652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D636F6E74656E742C0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E74';
wwv_flow_api.g_varchar2_table(161) := '2D50616765426F64792D2D73686F774C656674202E742D426F64792D636F6E74656E74207B0D0A202020207472616E73666F726D3A206E6F6E653B0D0A20207D0D0A7D0D0A0D0A2E617065782D736964652D6E61762E6A732D6E6176436F6C6C61707365';
wwv_flow_api.g_varchar2_table(162) := '64202E742D426F64792D6E61762C0D0A2E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D6E6176202E742D547265654E6176207B0D0A202077696474683A20343870783B0D0A7D0D0A3A6E6F74282E752D';
wwv_flow_api.g_varchar2_table(163) := '52544C29202E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D636F6E74656E742C0D0A3A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E74';
wwv_flow_api.g_varchar2_table(164) := '2D426F64792D7469746C652C0D0A3A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D73696465207B0D0A20206D617267696E2D6C6566743A20343870783B0D0A7D0D0A2E';
wwv_flow_api.g_varchar2_table(165) := '752D52544C202E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D636F6E74656E742C0D0A2E752D52544C202E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F6479';
wwv_flow_api.g_varchar2_table(166) := '2D7469746C652C0D0A2E752D52544C202E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D73696465207B0D0A20206D617267696E2D72696768743A20343870783B0D0A7D0D0A3A6E6F74282E752D52544C';
wwv_flow_api.g_varchar2_table(167) := '29202E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D7469746C652E69732D737475636B207B0D0A20206C6566743A20303B0D0A7D0D0A2E752D52544C202E617065782D736964652D6E61762E6A732D6E';
wwv_flow_api.g_varchar2_table(168) := '6176436F6C6C6170736564202E742D426F64792D7469746C652E69732D737475636B207B0D0A202072696768743A20303B0D0A7D0D0A406D65646961206F6E6C792073637265656E20616E6420286D61782D77696474683A20343830707829207B0D0A20';
wwv_flow_api.g_varchar2_table(169) := '202E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D6E6176207B0D0A202020207472616E73666F726D3A207472616E736C61746558282D34387078293B0D0A20207D0D0A20202E752D52544C202E617065';
wwv_flow_api.g_varchar2_table(170) := '782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D6E6176207B0D0A202020207472616E73666F726D3A207472616E736C617465582834387078293B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E617065';
wwv_flow_api.g_varchar2_table(171) := '782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D7469746C652C0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D736964';
wwv_flow_api.g_varchar2_table(172) := '652C0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D636F6E74656E74207B0D0A202020206D617267696E2D6C6566743A20303B0D0A20207D0D0A20202E752D';
wwv_flow_api.g_varchar2_table(173) := '52544C202E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D7469746C652C0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D73';
wwv_flow_api.g_varchar2_table(174) := '6964652C0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D636F6E74656E74207B0D0A202020206D617267696E2D72696768743A20303B0D0A20207D0D0A7D0D0A406D656469';
wwv_flow_api.g_varchar2_table(175) := '61206F6E6C792073637265656E20616E6420286D61782D77696474683A20363430707829207B0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176436F6C6C61707365642E742D50616765426F64792E6A732D';
wwv_flow_api.g_varchar2_table(176) := '7269676874457870616E646564202E742D426F64792D6D61696E207B0D0A202020206D617267696E2D6C6566743A20303B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176436F6C6C61707365642E742D5061';
wwv_flow_api.g_varchar2_table(177) := '6765426F64792E6A732D7269676874457870616E646564202E742D426F64792D6D61696E207B0D0A202020206D617267696E2D72696768743A20303B0D0A20207D0D0A7D0D0A406D65646961206F6E6C792073637265656E20616E6420286D696E2D7769';
wwv_flow_api.g_varchar2_table(178) := '6474683A20363431707829207B0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D7469746C65207B0D0A202020206D617267696E2D6C6566743A20303B0D0A20';
wwv_flow_api.g_varchar2_table(179) := '207D0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D7469746C65207B0D0A202020206D617267696E2D72696768743A20303B0D0A20207D0D0A20203A6E6F74282E752D5254';
wwv_flow_api.g_varchar2_table(180) := '4C29202E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D7469746C65207B0D0A202020206C6566743A20343870783B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D';
wwv_flow_api.g_varchar2_table(181) := '6E6176436F6C6C6170736564202E742D426F64792D7469746C65207B0D0A2020202072696768743A20343870783B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176436F6C6C61707365642E74';
wwv_flow_api.g_varchar2_table(182) := '2D50616765426F64792D2D73686F774C656674202E742D426F64792D73696465207B0D0A202020206D617267696E2D6C6566743A20303B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176436F6C6C61707365';
wwv_flow_api.g_varchar2_table(183) := '642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D73696465207B0D0A202020206D617267696E2D72696768743A20303B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E';
wwv_flow_api.g_varchar2_table(184) := '6176436F6C6C61707365642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D636F6E74656E74207B0D0A202020206D617267696E2D6C6566743A2032383870783B0D0A20207D0D0A20202E752D52544C202E617065782D736964';
wwv_flow_api.g_varchar2_table(185) := '652D6E61762E6A732D6E6176436F6C6C61707365642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D636F6E74656E74207B0D0A202020206D617267696E2D72696768743A2032383870783B0D0A20207D0D0A7D0D0A406D6564';
wwv_flow_api.g_varchar2_table(186) := '6961206F6E6C792073637265656E20616E6420286D696E2D77696474683A20393933707829207B0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D7369646520';
wwv_flow_api.g_varchar2_table(187) := '7B0D0A202020206C6566743A20343870783B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D73696465207B0D0A2020202072696768743A20343870783B0D0A20';
wwv_flow_api.g_varchar2_table(188) := '207D0D0A7D0D0A0D0A2E742D50616765426F64792E6A732D7269676874457870616E646564202E742D426F64792D6D61696E207B0D0A20206D617267696E2D72696768743A20303B0D0A7D0D0A3A6E6F74282E752D52544C29202E742D50616765426F64';
wwv_flow_api.g_varchar2_table(189) := '792E6A732D7269676874457870616E646564202E742D426F64792D6D61696E2C0D0A3A6E6F74282E752D52544C29202E742D50616765426F64792E6A732D7269676874457870616E646564202E742D426F64792D6E6176207B0D0A20207472616E73666F';
wwv_flow_api.g_varchar2_table(190) := '726D3A207472616E736C6174653364282D32303070782C20302C2030293B0D0A7D0D0A2E752D52544C202E742D50616765426F64792E6A732D7269676874457870616E646564202E742D426F64792D6D61696E2C0D0A2E752D52544C202E742D50616765';
wwv_flow_api.g_varchar2_table(191) := '426F64792E6A732D7269676874457870616E646564202E742D426F64792D6E6176207B0D0A20207472616E73666F726D3A207472616E736C61746533642832303070782C20302C2030293B0D0A7D0D0A406D65646961206F6E6C792073637265656E2061';
wwv_flow_api.g_varchar2_table(192) := '6E6420286D696E2D77696474683A20363431707829207B0D0A20202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D686964654C656674202E742D426F64792D6D61696E2C0D0A20202E742D506167';
wwv_flow_api.g_varchar2_table(193) := '65426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D686964654C656674202E742D426F64792D6E6176207B0D0A202020207472616E73666F726D3A206E6F6E653B0D0A20207D0D0A20203A6E6F74282E752D52544C29';
wwv_flow_api.g_varchar2_table(194) := '202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D686964654C656674202E742D426F64792D6D61696E207B0D0A202020206D617267696E2D72696768743A2032303070783B0D0A20207D0D0A2020';
wwv_flow_api.g_varchar2_table(195) := '2E752D52544C202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D686964654C656674202E742D426F64792D6D61696E207B0D0A202020206D617267696E2D6C6566743A2032303070783B0D0A2020';
wwv_flow_api.g_varchar2_table(196) := '7D0D0A20203A6E6F74282E752D52544C29202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D686964654C656674202E742D426F64792D7469746C65207B0D0A2020202072696768743A2032303070';
wwv_flow_api.g_varchar2_table(197) := '783B0D0A20207D0D0A20202E752D52544C202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D686964654C656674202E742D426F64792D7469746C65207B0D0A202020206C6566743A203230307078';
wwv_flow_api.g_varchar2_table(198) := '3B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D7469746C65207B0D0A2020202072696768743A';
wwv_flow_api.g_varchar2_table(199) := '20303B0D0A20207D0D0A20202E752D52544C202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D7469746C65207B0D0A202020206C6566743A20303B0D0A';
wwv_flow_api.g_varchar2_table(200) := '20207D0D0A20203A6E6F74282E752D52544C29202E742D50616765426F64792E6A732D7269676874457870616E6465642E6A732D6E6176436F6C6C61707365642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D73696465207B';
wwv_flow_api.g_varchar2_table(201) := '0D0A202020206D617267696E2D6C6566743A20303B0D0A20207D0D0A20202E752D52544C202E742D50616765426F64792E6A732D7269676874457870616E6465642E6A732D6E6176436F6C6C61707365642E742D50616765426F64792D2D73686F774C65';
wwv_flow_api.g_varchar2_table(202) := '6674202E742D426F64792D73696465207B0D0A202020206D617267696E2D72696768743A20303B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E742D50616765426F64792E6A732D7269676874457870616E6465642E6A732D6E6176436F6C6C';
wwv_flow_api.g_varchar2_table(203) := '61707365642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D73696465207B0D0A202020206C6566743A20303B0D0A20207D0D0A20202E752D52544C202E742D50616765426F64792E6A732D7269676874457870616E6465642E';
wwv_flow_api.g_varchar2_table(204) := '6A732D6E6176436F6C6C61707365642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D73696465207B0D0A2020202072696768743A20303B0D0A20207D0D0A7D0D0A406D65646961206F6E6C792073637265656E20616E642028';
wwv_flow_api.g_varchar2_table(205) := '6D696E2D77696474683A20393933707829207B0D0A20203A6E6F74282E752D52544C29202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D6D61696E207B';
wwv_flow_api.g_varchar2_table(206) := '0D0A202020206D617267696E2D72696768743A2032303070783B0D0A20207D0D0A20202E752D52544C202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D';
wwv_flow_api.g_varchar2_table(207) := '6D61696E207B0D0A202020206D617267696E2D6C6566743A2032303070783B0D0A20207D0D0A20202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D6D61';
wwv_flow_api.g_varchar2_table(208) := '696E2C0D0A20202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D6E6176207B0D0A202020207472616E73666F726D3A206E6F6E653B0D0A20207D0D0A20';
wwv_flow_api.g_varchar2_table(209) := '203A6E6F74282E752D52544C29202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D7469746C65207B0D0A2020202072696768743A2032303070783B0D0A';
wwv_flow_api.g_varchar2_table(210) := '20207D0D0A20202E752D52544C202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D7469746C65207B0D0A202020206C6566743A2032303070783B0D0A20';
wwv_flow_api.g_varchar2_table(211) := '207D0D0A20203A6E6F74282E752D52544C29202E742D50616765426F64792E6A732D7269676874457870616E6465642E6A732D6E6176436F6C6C61707365642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D73696465207B0D';
wwv_flow_api.g_varchar2_table(212) := '0A202020206C6566743A20343870783B0D0A20207D0D0A20202E752D52544C202E742D50616765426F64792E6A732D7269676874457870616E6465642E6A732D6E6176436F6C6C61707365642E742D50616765426F64792D2D73686F774C656674202E74';
wwv_flow_api.g_varchar2_table(213) := '2D426F64792D73696465207B0D0A2020202072696768743A20343870783B0D0A20207D0D0A7D0D0A406D65646961206F6E6C792073637265656E20616E6420286D61782D77696474683A20393932707829207B0D0A20202E742D50616765426F64792E6A';
wwv_flow_api.g_varchar2_table(214) := '732D7269676874457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D6D61696E207B0D0A202020207472616E73666F726D3A206E6F6E653B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E742D5061';
wwv_flow_api.g_varchar2_table(215) := '6765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D7469746C652C0D0A20203A6E6F74282E752D52544C29202E742D50616765426F64792E6A732D726967687445787061';
wwv_flow_api.g_varchar2_table(216) := '6E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D736964652C0D0A20203A6E6F74282E752D52544C29202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D73686F';
wwv_flow_api.g_varchar2_table(217) := '774C656674202E742D426F64792D636F6E74656E74207B0D0A202020207472616E73666F726D3A207472616E736C6174653364282D32303070782C20302C2030293B0D0A20207D0D0A20202E752D52544C202E742D50616765426F64792E6A732D726967';
wwv_flow_api.g_varchar2_table(218) := '6874457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D7469746C652C0D0A20202E752D52544C202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D7368';
wwv_flow_api.g_varchar2_table(219) := '6F774C656674202E742D426F64792D736964652C0D0A20202E752D52544C202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D636F6E74656E74207B0D0A';
wwv_flow_api.g_varchar2_table(220) := '202020207472616E73666F726D3A207472616E736C61746533642832303070782C20302C2030293B0D0A20207D0D0A20202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D73686F774C656674202E';
wwv_flow_api.g_varchar2_table(221) := '742D426F64792D73696465207B0D0A202020206D617267696E2D6C6566743A20343870782021696D706F7274616E743B0D0A20207D0D0A20202E752D52544C202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D5061676542';
wwv_flow_api.g_varchar2_table(222) := '6F64792D2D73686F774C656674202E742D426F64792D73696465207B0D0A202020206D617267696E2D6C6566743A20302021696D706F7274616E743B0D0A2020202072696768743A20343870782021696D706F7274616E743B0D0A20207D0D0A7D0D0A0D';
wwv_flow_api.g_varchar2_table(223) := '0A2E742D50616765426F64792E6A732D7269676874436F6C6C6170736564202E742D426F64792D6D61696E207B0D0A20206D617267696E2D72696768743A203070783B0D0A7D0D0A2E742D50616765426F64792E6A732D7269676874436F6C6C61707365';
wwv_flow_api.g_varchar2_table(224) := '64202E742D426F64792D7469746C65207B0D0A202072696768743A203070783B0D0A7D0D0A3A6E6F74282E752D52544C29202E742D50616765426F64792E6A732D7269676874436F6C6C6170736564202E742D426F64792D616374696F6E73207B0D0A20';
wwv_flow_api.g_varchar2_table(225) := '207472616E73666F726D3A207472616E736C61746533642832303070782C20302C2030293B0D0A7D0D0A2E752D52544C202E742D50616765426F64792E6A732D7269676874436F6C6C6170736564202E742D426F64792D616374696F6E73207B0D0A2020';
wwv_flow_api.g_varchar2_table(226) := '7472616E73666F726D3A207472616E736C6174653364282D32303070782C20302C2030293B0D0A7D0D0A0D0A406D65646961206F6E6C792073637265656E20616E6420286D696E2D77696474683A20363431707829207B0D0A20203A6E6F74282E752D52';
wwv_flow_api.g_varchar2_table(227) := '544C29202E742D50616765426F64792D2D73686F774C656674202E742D426F64792D636F6E74656E74207B0D0A202020206D617267696E2D6C6566743A2032343070783B0D0A20207D0D0A20202E752D52544C202E742D50616765426F64792D2D73686F';
wwv_flow_api.g_varchar2_table(228) := '774C656674202E742D426F64792D636F6E74656E74207B0D0A202020206D617267696E2D72696768743A2032343070783B0D0A20207D0D0A7D0D0A0D0A2E742D426F64792D636F6E74656E74496E6E6572207B0D0A20206D617267696E3A203020617574';
wwv_flow_api.g_varchar2_table(229) := '6F3B0D0A20206D61782D77696474683A20313030253B0D0A7D0D0A23745F426F64795F736B6970546F436F6E74656E74207B0D0A2020636F6C6F723A20233332333333363B0D0A20206261636B67726F756E642D636F6C6F723A20236633663366343B0D';
wwv_flow_api.g_varchar2_table(230) := '0A7D0D0A0D0A2E742D42726561646372756D622D6974656D3A6166746572207B0D0A2020636F6C6F723A20726762612833312C2033312C2033312C20302E3735293B0D0A7D0D0A2E742D42726561646372756D622D6974656D2C0D0A2E742D4272656164';
wwv_flow_api.g_varchar2_table(231) := '6372756D622D6974656D2061207B0D0A2020636F6C6F723A20233532353235323B0D0A7D0D0A2E742D42726561646372756D622D6974656D20613A686F7665722C0D0A2E742D42726561646372756D622D6974656D20613A666F637573207B0D0A202063';
wwv_flow_api.g_varchar2_table(232) := '6F6C6F723A20233035366262663B0D0A2020746578742D6465636F726174696F6E3A20756E6465726C696E653B0D0A20206F75746C696E653A206E6F6E653B0D0A7D0D0A2E742D426F64792D7469746C652D736872696E6B202E742D4272656164637275';
wwv_flow_api.g_varchar2_table(233) := '6D62526567696F6E2D2D75736542726561646372756D625469746C65202E742D42726561646372756D622D6974656D2E69732D6163746976652C0D0A2E742D426F64792D7469746C652D736872696E6B202E742D42726561646372756D62526567696F6E';
wwv_flow_api.g_varchar2_table(234) := '2D2D757365526567696F6E5469746C65202E742D42726561646372756D62526567696F6E2D7469746C6554657874207B0D0A2020636F6C6F723A20233166316631663B0D0A7D0D0A406D65646961206F6E6C792073637265656E20616E6420286D61782D';
wwv_flow_api.g_varchar2_table(235) := '77696474683A20363430707829207B0D0A20202E742D42726561646372756D62526567696F6E2D2D757365526567696F6E5469746C65202E742D42726561646372756D62526567696F6E2D7469746C6554657874207B0D0A20202020636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(236) := '3166316631663B0D0A20207D0D0A7D0D0A2E742D42726561646372756D622D6974656D202E742D49636F6E3A686F766572207B0D0A2020636F6C6F723A20233332333333363B0D0A7D0D0A2E742D42726561646372756D62526567696F6E2D2D75736542';
wwv_flow_api.g_varchar2_table(237) := '726561646372756D625469746C65202E742D42726561646372756D622D6974656D2E69732D6163746976652C0D0A2E742D42726561646372756D62526567696F6E2D7469746C6554657874207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D';
wwv_flow_api.g_varchar2_table(238) := '0A0D0A2E742D426F64792D7469746C65202E742D42726561646372756D622D6974656D3A6166746572207B0D0A2020636F6C6F723A20726762612833382C2033382C2033382C20302E3735293B0D0A7D0D0A2E742D426F64792D7469746C65202E742D42';
wwv_flow_api.g_varchar2_table(239) := '726561646372756D622D6974656D2C0D0A2E742D426F64792D7469746C65202E742D42726561646372756D622D6974656D20612C0D0A2E742D426F64792D7469746C65202E742D42726561646372756D62526567696F6E2D2D7573654272656164637275';
wwv_flow_api.g_varchar2_table(240) := '6D625469746C65202E742D42726561646372756D622D6974656D2E69732D6163746976652C0D0A2E742D426F64792D7469746C65202E742D42726561646372756D62526567696F6E2D7469746C6554657874207B0D0A2020636F6C6F723A202332363236';
wwv_flow_api.g_varchar2_table(241) := '32363B0D0A7D0D0A0D0A2E742D427574746F6E2C0D0A2E612D427574746F6E2C0D0A2E75692D627574746F6E207B0D0A2020626F726465723A206E6F6E653B0D0A2020746578742D736861646F773A206E6F6E653B0D0A2020626F726465722D72616469';
wwv_flow_api.g_varchar2_table(242) := '75733A203270783B0D0A20207472616E736974696F6E3A206261636B67726F756E642D636F6C6F7220302E327320656173652C20626F782D736861646F7720302E327320656173652C20636F6C6F7220302E327320656173653B0D0A7D0D0A2E742D4275';
wwv_flow_api.g_varchar2_table(243) := '74746F6E202E742D49636F6E2C0D0A2E612D427574746F6E202E742D49636F6E2C0D0A2E75692D627574746F6E202E742D49636F6E207B0D0A20207472616E736974696F6E3A20696E68657269743B0D0A7D0D0A2E742D427574746F6E3A686F7665722C';
wwv_flow_api.g_varchar2_table(244) := '0D0A2E612D427574746F6E3A686F7665722C0D0A2E75692D627574746F6E3A686F7665722C0D0A2E742D427574746F6E3A666F6375732C0D0A2E612D427574746F6E3A666F6375732C0D0A2E75692D627574746F6E3A666F637573207B0D0A20207A2D69';
wwv_flow_api.g_varchar2_table(245) := '6E6465783A203130303B0D0A20206F75746C696E653A206E6F6E652021696D706F7274616E743B0D0A7D0D0A2E742D427574746F6E3A666F6375733A6265666F72652C0D0A2E612D427574746F6E3A666F6375733A6265666F72652C0D0A2E75692D6275';
wwv_flow_api.g_varchar2_table(246) := '74746F6E3A666F6375733A6265666F72652C0D0A2E742D427574746F6E2E69732D6163746976653A666F6375733A6265666F72652C0D0A2E612D427574746F6E2E69732D6163746976653A666F6375733A6265666F72652C0D0A2E75692D627574746F6E';
wwv_flow_api.g_varchar2_table(247) := '2E69732D6163746976653A666F6375733A6265666F7265207B0D0A2020626F782D736861646F773A20302030203020317078202330353662626620696E7365742021696D706F7274616E743B0D0A20206F7061636974793A20313B0D0A7D0D0A2E742D42';
wwv_flow_api.g_varchar2_table(248) := '7574746F6E3A666F6375733A6163746976653A6265666F72652C0D0A2E612D427574746F6E3A666F6375733A6163746976653A6265666F72652C0D0A2E75692D627574746F6E3A666F6375733A6163746976653A6265666F72652C0D0A2E742D42757474';
wwv_flow_api.g_varchar2_table(249) := '6F6E2E69732D6163746976653A666F6375733A6163746976653A6265666F72652C0D0A2E612D427574746F6E2E69732D6163746976653A666F6375733A6163746976653A6265666F72652C0D0A2E75692D627574746F6E2E69732D6163746976653A666F';
wwv_flow_api.g_varchar2_table(250) := '6375733A6163746976653A6265666F7265207B0D0A20206F7061636974793A20303B0D0A7D0D0A2E742D427574746F6E3A6E6F74282E742D427574746F6E2D2D6C696E6B293A6E6F74282E742D427574746F6E2D2D686561646572293A6163746976652C';
wwv_flow_api.g_varchar2_table(251) := '0D0A2E742D427574746F6E3A6E6F74282E742D427574746F6E2D2D6C696E6B293A6E6F74282E742D427574746F6E2D2D686561646572292E69732D616374697665207B0D0A2020626F782D736861646F773A20302030203020317078207267626128302C';
wwv_flow_api.g_varchar2_table(252) := '20302C20302C20302E31352920696E7365742C20302032707820327078207267626128302C20302C20302C20302E312920696E7365742021696D706F7274616E743B0D0A7D0D0A0D0A2E612D427574746F6E3A6265666F72652C0D0A2E742D427574746F';
wwv_flow_api.g_varchar2_table(253) := '6E3A6265666F72652C0D0A2E75692D627574746F6E3A6265666F72652C0D0A2E612D427574746F6E3A61667465722C0D0A2E742D427574746F6E3A61667465722C0D0A2E75692D627574746F6E3A6166746572207B0D0A2020636F6E74656E743A202727';
wwv_flow_api.g_varchar2_table(254) := '3B0D0A2020706F736974696F6E3A206162736F6C7574653B0D0A2020746F703A20303B0D0A20206C6566743A20303B0D0A202077696474683A20313030253B0D0A20206865696768743A20313030253B0D0A2020626F726465722D7261646975733A2069';
wwv_flow_api.g_varchar2_table(255) := '6E68657269743B0D0A20206F7061636974793A20303B0D0A20207472616E736974696F6E3A202E327320656173653B0D0A7D0D0A2E612D427574746F6E3A6265666F72652C0D0A2E742D427574746F6E3A6265666F72652C0D0A2E75692D627574746F6E';
wwv_flow_api.g_varchar2_table(256) := '3A6265666F7265207B0D0A20207A2D696E6465783A20313B0D0A7D0D0A2E612D427574746F6E3A61667465722C0D0A2E742D427574746F6E3A61667465722C0D0A2E75692D627574746F6E3A6166746572207B0D0A20207A2D696E6465783A202D313B0D';
wwv_flow_api.g_varchar2_table(257) := '0A2020626F782D736861646F773A20302032707820317078207267626128302C20302C20302C20302E303735293B0D0A20207472616E73666F726D3A207472616E736C61746559282D327078293B0D0A7D0D0A2E612D427574746F6E3A666F6375733A61';
wwv_flow_api.g_varchar2_table(258) := '667465722C0D0A2E742D427574746F6E3A666F6375733A61667465722C0D0A2E75692D627574746F6E3A666F6375733A61667465722C0D0A2E612D427574746F6E3A6E6F74282E742D427574746F6E2D2D6C696E6B293A686F7665723A61667465722C0D';
wwv_flow_api.g_varchar2_table(259) := '0A2E742D427574746F6E3A6E6F74282E742D427574746F6E2D2D6C696E6B293A686F7665723A61667465722C0D0A2E75692D627574746F6E3A6E6F74282E742D427574746F6E2D2D6C696E6B293A686F7665723A6166746572207B0D0A20206F70616369';
wwv_flow_api.g_varchar2_table(260) := '74793A20313B0D0A20207472616E73666F726D3A207472616E736C617465592830293B0D0A7D0D0A2E612D427574746F6E3A666F6375733A6163746976653A61667465722C0D0A2E742D427574746F6E3A666F6375733A6163746976653A61667465722C';
wwv_flow_api.g_varchar2_table(261) := '0D0A2E75692D627574746F6E3A666F6375733A6163746976653A6166746572207B0D0A20206F7061636974793A20303B0D0A20207472616E73666F726D3A207472616E736C61746559282D327078293B0D0A7D0D0A2E612D427574746F6E3A666F637573';
wwv_flow_api.g_varchar2_table(262) := '3A61667465722C0D0A2E742D427574746F6E3A666F6375733A61667465722C0D0A2E75692D627574746F6E3A666F6375733A6166746572207B0D0A20207472616E73666F726D3A207472616E736C617465592830293B0D0A2020626F782D736861646F77';
wwv_flow_api.g_varchar2_table(263) := '3A203020302031707820317078207267626128352C203130372C203139312C20302E3235293B0D0A7D0D0A0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570202E617065782D6974656D2D67726F';
wwv_flow_api.g_varchar2_table(264) := '75702D2D726320696E707574202B206C6162656C2C0D0A2E617065782D627574746F6E2D67726F757020696E707574202B206C6162656C2C0D0A2E742D427574746F6E3A6E6F74282E742D427574746F6E2D2D73696D706C65292C0D0A2E75692D627574';
wwv_flow_api.g_varchar2_table(265) := '746F6E2C0D0A2E612D427574746F6E207B0D0A2020636F6C6F723A20233338333833383B0D0A20206261636B67726F756E642D636F6C6F723A20236638663866383B0D0A2020626F782D736861646F773A20302030203020317078207267626128302C20';
wwv_flow_api.g_varchar2_table(266) := '302C20302C20302E3132352920696E7365743B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570202E617065782D6974656D2D67726F75702D2D726320696E707574202B206C6162656C3A';
wwv_flow_api.g_varchar2_table(267) := '686F7665722C0D0A2E617065782D627574746F6E2D67726F757020696E707574202B206C6162656C3A686F7665722C0D0A2E742D427574746F6E3A6E6F74282E742D427574746F6E2D2D73696D706C65293A686F7665722C0D0A2E75692D627574746F6E';
wwv_flow_api.g_varchar2_table(268) := '3A686F7665722C0D0A2E612D427574746F6E3A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A2020626F782D736861646F773A20302030203020317078207267626128302C20302C20302C20302E3135';
wwv_flow_api.g_varchar2_table(269) := '2920696E7365743B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570202E617065782D6974656D2D67726F75702D2D726320696E707574202B206C6162656C3A666F6375732C0D0A2E6170';
wwv_flow_api.g_varchar2_table(270) := '65782D627574746F6E2D67726F757020696E707574202B206C6162656C3A666F6375732C0D0A2E742D427574746F6E3A6E6F74282E742D427574746F6E2D2D73696D706C65293A666F6375732C0D0A2E75692D627574746F6E3A666F6375732C0D0A2E61';
wwv_flow_api.g_varchar2_table(271) := '2D427574746F6E3A666F637573207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570202E617065782D697465';
wwv_flow_api.g_varchar2_table(272) := '6D2D67726F75702D2D726320696E707574202B206C6162656C2E69732D6163746976652C0D0A2E617065782D627574746F6E2D67726F757020696E707574202B206C6162656C2E69732D6163746976652C0D0A2E742D427574746F6E3A6E6F74282E742D';
wwv_flow_api.g_varchar2_table(273) := '427574746F6E2D2D73696D706C65292E69732D6163746976652C0D0A2E75692D627574746F6E2E69732D6163746976652C0D0A2E612D427574746F6E2E69732D6163746976652C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D726164';
wwv_flow_api.g_varchar2_table(274) := '696F427574746F6E47726F7570202E617065782D6974656D2D67726F75702D2D726320696E707574202B206C6162656C3A6163746976652C0D0A2E617065782D627574746F6E2D67726F757020696E707574202B206C6162656C3A6163746976652C0D0A';
wwv_flow_api.g_varchar2_table(275) := '2E742D427574746F6E3A6E6F74282E742D427574746F6E2D2D73696D706C65293A6163746976652C0D0A2E75692D627574746F6E3A6163746976652C0D0A2E612D427574746F6E3A616374697665207B0D0A20206261636B67726F756E642D636F6C6F72';
wwv_flow_api.g_varchar2_table(276) := '3A20236465646564653B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570202E617065782D6974656D2D67726964207B0D0A20206261636B67726F756E642D636F6C6F723A202364386438';
wwv_flow_api.g_varchar2_table(277) := '64383B0D0A2020626F726465722D7261646975733A203270783B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570202E617065782D6974656D2D67726F75702D2D726320696E7075743A61';
wwv_flow_api.g_varchar2_table(278) := '6374697665202B206C6162656C2C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570202E617065782D6974656D2D67726F75702D2D726320696E7075743A666F6375733A6E6F74283A636865636B';
wwv_flow_api.g_varchar2_table(279) := '656429202B206C6162656C2C0D0A2E617065782D627574746F6E2D67726F757020696E7075743A616374697665202B206C6162656C2C0D0A2E617065782D627574746F6E2D67726F757020696E7075743A666F6375733A6E6F74283A636865636B656429';
wwv_flow_api.g_varchar2_table(280) := '202B206C6162656C207B0D0A2020626F782D736861646F773A20302030203020317078202330353662626620696E7365742C20302030203020327078202366396639663920696E7365742021696D706F7274616E743B0D0A20206F75746C696E653A206E';
wwv_flow_api.g_varchar2_table(281) := '6F6E653B0D0A2020626F726465722D636F6C6F723A20233035366262663B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666662021696D706F7274616E743B0D0A2020636F6C6F723A20233338333833382021696D706F7274616E74';
wwv_flow_api.g_varchar2_table(282) := '3B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570202E617065782D6974656D2D67726F75702D2D726320696E7075743A636865636B65643A666F637573202B206C6162656C2C0D0A2E61';
wwv_flow_api.g_varchar2_table(283) := '7065782D627574746F6E2D67726F757020696E7075743A636865636B65643A666F637573202B206C6162656C207B0D0A2020626F782D736861646F773A20302030203020317078202330353662626620696E7365742C2030203020302032707820236639';
wwv_flow_api.g_varchar2_table(284) := '6639663920696E7365742021696D706F7274616E743B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570202E617065782D6974656D2D67726F75702D2D726320696E7075743A636865636B';
wwv_flow_api.g_varchar2_table(285) := '6564202B206C6162656C2C0D0A2E617065782D627574746F6E2D67726F757020696E7075743A636865636B6564202B206C6162656C207B0D0A2020626F726465722D636F6C6F723A20233035366262663B0D0A20206261636B67726F756E642D636F6C6F';
wwv_flow_api.g_varchar2_table(286) := '723A20233035366262663B0D0A2020636F6C6F723A20236639663966393B0D0A2020626F782D736861646F773A206E6F6E653B0D0A7D0D0A0D0A2E612D427574746F6E2D2D686F742C0D0A2E742D427574746F6E2D2D686F743A6E6F74282E742D427574';
wwv_flow_api.g_varchar2_table(287) := '746F6E2D2D73696D706C65292C0D0A626F6479202E75692D627574746F6E2E75692D627574746F6E2D2D686F742C0D0A626F6479202E75692D73746174652D64656661756C742E75692D7072696F726974792D7072696D617279207B0D0A20206261636B';
wwv_flow_api.g_varchar2_table(288) := '67726F756E642D636F6C6F723A20233332333333363B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E612D427574746F6E2D2D686F743A686F7665722C0D0A2E742D427574746F6E2D2D686F743A6E6F74282E742D427574746F6E2D2D73';
wwv_flow_api.g_varchar2_table(289) := '696D706C65293A686F7665722C0D0A626F6479202E75692D627574746F6E2E75692D627574746F6E2D2D686F743A686F7665722C0D0A626F6479202E75692D73746174652D64656661756C742E75692D7072696F726974792D7072696D6172793A686F76';
wwv_flow_api.g_varchar2_table(290) := '65722C0D0A2E612D427574746F6E2D2D686F743A6E6F74283A616374697665293A666F6375732C0D0A2E742D427574746F6E2D2D686F743A6E6F74282E742D427574746F6E2D2D73696D706C65293A6E6F74283A616374697665293A666F6375732C0D0A';
wwv_flow_api.g_varchar2_table(291) := '626F6479202E75692D627574746F6E2E75692D627574746F6E2D2D686F743A6E6F74283A616374697665293A666F6375732C0D0A626F6479202E75692D73746174652D64656661756C742E75692D7072696F726974792D7072696D6172793A6E6F74283A';
wwv_flow_api.g_varchar2_table(292) := '616374697665293A666F637573207B0D0A20206261636B67726F756E642D636F6C6F723A20233365343034333B0D0A7D0D0A2E612D427574746F6E2D2D686F743A6163746976652C0D0A2E742D427574746F6E2D2D686F743A6E6F74282E742D42757474';
wwv_flow_api.g_varchar2_table(293) := '6F6E2D2D73696D706C65293A6163746976652C0D0A626F6479202E75692D627574746F6E2E75692D627574746F6E2D2D686F743A6163746976652C0D0A626F6479202E75692D73746174652D64656661756C742E75692D7072696F726974792D7072696D';
wwv_flow_api.g_varchar2_table(294) := '6172793A6163746976652C0D0A2E612D427574746F6E2D2D686F742E69732D6163746976652C0D0A2E742D427574746F6E2D2D686F743A6E6F74282E742D427574746F6E2D2D73696D706C65292E69732D6163746976652C0D0A626F6479202E75692D62';
wwv_flow_api.g_varchar2_table(295) := '7574746F6E2E75692D627574746F6E2D2D686F742E69732D6163746976652C0D0A626F6479202E75692D73746174652D64656661756C742E75692D7072696F726974792D7072696D6172792E69732D616374697665207B0D0A20206261636B67726F756E';
wwv_flow_api.g_varchar2_table(296) := '642D636F6C6F723A20233236323632393B0D0A7D0D0A626F6479202E75692D627574746F6E2E75692D627574746F6E2D2D686F74207B0D0A2020666F6E742D7765696768743A20626F6C643B0D0A7D0D0A0D0A2E742D427574746F6E2D2D7761726E696E';
wwv_flow_api.g_varchar2_table(297) := '673A6E6F74282E742D427574746F6E2D2D73696D706C65293A6E6F74282E742D427574746F6E2D2D686F7429207B0D0A2020636F6C6F723A20233434333330323B0D0A7D0D0A2E742D427574746F6E2D2D7761726E696E673A6E6F74282E742D42757474';
wwv_flow_api.g_varchar2_table(298) := '6F6E2D2D73696D706C65293A6E6F74282E742D427574746F6E2D2D686F74293A686F7665722C0D0A2E742D427574746F6E2D2D7761726E696E673A6E6F74282E742D427574746F6E2D2D73696D706C65293A6E6F74282E742D427574746F6E2D2D686F74';
wwv_flow_api.g_varchar2_table(299) := '293A6E6F74283A616374697665293A666F637573207B0D0A20206261636B67726F756E642D636F6C6F723A20236663646337633B0D0A7D0D0A2E742D427574746F6E2D2D7761726E696E673A6E6F74282E742D427574746F6E2D2D73696D706C65293A6E';
wwv_flow_api.g_varchar2_table(300) := '6F74282E742D427574746F6E2D2D686F74292C0D0A2E742D427574746F6E2D2D7761726E696E673A6E6F74282E742D427574746F6E2D2D73696D706C65293A6E6F74282E742D427574746F6E2D2D686F74293A6163746976652C0D0A2E742D427574746F';
wwv_flow_api.g_varchar2_table(301) := '6E2D2D7761726E696E673A6E6F74282E742D427574746F6E2D2D73696D706C65293A6E6F74282E742D427574746F6E2D2D686F74292E69732D616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A20236662636534613B0D0A7D0D0A';
wwv_flow_api.g_varchar2_table(302) := '0D0A2E742D427574746F6E2D2D737563636573733A6E6F74282E742D427574746F6E2D2D73696D706C65293A6E6F74282E742D427574746F6E2D2D686F7429207B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D427574746F6E2D2D';
wwv_flow_api.g_varchar2_table(303) := '737563636573733A6E6F74282E742D427574746F6E2D2D73696D706C65293A6E6F74282E742D427574746F6E2D2D686F74293A686F7665722C0D0A2E742D427574746F6E2D2D737563636573733A6E6F74282E742D427574746F6E2D2D73696D706C6529';
wwv_flow_api.g_varchar2_table(304) := '3A6E6F74282E742D427574746F6E2D2D686F74293A6E6F74283A616374697665293A666F637573207B0D0A20206261636B67726F756E642D636F6C6F723A20233432626533313B0D0A7D0D0A2E742D427574746F6E2D2D737563636573733A6E6F74282E';
wwv_flow_api.g_varchar2_table(305) := '742D427574746F6E2D2D73696D706C65293A6E6F74282E742D427574746F6E2D2D686F74292C0D0A2E742D427574746F6E2D2D737563636573733A6E6F74282E742D427574746F6E2D2D73696D706C65293A6E6F74282E742D427574746F6E2D2D686F74';
wwv_flow_api.g_varchar2_table(306) := '293A6163746976652C0D0A2E742D427574746F6E2D2D737563636573733A6E6F74282E742D427574746F6E2D2D73696D706C65293A6E6F74282E742D427574746F6E2D2D686F74292E69732D616374697665207B0D0A20206261636B67726F756E642D63';
wwv_flow_api.g_varchar2_table(307) := '6F6C6F723A20233362616132633B0D0A7D0D0A0D0A2E742D427574746F6E2D2D64616E6765723A6E6F74282E742D427574746F6E2D2D73696D706C65293A6E6F74282E742D427574746F6E2D2D686F7429207B0D0A2020636F6C6F723A20236666666666';
wwv_flow_api.g_varchar2_table(308) := '663B0D0A7D0D0A2E742D427574746F6E2D2D64616E6765723A6E6F74282E742D427574746F6E2D2D73696D706C65293A6E6F74282E742D427574746F6E2D2D686F74293A686F7665722C0D0A2E742D427574746F6E2D2D64616E6765723A6E6F74282E74';
wwv_flow_api.g_varchar2_table(309) := '2D427574746F6E2D2D73696D706C65293A6E6F74282E742D427574746F6E2D2D686F74293A6E6F74283A616374697665293A666F637573207B0D0A20206261636B67726F756E642D636F6C6F723A20236635356134653B0D0A7D0D0A2E742D427574746F';
wwv_flow_api.g_varchar2_table(310) := '6E2D2D64616E6765723A6E6F74282E742D427574746F6E2D2D73696D706C65293A6E6F74282E742D427574746F6E2D2D686F74292C0D0A2E742D427574746F6E2D2D64616E6765723A6E6F74282E742D427574746F6E2D2D73696D706C65293A6E6F7428';
wwv_flow_api.g_varchar2_table(311) := '2E742D427574746F6E2D2D686F74293A6163746976652C0D0A2E742D427574746F6E2D2D64616E6765723A6E6F74282E742D427574746F6E2D2D73696D706C65293A6E6F74282E742D427574746F6E2D2D686F74292E69732D616374697665207B0D0A20';
wwv_flow_api.g_varchar2_table(312) := '206261636B67726F756E642D636F6C6F723A20236634343333363B0D0A7D0D0A0D0A2E742D427574746F6E2D2D7072696D6172793A6E6F74282E742D427574746F6E2D2D73696D706C65293A6E6F74282E742D427574746F6E2D2D686F7429207B0D0A20';
wwv_flow_api.g_varchar2_table(313) := '20636F6C6F723A20233030313132323B0D0A7D0D0A2E742D427574746F6E2D2D7072696D6172793A6E6F74282E742D427574746F6E2D2D73696D706C65293A6E6F74282E742D427574746F6E2D2D686F74293A686F7665722C0D0A2E742D427574746F6E';
wwv_flow_api.g_varchar2_table(314) := '2D2D7072696D6172793A6E6F74282E742D427574746F6E2D2D73696D706C65293A6E6F74282E742D427574746F6E2D2D686F74293A6E6F74283A616374697665293A666F637573207B0D0A20206261636B67726F756E642D636F6C6F723A202362636530';
wwv_flow_api.g_varchar2_table(315) := '66633B0D0A7D0D0A2E742D427574746F6E2D2D7072696D6172793A6E6F74282E742D427574746F6E2D2D73696D706C65293A6E6F74282E742D427574746F6E2D2D686F74292C0D0A2E742D427574746F6E2D2D7072696D6172793A6E6F74282E742D4275';
wwv_flow_api.g_varchar2_table(316) := '74746F6E2D2D73696D706C65293A6E6F74282E742D427574746F6E2D2D686F74293A6163746976652C0D0A2E742D427574746F6E2D2D7072696D6172793A6E6F74282E742D427574746F6E2D2D73696D706C65293A6E6F74282E742D427574746F6E2D2D';
wwv_flow_api.g_varchar2_table(317) := '686F74292E69732D616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A20236134643466623B0D0A7D0D0A0D0A2E742D427574746F6E2D2D73696D706C653A6E6F74282E742D427574746F6E2D2D686F74293A6E6F74282E742D4275';
wwv_flow_api.g_varchar2_table(318) := '74746F6E2D2D64616E676572293A6E6F74282E742D427574746F6E2D2D7072696D617279293A6E6F74282E742D427574746F6E2D2D73756363657373293A6E6F74282E742D427574746F6E2D2D7761726E696E6729207B0D0A20206261636B67726F756E';
wwv_flow_api.g_varchar2_table(319) := '642D636F6C6F723A20236666666666663B0D0A2020636F6C6F723A20233430343034303B0D0A2020626F782D736861646F773A20302030203020317078207267626128302C20302C20302C20302E3132352920696E7365743B0D0A7D0D0A2E742D427574';
wwv_flow_api.g_varchar2_table(320) := '746F6E2D2D73696D706C653A6E6F74282E742D427574746F6E2D2D686F74293A6E6F74282E742D427574746F6E2D2D64616E676572293A6E6F74282E742D427574746F6E2D2D7072696D617279293A6E6F74282E742D427574746F6E2D2D737563636573';
wwv_flow_api.g_varchar2_table(321) := '73293A6E6F74282E742D427574746F6E2D2D7761726E696E67293A686F7665722C0D0A2E742D427574746F6E2D2D73696D706C653A6E6F74282E742D427574746F6E2D2D686F74293A6E6F74282E742D427574746F6E2D2D64616E676572293A6E6F7428';
wwv_flow_api.g_varchar2_table(322) := '2E742D427574746F6E2D2D7072696D617279293A6E6F74282E742D427574746F6E2D2D73756363657373293A6E6F74282E742D427574746F6E2D2D7761726E696E67293A666F6375732C0D0A2E742D427574746F6E2D2D73696D706C653A6E6F74282E74';
wwv_flow_api.g_varchar2_table(323) := '2D427574746F6E2D2D686F74293A6E6F74282E742D427574746F6E2D2D64616E676572293A6E6F74282E742D427574746F6E2D2D7072696D617279293A6E6F74282E742D427574746F6E2D2D73756363657373293A6E6F74282E742D427574746F6E2D2D';
wwv_flow_api.g_varchar2_table(324) := '7761726E696E67292E69732D616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A20236536653665363B0D0A7D0D0A0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D686F74207B0D0A2020626F782D7368';
wwv_flow_api.g_varchar2_table(325) := '61646F773A20302030203020317078202333323333333620696E7365743B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D686F742C0D0A2E';
wwv_flow_api.g_varchar2_table(326) := '742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D686F74202E742D49636F6E207B0D0A2020636F6C6F723A20233332333333363B0D0A7D0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D686F743A686F7665';
wwv_flow_api.g_varchar2_table(327) := '722C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D686F743A666F6375732C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D686F742E69732D616374697665207B0D0A20206261636B67726F756E';
wwv_flow_api.g_varchar2_table(328) := '642D636F6C6F723A20233332333333363B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D686F743A686F766572202E742D49636F6E2C0D0A2E742D427574746F6E2D2D';
wwv_flow_api.g_varchar2_table(329) := '73696D706C652E742D427574746F6E2D2D686F743A666F637573202E742D49636F6E2C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D686F742E69732D616374697665202E742D49636F6E207B0D0A2020636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(330) := '6666666666663B0D0A7D0D0A0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D7072696D6172793A6E6F74282E742D427574746F6E2D2D686F7429207B0D0A2020626F782D736861646F773A2030203020302031707820236134';
wwv_flow_api.g_varchar2_table(331) := '6434666220696E7365743B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D7072696D6172793A6E6F74282E742D427574746F6E2D2D686F74';
wwv_flow_api.g_varchar2_table(332) := '292C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D7072696D6172793A6E6F74282E742D427574746F6E2D2D686F7429202E742D49636F6E207B0D0A2020636F6C6F723A20233261396166363B0D0A7D0D0A2E742D42757474';
wwv_flow_api.g_varchar2_table(333) := '6F6E2D2D73696D706C652E742D427574746F6E2D2D7072696D6172793A6E6F74282E742D427574746F6E2D2D686F74293A686F7665722C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D7072696D6172793A6E6F74282E742D';
wwv_flow_api.g_varchar2_table(334) := '427574746F6E2D2D686F74293A666F6375732C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D7072696D6172793A6E6F74282E742D427574746F6E2D2D686F74292E69732D616374697665207B0D0A20206261636B67726F75';
wwv_flow_api.g_varchar2_table(335) := '6E642D636F6C6F723A20236134643466623B0D0A2020636F6C6F723A20233030313132323B0D0A7D0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D7072696D6172793A6E6F74282E742D427574746F6E2D2D686F74293A686F';
wwv_flow_api.g_varchar2_table(336) := '766572202E742D49636F6E2C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D7072696D6172793A6E6F74282E742D427574746F6E2D2D686F74293A666F637573202E742D49636F6E2C0D0A2E742D427574746F6E2D2D73696D';
wwv_flow_api.g_varchar2_table(337) := '706C652E742D427574746F6E2D2D7072696D6172793A6E6F74282E742D427574746F6E2D2D686F74292E69732D616374697665202E742D49636F6E207B0D0A2020636F6C6F723A20233030313132323B0D0A7D0D0A0D0A2E742D427574746F6E2D2D7369';
wwv_flow_api.g_varchar2_table(338) := '6D706C652E742D427574746F6E2D2D7761726E696E673A6E6F74282E742D427574746F6E2D2D686F7429207B0D0A2020626F782D736861646F773A20302030203020317078202366626365346120696E7365743B0D0A20206261636B67726F756E642D63';
wwv_flow_api.g_varchar2_table(339) := '6F6C6F723A20236666666666663B0D0A7D0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D7761726E696E673A6E6F74282E742D427574746F6E2D2D686F74292C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574';
wwv_flow_api.g_varchar2_table(340) := '746F6E2D2D7761726E696E673A6E6F74282E742D427574746F6E2D2D686F7429202E742D49636F6E207B0D0A2020636F6C6F723A20236331393130343B0D0A7D0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D7761726E696E';
wwv_flow_api.g_varchar2_table(341) := '673A6E6F74282E742D427574746F6E2D2D686F74293A686F7665722C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D7761726E696E673A6E6F74282E742D427574746F6E2D2D686F74293A666F6375732C0D0A2E742D427574';
wwv_flow_api.g_varchar2_table(342) := '746F6E2D2D73696D706C652E742D427574746F6E2D2D7761726E696E673A6E6F74282E742D427574746F6E2D2D686F74292E69732D616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A20236662636534613B0D0A2020636F6C6F72';
wwv_flow_api.g_varchar2_table(343) := '3A20233434333330323B0D0A7D0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D7761726E696E673A6E6F74282E742D427574746F6E2D2D686F74293A686F766572202E742D49636F6E2C0D0A2E742D427574746F6E2D2D7369';
wwv_flow_api.g_varchar2_table(344) := '6D706C652E742D427574746F6E2D2D7761726E696E673A6E6F74282E742D427574746F6E2D2D686F74293A666F637573202E742D49636F6E2C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D7761726E696E673A6E6F74282E';
wwv_flow_api.g_varchar2_table(345) := '742D427574746F6E2D2D686F74292E69732D616374697665202E742D49636F6E207B0D0A2020636F6C6F723A20233434333330323B0D0A7D0D0A0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D64616E6765723A6E6F74282E';
wwv_flow_api.g_varchar2_table(346) := '742D427574746F6E2D2D686F7429207B0D0A2020626F782D736861646F773A20302030203020317078202366343433333620696E7365743B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E742D427574746F6E';
wwv_flow_api.g_varchar2_table(347) := '2D2D73696D706C652E742D427574746F6E2D2D64616E6765723A6E6F74282E742D427574746F6E2D2D686F74292C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D64616E6765723A6E6F74282E742D427574746F6E2D2D686F';
wwv_flow_api.g_varchar2_table(348) := '7429202E742D49636F6E207B0D0A2020636F6C6F723A20236634343333363B0D0A7D0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D64616E6765723A6E6F74282E742D427574746F6E2D2D686F74293A686F7665722C0D0A2E';
wwv_flow_api.g_varchar2_table(349) := '742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D64616E6765723A6E6F74282E742D427574746F6E2D2D686F74293A666F6375732C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D64616E6765723A6E6F74';
wwv_flow_api.g_varchar2_table(350) := '282E742D427574746F6E2D2D686F74292E69732D616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A20236634343333363B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D427574746F6E2D2D73696D706C652E';
wwv_flow_api.g_varchar2_table(351) := '742D427574746F6E2D2D64616E6765723A6E6F74282E742D427574746F6E2D2D686F74293A686F766572202E742D49636F6E2C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D64616E6765723A6E6F74282E742D427574746F';
wwv_flow_api.g_varchar2_table(352) := '6E2D2D686F74293A666F637573202E742D49636F6E2C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D64616E6765723A6E6F74282E742D427574746F6E2D2D686F74292E69732D616374697665202E742D49636F6E207B0D0A';
wwv_flow_api.g_varchar2_table(353) := '2020636F6C6F723A20236666666666663B0D0A7D0D0A0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D737563636573733A6E6F74282E742D427574746F6E2D2D686F7429207B0D0A2020626F782D736861646F773A20302030';
wwv_flow_api.g_varchar2_table(354) := '203020317078202333626161326320696E7365743B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D737563636573733A6E6F74282E742D42';
wwv_flow_api.g_varchar2_table(355) := '7574746F6E2D2D686F74292C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D737563636573733A6E6F74282E742D427574746F6E2D2D686F7429202E742D49636F6E207B0D0A2020636F6C6F723A20233362616132633B0D0A';
wwv_flow_api.g_varchar2_table(356) := '7D0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D737563636573733A6E6F74282E742D427574746F6E2D2D686F74293A686F7665722C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D7375636365';
wwv_flow_api.g_varchar2_table(357) := '73733A6E6F74282E742D427574746F6E2D2D686F74293A666F6375732C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D737563636573733A6E6F74282E742D427574746F6E2D2D686F74292E69732D616374697665207B0D0A';
wwv_flow_api.g_varchar2_table(358) := '20206261636B67726F756E642D636F6C6F723A20233362616132633B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D737563636573733A6E6F74282E742D427574746F';
wwv_flow_api.g_varchar2_table(359) := '6E2D2D686F74293A686F766572202E742D49636F6E2C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D737563636573733A6E6F74282E742D427574746F6E2D2D686F74293A666F637573202E742D49636F6E2C0D0A2E742D42';
wwv_flow_api.g_varchar2_table(360) := '7574746F6E2D2D73696D706C652E742D427574746F6E2D2D737563636573733A6E6F74282E742D427574746F6E2D2D686F74292E69732D616374697665202E742D49636F6E207B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A0D0A2E742D';
wwv_flow_api.g_varchar2_table(361) := '427574746F6E2D2D6E6F5549207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E742021696D706F7274616E743B0D0A7D0D0A2E742D427574746F6E2D2D6E6F55493A6E6F74283A686F766572293A6E6F74283A666F63';
wwv_flow_api.g_varchar2_table(362) := '7573293A6E6F74282E69732D61637469766529207B0D0A2020626F782D736861646F773A206E6F6E653B0D0A7D0D0A2E742D427574746F6E2D2D6E6F55493A686F7665722C0D0A2E742D427574746F6E2D2D6E6F55493A666F6375732C0D0A2E742D4275';
wwv_flow_api.g_varchar2_table(363) := '74746F6E2D2D6E6F55492E69732D616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A20236536653665363B0D0A7D0D0A2E742D427574746F6E2D2D6E6F55493A666F6375733A686F766572207B0D0A2020626F782D736861646F77';
wwv_flow_api.g_varchar2_table(364) := '3A20302030203020317078207267626128302C20302C20302C20302E3132352920696E7365743B0D0A7D0D0A0D0A2E742D427574746F6E2D2D6C696E6B207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E742021696D';
wwv_flow_api.g_varchar2_table(365) := '706F7274616E743B0D0A2020626F782D736861646F773A206E6F6E652021696D706F7274616E743B0D0A7D0D0A2E742D427574746F6E2D2D6C696E6B3A686F766572207B0D0A2020746578742D6465636F726174696F6E3A20756E6465726C696E653B0D';
wwv_flow_api.g_varchar2_table(366) := '0A7D0D0A2E742D427574746F6E2D2D6C696E6B2E742D427574746F6E2C0D0A2E742D427574746F6E2D2D6C696E6B202E742D49636F6E207B0D0A2020636F6C6F723A20233035366262663B0D0A7D0D0A0D0A2E742D427574746F6E2D2D6E6F55492E742D';
wwv_flow_api.g_varchar2_table(367) := '427574746F6E2D2D686F742C0D0A2E742D427574746F6E2D2D6E6F55492E742D427574746F6E2D2D686F74202E742D49636F6E207B0D0A2020636F6C6F723A20233332333333363B0D0A7D0D0A0D0A2E742D427574746F6E2D2D6E6F55492E742D427574';
wwv_flow_api.g_varchar2_table(368) := '746F6E2D2D7072696D6172792C0D0A2E742D427574746F6E2D2D6C696E6B2E742D427574746F6E2D2D7072696D6172792C0D0A2E742D427574746F6E2D2D6E6F55492E742D427574746F6E2D2D7072696D617279202E742D49636F6E2C0D0A2E742D4275';
wwv_flow_api.g_varchar2_table(369) := '74746F6E2D2D6C696E6B2E742D427574746F6E2D2D7072696D617279202E742D49636F6E207B0D0A2020636F6C6F723A20233261396166362021696D706F7274616E743B0D0A7D0D0A0D0A2E742D427574746F6E2D2D6E6F55492E742D427574746F6E2D';
wwv_flow_api.g_varchar2_table(370) := '2D7761726E696E672C0D0A2E742D427574746F6E2D2D6C696E6B2E742D427574746F6E2D2D7761726E696E672C0D0A2E742D427574746F6E2D2D6E6F55492E742D427574746F6E2D2D7761726E696E67202E742D49636F6E2C0D0A2E742D427574746F6E';
wwv_flow_api.g_varchar2_table(371) := '2D2D6C696E6B2E742D427574746F6E2D2D7761726E696E67202E742D49636F6E207B0D0A2020636F6C6F723A20236331393130342021696D706F7274616E743B0D0A7D0D0A0D0A2E742D427574746F6E2D2D6E6F55492E742D427574746F6E2D2D64616E';
wwv_flow_api.g_varchar2_table(372) := '6765722C0D0A2E742D427574746F6E2D2D6C696E6B2E742D427574746F6E2D2D64616E6765722C0D0A2E742D427574746F6E2D2D6E6F55492E742D427574746F6E2D2D64616E676572202E742D49636F6E2C0D0A2E742D427574746F6E2D2D6C696E6B2E';
wwv_flow_api.g_varchar2_table(373) := '742D427574746F6E2D2D64616E676572202E742D49636F6E207B0D0A2020636F6C6F723A20236634343333362021696D706F7274616E743B0D0A7D0D0A0D0A2E742D427574746F6E2D2D6E6F55492E742D427574746F6E2D2D737563636573732C0D0A2E';
wwv_flow_api.g_varchar2_table(374) := '742D427574746F6E2D2D6C696E6B2E742D427574746F6E2D2D737563636573732C0D0A2E742D427574746F6E2D2D6E6F55492E742D427574746F6E2D2D73756363657373202E742D49636F6E2C0D0A2E742D427574746F6E2D2D6C696E6B2E742D427574';
wwv_flow_api.g_varchar2_table(375) := '746F6E2D2D73756363657373202E742D49636F6E207B0D0A2020636F6C6F723A20233362616132632021696D706F7274616E743B0D0A7D0D0A0D0A2E742D4865616465722D6272616E64696E67202E742D427574746F6E207B0D0A20206261636B67726F';
wwv_flow_api.g_varchar2_table(376) := '756E642D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A2E742D427574746F6E2E742D427574746F6E2D2D686561646572207B0D0A2020626F726465722D7261646975733A203270783B0D0A2020626F782D736861646F773A206E6F6E653B';
wwv_flow_api.g_varchar2_table(377) := '0D0A7D0D0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465723A666F6375733A6265666F72652C0D0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465723A6163746976653A666F6375733A6265666F7265207B0D0A202062';
wwv_flow_api.g_varchar2_table(378) := '6F782D736861646F773A20302030203020317078202331383933663920696E7365742021696D706F7274616E743B0D0A7D0D0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465723A686F7665722C0D0A2E742D427574746F6E2E742D4275';
wwv_flow_api.g_varchar2_table(379) := '74746F6E2D2D6865616465723A666F6375732C0D0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465723A616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A2E742D4275';
wwv_flow_api.g_varchar2_table(380) := '74746F6E2E742D427574746F6E2D2D6865616465723A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E31293B0D0A7D0D0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465';
wwv_flow_api.g_varchar2_table(381) := '723A6163746976652C0D0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465723A666F6375733A616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E34293B0D0A7D0D0A2E74';
wwv_flow_api.g_varchar2_table(382) := '2D427574746F6E2E742D427574746F6E2D2D6865616465722E69732D616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3235293B0D0A2020626F782D736861646F773A206E6F6E653B0D';
wwv_flow_api.g_varchar2_table(383) := '0A7D0D0A2E742D427574746F6E2E742D427574746F6E2D2D68656164657254726565207B0D0A20206D696E2D77696474683A20333270783B0D0A7D0D0A2E742D427574746F6E2E742D427574746F6E2D2D686561646572547265653A666F637573207B0D';
wwv_flow_api.g_varchar2_table(384) := '0A2020626F782D736861646F773A20302030203020317078202331383933663920696E7365743B0D0A7D0D0A406D65646961206F6E6C792073637265656E20616E6420286D61782D77696474683A20343830707829207B0D0A20202E742D427574746F6E';
wwv_flow_api.g_varchar2_table(385) := '2E742D427574746F6E2D2D68656164657254726565207B0D0A202020206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3235293B0D0A20207D0D0A7D0D0A2E742D427574746F6E2E742D427574746F6E2D2D686561';
wwv_flow_api.g_varchar2_table(386) := '6465725269676874207B0D0A20206261636B67726F756E642D636F6C6F723A20236634663466343B0D0A2020626F726465723A2031707820736F6C696420236462646264623B0D0A7D0D0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465';
wwv_flow_api.g_varchar2_table(387) := '7252696768743A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20236462646264623B0D0A7D0D0A2E742D427574746F6E2E742D427574746F6E2D2D68656164657252696768743A6163746976652C0D0A2E742D427574746F6E2E';
wwv_flow_api.g_varchar2_table(388) := '742D427574746F6E2D2D68656164657252696768742E69732D616374697665207B0D0A2020636F6C6F723A20233162316231623B0D0A7D0D0A2E742D427574746F6E2D2D6E6176426172202E742D427574746F6E2D6261646765207B0D0A2020626F7264';
wwv_flow_api.g_varchar2_table(389) := '65722D7261646975733A20313670783B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3335293B0D0A7D0D0A2E742D427574746F6E2D2D68656C70427574746F6E202E612D49636F6E207B0D0A20206F70';
wwv_flow_api.g_varchar2_table(390) := '61636974793A202E353B0D0A7D0D0A0D0A2E742D4865616465722D6E6176426172202E742D427574746F6E2D2D6865616465722E69732D616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A20233064306430653B0D0A2020636F6C';
wwv_flow_api.g_varchar2_table(391) := '6F723A20236537653765373B0D0A7D0D0A0D0A2E742D427574746F6E2E742D427574746F6E2D2D6E6F5549202E66613A61667465722C0D0A2E742D427574746F6E2E742D427574746F6E2D2D6C696E6B202E66613A61667465722C0D0A2E742D42757474';
wwv_flow_api.g_varchar2_table(392) := '6F6E2E742D427574746F6E2D2D73696D706C65202E66613A6166746572207B0D0A20206261636B67726F756E642D636F6C6F723A20234646463B0D0A7D0D0A0D0A2E742D427574746F6E2D2D64616E676572202E66613A61667465722C0D0A2E742D4275';
wwv_flow_api.g_varchar2_table(393) := '74746F6E2D2D73696D706C652E742D427574746F6E2D2D64616E6765723A686F766572202E66613A6166746572207B0D0A20206261636B67726F756E642D636F6C6F723A20236634343333363B0D0A7D0D0A0D0A2E742D427574746F6E2D2D7375636365';
wwv_flow_api.g_varchar2_table(394) := '7373202E66613A61667465722C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D737563636573733A686F766572202E66613A6166746572207B0D0A20206261636B67726F756E642D636F6C6F723A20233362616132633B0D0A';
wwv_flow_api.g_varchar2_table(395) := '7D0D0A0D0A2E742D427574746F6E2D2D7072696D617279202E66613A61667465722C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D7072696D6172793A686F766572202E66613A6166746572207B0D0A20206261636B67726F';
wwv_flow_api.g_varchar2_table(396) := '756E642D636F6C6F723A20233936393839653B0D0A7D0D0A0D0A2E742D427574746F6E2D2D7761726E696E67202E66613A61667465722C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D7761726E696E673A686F766572202E';
wwv_flow_api.g_varchar2_table(397) := '66613A6166746572207B0D0A20206261636B67726F756E642D636F6C6F723A20236662636534613B0D0A7D0D0A0D0A2E742D427574746F6E2D2D686F74202E66613A61667465722C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E';
wwv_flow_api.g_varchar2_table(398) := '2D2D686F743A686F766572202E66613A6166746572207B0D0A20206261636B67726F756E642D636F6C6F723A20233332333333363B0D0A7D0D0A2E742D426F64792D616374696F6E73546F67676C65207B0D0A2020626F726465722D7261646975733A20';
wwv_flow_api.g_varchar2_table(399) := '3270783B0D0A20206261636B67726F756E642D636F6C6F723A20236634663466343B0D0A2020626F726465722D636F6C6F723A207267626128302C20302C20302C20302E303735293B0D0A2020626F726465722D72696768742D636F6C6F723A20747261';
wwv_flow_api.g_varchar2_table(400) := '6E73706172656E743B0D0A7D0D0A2E742D426F64792D616374696F6E73546F67676C653A666F637573207B0D0A2020626F726465722D636F6C6F723A20233035366262663B0D0A7D0D0A0D0A2E742D427574746F6E526567696F6E207B0D0A2020626163';
wwv_flow_api.g_varchar2_table(401) := '6B67726F756E642D636F6C6F723A20236666666666663B0D0A2020636F6C6F723A20233236323632363B0D0A2020626F726465722D7261646975733A203270783B0D0A7D0D0A2E742D427574746F6E526567696F6E2D2D6E6F5549207B0D0A2020626163';
wwv_flow_api.g_varchar2_table(402) := '6B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A2E742D427574746F6E526567696F6E2D2D77697A6172642C0D0A2E742D427574746F6E526567696F6E2D2D6469616C6F67526567696F6E207B0D0A2020626F726465722D';
wwv_flow_api.g_varchar2_table(403) := '7261646975733A2030203020327078203270783B0D0A7D0D0A2E742D427574746F6E526567696F6E2D2D6469616C6F67526567696F6E207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A2E742D426F';
wwv_flow_api.g_varchar2_table(404) := '6479202E742D427574746F6E526567696F6E2D2D73686F775469746C65202E742D427574746F6E526567696F6E2D7469746C65207B0D0A2020636F6C6F723A20233339333933393B0D0A7D0D0A2E742D426F64792D7469746C65202E742D427574746F6E';
wwv_flow_api.g_varchar2_table(405) := '526567696F6E2D2D73686F775469746C65202E742D427574746F6E526567696F6E2D7469746C65207B0D0A2020636F6C6F723A20233430343034303B0D0A7D0D0A2E742D426F64792D696E666F202E742D427574746F6E526567696F6E2D2D73686F7754';
wwv_flow_api.g_varchar2_table(406) := '69746C65202E742D427574746F6E526567696F6E2D7469746C65207B0D0A2020636F6C6F723A20233430343034303B0D0A7D0D0A2E742D526567696F6E202E742D427574746F6E526567696F6E2D2D73686F775469746C65202E742D427574746F6E5265';
wwv_flow_api.g_varchar2_table(407) := '67696F6E2D7469746C652C0D0A2E742D427574746F6E526567696F6E202E742D427574746F6E526567696F6E2D2D73686F775469746C65202E742D427574746F6E526567696F6E2D7469746C65207B0D0A2020636F6C6F723A20233430343034303B0D0A';
wwv_flow_api.g_varchar2_table(408) := '7D0D0A2E742D426F64792D616374696F6E73202E742D427574746F6E526567696F6E207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A2020626F726465722D7261646975733A20303B0D0A7D0D0A0D0A2E66';
wwv_flow_api.g_varchar2_table(409) := '632E75692D776964676574207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E66632D746F6F6C626172207B0D0A2020626F726465722D636F6C6F723A20236562656265623B0D0A20206261636B67726F756E';
wwv_flow_api.g_varchar2_table(410) := '642D636F6C6F723A20236666666666663B0D0A2020626F726465722D7261646975733A2032707820327078203020303B0D0A7D0D0A2E66632D746F6F6C6261722068322C0D0A2E6663202E66632D62617369632D766965772074642E66632D6461792D6E';
wwv_flow_api.g_varchar2_table(411) := '756D6265722C0D0A2E6663202E66632D6461792D6E756D626572207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E66632D6461792D6865616465722E75692D7769646765742D6865616465722C0D0A2E66632D76696577202E75692D77';
wwv_flow_api.g_varchar2_table(412) := '69646765742D686561646572207B0D0A20206261636B67726F756E642D636F6C6F723A20236632663266323B0D0A2020636F6C6F723A20233236323632363B0D0A2020626F726465722D636F6C6F723A20236536653665363B0D0A7D0D0A6469762E6663';
wwv_flow_api.g_varchar2_table(413) := '2D6167656E64614C697374207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A2020626F726465722D636F6C6F723A20236562656265623B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E6663202E6663';
wwv_flow_api.g_varchar2_table(414) := '2D6167656E64614C6973742D646179486561646572207B0D0A20206261636B67726F756E642D636F6C6F723A20236439643964393B0D0A2020636F6C6F723A20233236323632363B0D0A2020626F726465722D636F6C6F723A20236661666166613B0D0A';
wwv_flow_api.g_varchar2_table(415) := '7D0D0A2E6663202E66632D6167656E64614C6973742D646179207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E6663202E66632D6167656E64614C6973742D64617465207B0D0A2020636F6C6F723A20233464346434643B0D0A7D0D0A';
wwv_flow_api.g_varchar2_table(416) := '2E6663202E66632D6167656E64614C697374202E66632D6576656E742D73746172742D74696D652C0D0A2E6663202E66632D6167656E64614C697374202E66632D6576656E742D616C6C2D646179207B0D0A2020636F6C6F723A20233464346434643B0D';
wwv_flow_api.g_varchar2_table(417) := '0A7D0D0A626F6479202E66632074642E66632D746F6461792C0D0A626F6479202E6663202E75692D7769646765742D636F6E74656E74207B0D0A2020626F726465722D636F6C6F723A20236536653665363B0D0A2020636F6C6F723A2023323632363236';
wwv_flow_api.g_varchar2_table(418) := '3B0D0A7D0D0A626F6479202E75692D7769646765742D636F6E74656E742E66632D746F6461792E75692D73746174652D686967686C69676874207B0D0A20206261636B67726F756E642D636F6C6F723A20236632663266323B0D0A7D0D0A2E6663202E66';
wwv_flow_api.g_varchar2_table(419) := '632D6167656E64614C6973742D6974656D207B0D0A2020626F726465722D636F6C6F723A20236661666166613B0D0A7D0D0A2E6663202E75692D627574746F6E3A6163746976652C0D0A2E6663202E75692D627574746F6E3A666F6375732C0D0A2E6663';
wwv_flow_api.g_varchar2_table(420) := '2D766965773A6163746976652C0D0A2E66632D766965773A666F637573207B0D0A20206F75746C696E653A2031707820736F6C696420233035366262663B0D0A7D0D0A2E66632D766965772D636F6E7461696E6572203E202E66632D766965773A616374';
wwv_flow_api.g_varchar2_table(421) := '6976652C0D0A2E66632D766965772D636F6E7461696E6572203E202E66632D766965773A666F637573207B0D0A20206F75746C696E653A206E6F6E653B0D0A7D0D0A0D0A2E742D436172642D77726170207B0D0A2020626F726465722D7261646975733A';
wwv_flow_api.g_varchar2_table(422) := '203270783B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E742D436172642D777261703A666F637573207B0D0A2020626F726465722D636F6C6F723A20233035366262663B0D0A7D0D0A2E742D436172642D69';
wwv_flow_api.g_varchar2_table(423) := '636F6E207B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D436172642D64657363207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D436172642D696E666F2C0D0A2E742D436172642D7375627469746C65207B';
wwv_flow_api.g_varchar2_table(424) := '0D0A2020636F6C6F723A20233636363636363B0D0A7D0D0A2E742D436172642D7469746C65207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D436172642D636F6C6F7246696C6C2C0D0A2E742D436172642D69636F6E207B0D0A20';
wwv_flow_api.g_varchar2_table(425) := '206261636B67726F756E642D636F6C6F723A20233332333333363B0D0A2020636F6C6F723A20236633663366343B0D0A7D0D0A0D0A2E742D436C617373696343616C656E6461722D6D6F6E74685469746C65207B0D0A2020636F6C6F723A202332363236';
wwv_flow_api.g_varchar2_table(426) := '32363B0D0A7D0D0A2E742D436C617373696343616C656E6461722D646179436F6C756D6E207B0D0A20206261636B67726F756E642D636F6C6F723A20236661666166613B0D0A2020766572746963616C2D616C69676E3A20746F703B0D0A2020626F7264';
wwv_flow_api.g_varchar2_table(427) := '65722D636F6C6F723A20236632663266323B0D0A2020636F6C6F723A20233464346434643B0D0A7D0D0A2E742D436C617373696343616C656E6461722D646179207B0D0A2020626F726465722D636F6C6F723A20236632663266323B0D0A7D0D0A2E742D';
wwv_flow_api.g_varchar2_table(428) := '436C617373696343616C656E6461722D6461792E69732D696E616374697665202E742D436C617373696343616C656E6461722D64617465207B0D0A20206F7061636974793A202E353B0D0A7D0D0A2E742D436C617373696343616C656E6461722D646179';
wwv_flow_api.g_varchar2_table(429) := '2E69732D7765656B656E642C0D0A2E742D436C617373696343616C656E6461722D6461792E69732D696E616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A20236663666366633B0D0A7D0D0A2E742D436C617373696343616C656E';
wwv_flow_api.g_varchar2_table(430) := '6461722D6461792E69732D746F646179202E742D436C617373696343616C656E6461722D64617465207B0D0A20206261636B67726F756E642D636F6C6F723A20233332333333363B0D0A2020636F6C6F723A20236633663366343B0D0A7D0D0A2E742D43';
wwv_flow_api.g_varchar2_table(431) := '6C617373696343616C656E6461722D64617465207B0D0A2020636F6C6F723A20233636363636363B0D0A7D0D0A2E742D436C617373696343616C656E6461722D6576656E74207B0D0A20206261636B67726F756E642D636F6C6F723A2023663266326632';
wwv_flow_api.g_varchar2_table(432) := '3B0D0A7D0D0A2E742D436C617373696343616C656E6461722D6576656E74207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D436C617373696343616C656E6461722D6576656E742061207B0D0A20206261636B67726F756E642D63';
wwv_flow_api.g_varchar2_table(433) := '6F6C6F723A20233332333333363B0D0A2020636F6C6F723A20236633663366343B0D0A7D0D0A2E742D436C617373696343616C656E6461722D2D7765656B6C79202E742D436C617373696343616C656E6461722D74696D65436F6C2C0D0A2E742D436C61';
wwv_flow_api.g_varchar2_table(434) := '7373696343616C656E6461722D2D6461696C79202E742D436C617373696343616C656E6461722D74696D65436F6C207B0D0A20206261636B67726F756E642D636F6C6F723A20236661666166613B0D0A7D0D0A2E742D436C617373696343616C656E6461';
wwv_flow_api.g_varchar2_table(435) := '722D2D7765656B6C79202E742D436C617373696343616C656E6461722D6461794576656E74732C0D0A2E742D436C617373696343616C656E6461722D2D6461696C79202E742D436C617373696343616C656E6461722D6461794576656E7473207B0D0A20';
wwv_flow_api.g_varchar2_table(436) := '20636F6C6F723A20233236323632363B0D0A7D0D0A2E742D436C617373696343616C656E6461722D2D7765656B6C79202E742D436C617373696343616C656E6461722D6461794576656E747320612C0D0A2E742D436C617373696343616C656E6461722D';
wwv_flow_api.g_varchar2_table(437) := '2D6461696C79202E742D436C617373696343616C656E6461722D6461794576656E74732061207B0D0A20206261636B67726F756E642D636F6C6F723A20233332333333363B0D0A2020636F6C6F723A20236633663366343B0D0A7D0D0A2E742D436C6173';
wwv_flow_api.g_varchar2_table(438) := '73696343616C656E6461722D2D7765656B6C79202E742D436C617373696343616C656E6461722D6461792E69732D746F6461792C0D0A2E742D436C617373696343616C656E6461722D2D6461696C79202E742D436C617373696343616C656E6461722D64';
wwv_flow_api.g_varchar2_table(439) := '61792E69732D746F646179207B0D0A20206261636B67726F756E642D636F6C6F723A20236231623262363B0D0A7D0D0A2E742D436C617373696343616C656E6461722D6C697374207B0D0A2020626F726465722D636F6C6F723A20236632663266323B0D';
wwv_flow_api.g_varchar2_table(440) := '0A7D0D0A2E742D436C617373696343616C656E6461722D6C6973745469746C652C0D0A2E742D436C617373696343616C656E6461722D6C6973744576656E74207B0D0A2020626F726465722D636F6C6F723A20236632663266323B0D0A7D0D0A2E742D43';
wwv_flow_api.g_varchar2_table(441) := '6C617373696343616C656E6461722D6C6973745469746C65207B0D0A20206261636B67726F756E642D636F6C6F723A20236661666166613B0D0A2020636F6C6F723A20233464346434643B0D0A7D0D0A2E742D436C617373696343616C656E6461722D6C';
wwv_flow_api.g_varchar2_table(442) := '6973744576656E74207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D436F6D6D656E74732D2D63686174202E742D436F6D6D656E74732D636F6D6D656E74207B0D0A20206261636B67726F756E642D636F6C6F723A202362656265';
wwv_flow_api.g_varchar2_table(443) := '62653B0D0A2020636F6C6F723A20233030303030303B0D0A7D0D0A2E742D436F6D6D656E74732D2D63686174202E742D436F6D6D656E74732D636F6D6D656E743A6166746572207B0D0A2020626F726465722D72696768742D636F6C6F723A2023626562';
wwv_flow_api.g_varchar2_table(444) := '6562653B0D0A7D0D0A2E742D436F6D6D656E74732D2D63686174202E742D436F6D6D656E74732D6974656D2E69732D616374697665202E742D436F6D6D656E74732D636F6D6D656E74207B0D0A20206261636B67726F756E642D636F6C6F723A20236137';
wwv_flow_api.g_varchar2_table(445) := '613761373B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D436F6D6D656E74732D2D63686174202E742D436F6D6D656E74732D6974656D2E69732D616374697665202E742D436F6D6D656E74732D636F6D6D656E743A616674657220';
wwv_flow_api.g_varchar2_table(446) := '7B0D0A2020626F726465722D72696768742D636F6C6F723A20236137613761373B0D0A7D0D0A2E742D436F6D6D656E74732D2D6261736963202E742D436F6D6D656E74732D6974656D2E69732D616374697665207B0D0A20206261636B67726F756E642D';
wwv_flow_api.g_varchar2_table(447) := '636F6C6F723A20236662666266623B0D0A7D0D0A2E742D436F6D6D656E74732D6974656D2E69732D73797374656D4D657373616765207B0D0A20206261636B67726F756E642D636F6C6F723A20236231623162313B0D0A7D0D0A2E742D436F6D6D656E74';
wwv_flow_api.g_varchar2_table(448) := '732D696E666F207B0D0A2020636F6C6F723A20233235323532353B0D0A7D0D0A2E742D436F6D6D656E74732D636F6D6D656E74207B0D0A2020636F6C6F723A20233030303030303B0D0A7D0D0A2E742D436F6E66696750616E656C2D61626F7574207B0D';
wwv_flow_api.g_varchar2_table(449) := '0A20206261636B67726F756E642D636F6C6F723A20236666663765303B0D0A2020636F6C6F723A20233536353635363B0D0A7D0D0A2E742D436F6E66696750616E656C2D69636F6E207B0D0A2020626F726465722D7261646975733A20313030253B0D0A';
wwv_flow_api.g_varchar2_table(450) := '20206261636B67726F756E642D636F6C6F723A20234130413041303B0D0A2020636F6C6F723A20234646463B0D0A7D0D0A2E742D436F6E66696750616E656C2D69636F6E2E69732D656E61626C6564207B0D0A20206261636B67726F756E642D636F6C6F';
wwv_flow_api.g_varchar2_table(451) := '723A20233362616132633B0D0A7D0D0A2E742D436F6E66696750616E656C2D69636F6E2E69732D64697361626C6564207B0D0A20206261636B67726F756E642D636F6C6F723A20236634343333363B0D0A7D0D0A2E742D436F6E66696750616E656C2D73';
wwv_flow_api.g_varchar2_table(452) := '657474696E672C0D0A2E742D436F6E66696750616E656C2D737461747573207B0D0A2020636F6C6F723A20233733373337333B0D0A7D0D0A2E742D436F6E66696750616E656C2D737461747573207B0D0A2020636F6C6F723A20233236323632363B0D0A';
wwv_flow_api.g_varchar2_table(453) := '7D0D0A2E742D436F6E66696750616E656C2D617474724C696E6B207B0D0A2020636F6C6F723A20233733373337333B0D0A7D0D0A2E742D436F6E66696750616E656C2D617474724C696E6B3A686F766572207B0D0A20206261636B67726F756E642D636F';
wwv_flow_api.g_varchar2_table(454) := '6C6F723A207267626128302C20302C20302C20302E3035293B0D0A7D0D0A2E742D436F6E66696750616E656C2D6174747256616C7565207B0D0A2020636F6C6F723A20233035366262663B0D0A7D0D0A2E742D4469616C6F67207B0D0A20206261636B67';
wwv_flow_api.g_varchar2_table(455) := '726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A0D0A2E742D4469616C6F67203A3A2D7765626B69742D7363726F6C6C6261722D7468756D62207B0D0A20206261636B67726F756E642D636F6C6F723A20236266626662663B0D0A7D0D0A';
wwv_flow_api.g_varchar2_table(456) := '2E742D4469616C6F67203A3A2D7765626B69742D7363726F6C6C6261722D7468756D623A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20236233623362333B0D0A7D0D0A2E742D4469616C6F673A3A2D7765626B69742D736372';
wwv_flow_api.g_varchar2_table(457) := '6F6C6C6261722D747261636B207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A0D0A2E742D466F6F7465722D746F70427574746F6E207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666';
wwv_flow_api.g_varchar2_table(458) := '663B0D0A2020636F6C6F723A20233532353235323B0D0A7D0D0A2E742D466F6F7465722D746F70427574746F6E3A666F637573207B0D0A2020626F782D736861646F773A20302030203020317078202330353662626620696E7365743B0D0A7D0D0A2E74';
wwv_flow_api.g_varchar2_table(459) := '2D466F726D2D696E707574436F6E7461696E65723A6265666F7265207B0D0A2020636F6C6F723A20233230323032303B0D0A7D0D0A2E617065782D6974656D2D74657874617265612C0D0A2E617065782D6974656D2D746578742C0D0A2E617065782D69';
wwv_flow_api.g_varchar2_table(460) := '74656D2D73656C6563742C0D0A2E617065782D6974656D2D6D756C74692C0D0A73656C6563742E6C6973746D616E61676572207B0D0A2020636F6C6F723A20233230323032303B0D0A20206261636B67726F756E642D636F6C6F723A2023663966396639';
wwv_flow_api.g_varchar2_table(461) := '3B0D0A2020626F726465722D636F6C6F723A20236466646664663B0D0A7D0D0A2E617065782D6974656D2D74657874617265612E617065782D706167652D6974656D2D6572726F722C0D0A2E617065782D6974656D2D746578742E617065782D70616765';
wwv_flow_api.g_varchar2_table(462) := '2D6974656D2D6572726F722C0D0A2E617065782D6974656D2D73656C6563742E617065782D706167652D6974656D2D6572726F722C0D0A2E617065782D6974656D2D6D756C74692E617065782D706167652D6974656D2D6572726F722C0D0A73656C6563';
wwv_flow_api.g_varchar2_table(463) := '742E6C6973746D616E616765722E617065782D706167652D6974656D2D6572726F72207B0D0A2020626F726465722D636F6C6F723A20236637373036363B0D0A7D0D0A2E617065782D6974656D2D74657874617265612E617065782D706167652D697465';
wwv_flow_api.g_varchar2_table(464) := '6D2D6572726F723A72657175697265643A76616C69642C0D0A2E617065782D6974656D2D746578742E617065782D706167652D6974656D2D6572726F723A72657175697265643A76616C69642C0D0A2E617065782D6974656D2D73656C6563742E617065';
wwv_flow_api.g_varchar2_table(465) := '782D706167652D6974656D2D6572726F723A72657175697265643A76616C69642C0D0A2E617065782D6974656D2D6D756C74692E617065782D706167652D6974656D2D6572726F723A72657175697265643A76616C69642C0D0A73656C6563742E6C6973';
wwv_flow_api.g_varchar2_table(466) := '746D616E616765722E617065782D706167652D6974656D2D6572726F723A72657175697265643A76616C6964207B0D0A2020626F726465722D636F6C6F723A20236466646664663B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D';
wwv_flow_api.g_varchar2_table(467) := '2D666C6F6174696E674C6162656C2E617065782D6974656D2D777261707065722D2D74657874617265612E6A732D73686F772D6C6162656C202E742D466F726D2D6C6162656C3A6265666F72652C0D0A2E742D466F726D2D6669656C64436F6E7461696E';
wwv_flow_api.g_varchar2_table(468) := '65722D2D666C6F6174696E674C6162656C2E617065782D6974656D2D777261707065722D2D74657874617265612E69732D616374697665202E742D466F726D2D6C6162656C3A6265666F7265207B0D0A20206261636B67726F756E642D636F6C6F723A20';
wwv_flow_api.g_varchar2_table(469) := '236639663966393B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D666C6F6174696E674C6162656C2E617065782D6974656D2D777261707065722D2D74657874617265613A666F6375732D77697468696E202E742D466F726D2D';
wwv_flow_api.g_varchar2_table(470) := '6C6162656C3A6265666F7265207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D666C6F6174696E674C6162656C2E6170';
wwv_flow_api.g_varchar2_table(471) := '65782D6974656D2D777261707065722D2D74657874617265613A686F766572202E742D466F726D2D6C6162656C3A6265666F7265207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E617065782D6974656D2D';
wwv_flow_api.g_varchar2_table(472) := '746578742C0D0A2E617065782D6974656D2D73656C6563742C0D0A2E617065782D6974656D2D7465787461726561207B0D0A2020626F726465722D7261646975733A203270783B0D0A7D0D0A2E617065782D6974656D2D6D756C7469202E617065782D69';
wwv_flow_api.g_varchar2_table(473) := '74656D2D746578742E617065782D6974656D2D706F7075702D6C6F76207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A2020626F726465722D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A2E';
wwv_flow_api.g_varchar2_table(474) := '742D466F726D2D6669656C64436F6E7461696E65722D2D666C6F6174696E674C6162656C202E742D466F726D2D696E707574436F6E7461696E6572202E617065782D6974656D2D646973706C61792D6F6E6C79207B0D0A2020636F6C6F723A2023323032';
wwv_flow_api.g_varchar2_table(475) := '3032303B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A2020626F726465722D636F6C6F723A20236466646664663B0D0A2020626F726465722D7374796C653A206461736865643B0D0A7D0D0A0D0A2E617065782D6974';
wwv_flow_api.g_varchar2_table(476) := '656D2D66696C652D64726F707A6F6E652D6C6162656C207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A2020636F6C6F723A20726762612833322C2033322C2033322C20302E37293B0D0A2020626F726465722D7261';
wwv_flow_api.g_varchar2_table(477) := '646975733A2032707820302030203270783B0D0A7D0D0A2E752D52544C202E617065782D6974656D2D66696C652D64726F707A6F6E652D6C6162656C207B0D0A2020626F726465722D7261646975733A2030203270782032707820303B0D0A7D0D0A2E61';
wwv_flow_api.g_varchar2_table(478) := '7065782D6974656D2D66696C652D64726F707A6F6E652D69636F6E207B0D0A20206261636B67726F756E642D636F6C6F723A20236639663966393B0D0A2020626F726465722D7261646975733A2030203270782032707820303B0D0A7D0D0A2E752D5254';
wwv_flow_api.g_varchar2_table(479) := '4C202E617065782D6974656D2D66696C652D64726F707A6F6E652D69636F6E207B0D0A2020626F726465722D7261646975733A2032707820302030203270783B0D0A7D0D0A2E617065782D6974656D2D66696C653A686F766572202B202E617065782D69';
wwv_flow_api.g_varchar2_table(480) := '74656D2D66696C652D64726F707A6F6E65202E617065782D6974656D2D66696C652D64726F707A6F6E652D6C6162656C207B0D0A2020636F6C6F723A20233230323032303B0D0A7D0D0A2E617065782D6974656D2D66696C653A686F766572202B202E61';
wwv_flow_api.g_varchar2_table(481) := '7065782D6974656D2D66696C652D64726F707A6F6E65202E617065782D6974656D2D66696C652D64726F707A6F6E652D69636F6E207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A2020636F6C6F723A202332303230';
wwv_flow_api.g_varchar2_table(482) := '32303B0D0A7D0D0A2E617065782D6974656D2D66696C653A666F637573202B202E617065782D6974656D2D66696C652D64726F707A6F6E65202E617065782D6974656D2D66696C652D64726F707A6F6E652D6C6162656C207B0D0A2020626F726465722D';
wwv_flow_api.g_varchar2_table(483) := '636F6C6F723A20233035366262663B0D0A2020636F6C6F723A20233230323032303B0D0A7D0D0A2E617065782D6974656D2D66696C653A666F637573202B202E617065782D6974656D2D66696C652D64726F707A6F6E65202E617065782D6974656D2D66';
wwv_flow_api.g_varchar2_table(484) := '696C652D64726F707A6F6E652D69636F6E207B0D0A2020626F726465722D636F6C6F723A20233035366262663B0D0A20206261636B67726F756E642D636F6C6F723A20233035366262663B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E';
wwv_flow_api.g_varchar2_table(485) := '617065782D6974656D2D74657874617265613A666F6375732C0D0A2E617065782D6974656D2D746578743A666F6375732C0D0A2E617065782D6974656D2D73656C6563743A666F6375732C0D0A2E617065782D6974656D2D6D756C74693A666F6375732C';
wwv_flow_api.g_varchar2_table(486) := '0D0A73656C6563742E6C6973746D616E616765723A666F637573207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666662021696D706F7274616E743B0D0A2020626F726465722D636F6C6F723A20233035366262662021696D706F';
wwv_flow_api.g_varchar2_table(487) := '7274616E743B0D0A7D0D0A2E617065782D6974656D2D746578742E612D506F7075704C4F562D7365617263683A666F637573202B202E612D427574746F6E2D2D706F7075704C4F562C0D0A2E617065782D6974656D2D746578742E612D506F7075704C4F';
wwv_flow_api.g_varchar2_table(488) := '562D7365617263682E69732D666F6375736564202B202E612D427574746F6E2D2D706F7075704C4F562C0D0A2E617065782D6974656D2D746578742E617065782D6974656D2D706F7075702D6C6F763A666F637573202B202E612D427574746F6E2D2D70';
wwv_flow_api.g_varchar2_table(489) := '6F7075704C4F562C0D0A2E617065782D6974656D2D746578742E617065782D6974656D2D706F7075702D6C6F762E69732D666F6375736564202B202E612D427574746F6E2D2D706F7075704C4F562C0D0A2E617065782D6974656D2D6D756C74693A666F';
wwv_flow_api.g_varchar2_table(490) := '637573202B202E612D427574746F6E2D2D706F7075704C4F562C0D0A2E617065782D6974656D2D6D756C74692E69732D666F6375736564202B202E612D427574746F6E2D2D706F7075704C4F562C0D0A2E617065782D6974656D2D746578742E612D506F';
wwv_flow_api.g_varchar2_table(491) := '7075704C4F562D7365617263683A666F637573202B202E617065782D6974656D2D69636F6E202B202E612D427574746F6E2D2D706F7075704C4F562C0D0A2E617065782D6974656D2D746578742E612D506F7075704C4F562D7365617263682E69732D66';
wwv_flow_api.g_varchar2_table(492) := '6F6375736564202B202E617065782D6974656D2D69636F6E202B202E612D427574746F6E2D2D706F7075704C4F562C0D0A2E617065782D6974656D2D746578742E617065782D6974656D2D706F7075702D6C6F763A666F637573202B202E617065782D69';
wwv_flow_api.g_varchar2_table(493) := '74656D2D69636F6E202B202E612D427574746F6E2D2D706F7075704C4F562C0D0A2E617065782D6974656D2D746578742E617065782D6974656D2D706F7075702D6C6F762E69732D666F6375736564202B202E612D427574746F6E2D2D706F7075704C4F';
wwv_flow_api.g_varchar2_table(494) := '562C0D0A2E617065782D6974656D2D6D756C74693A666F637573202B202E617065782D6974656D2D69636F6E202B202E612D427574746F6E2D2D706F7075704C4F562C0D0A2E617065782D6974656D2D6D756C74692E69732D666F6375736564202B202E';
wwv_flow_api.g_varchar2_table(495) := '617065782D6974656D2D69636F6E202B202E612D427574746F6E2D2D706F7075704C4F56207B0D0A2020626F782D736861646F773A20302030203020317078202330353662626620696E7365743B0D0A7D0D0A2E617065782D6974656D2D746578746172';
wwv_flow_api.g_varchar2_table(496) := '65613A686F7665722C0D0A2E617065782D6974656D2D746578743A686F7665722C0D0A2E617065782D6974656D2D73656C6563743A686F7665722C0D0A2E617065782D6974656D2D6D756C74693A686F7665722C0D0A73656C6563742E6C6973746D616E';
wwv_flow_api.g_varchar2_table(497) := '616765723A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075743A3A2D7765626B69742D696E7075742D706C616365686F6C64';
wwv_flow_api.g_varchar2_table(498) := '6572207B0D0A2020636F6C6F723A20233030303030303B0D0A20206F7061636974793A202E35353B0D0A7D0D0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075743A3A2D6D6F7A2D706C616365686F6C646572207B0D0A2020636F6C';
wwv_flow_api.g_varchar2_table(499) := '6F723A20233030303030303B0D0A20206F7061636974793A202E35353B0D0A7D0D0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075743A2D6D732D696E7075742D706C616365686F6C646572207B0D0A2020636F6C6F723A20233030';
wwv_flow_api.g_varchar2_table(500) := '303030303B0D0A20206F7061636974793A202E35353B0D0A7D0D0A2E742D466F726D20696E7075742E66696C65207B0D0A2020636F6C6F723A20233230323032303B0D0A7D0D0A2E742D466F726D2D696E707574436F6E7461696E6572207370616E2E64';
wwv_flow_api.g_varchar2_table(501) := '6973706C61795F6F6E6C79207B0D0A2020626F726465722D636F6C6F723A207472616E73706172656E743B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A2E742D466F726D2D73656C6563742C0D0A2E';
wwv_flow_api.g_varchar2_table(502) := '742D466F726D2D696E707574436F6E7461696E65722073656C6563742E73656C6563746C6973742C0D0A2E742D466F726D2D696E707574436F6E7461696E65722073656C6563742E7965735F6E6F207B0D0A2020636F6C6F723A20233230323032303B0D';
wwv_flow_api.g_varchar2_table(503) := '0A2020626F726465722D636F6C6F723A20236466646664663B0D0A7D0D0A2E742D466F726D2D6669656C642D2D726561644F6E6C79207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A2E742D466F72';
wwv_flow_api.g_varchar2_table(504) := '6D2D726164696F4C6162656C2C0D0A2E742D466F726D2D696E707574436F6E7461696E6572202E726164696F5F67726F7570206C6162656C2C0D0A2E742D466F726D2D636865636B626F784C6162656C2C0D0A2E742D466F726D2D696E707574436F6E74';
wwv_flow_api.g_varchar2_table(505) := '61696E6572202E636865636B626F785F67726F7570206C6162656C2C0D0A2E742D466F726D2D6C6162656C207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D466F726D2D6572726F72207B0D0A2020636F6C6F723A202366343433';
wwv_flow_api.g_varchar2_table(506) := '33363B0D0A7D0D0A2E742D466F726D2D706F737454657874207B0D0A2020636F6C6F723A20236136613661363B0D0A7D0D0A2E742D466F726D2D2D73656172636820696E7075742E742D466F726D2D7365617263684669656C64207B0D0A20206261636B';
wwv_flow_api.g_varchar2_table(507) := '67726F756E642D636F6C6F723A20236639663966393B0D0A2020636F6C6F723A20233230323032303B0D0A7D0D0A2E612D427574746F6E2E612D427574746F6E2D2D63616C656E6461722C0D0A2E612D427574746F6E2E612D427574746F6E2D2D706F70';
wwv_flow_api.g_varchar2_table(508) := '75704C4F56207B0D0A2020626F726465722D7261646975733A2030203270782032707820303B0D0A7D0D0A2E752D52544C202E612D427574746F6E2E612D427574746F6E2D2D63616C656E6461722C0D0A2E752D52544C202E612D427574746F6E2E612D';
wwv_flow_api.g_varchar2_table(509) := '427574746F6E2D2D706F7075704C4F56207B0D0A2020626F726465722D7261646975733A2032707820302030203270783B0D0A7D0D0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075742E686173446174657069636B65722C0D0A2E';
wwv_flow_api.g_varchar2_table(510) := '742D466F726D2D696E707574436F6E7461696E657220696E7075742E706F7075705F6C6F76207B0D0A2020626F726465722D7261646975733A2032707820302030203270783B0D0A7D0D0A2E752D52544C202E742D466F726D2D696E707574436F6E7461';
wwv_flow_api.g_varchar2_table(511) := '696E657220696E7075742E686173446174657069636B65722C0D0A2E752D52544C202E742D466F726D2D696E707574436F6E7461696E657220696E7075742E706F7075705F6C6F76207B0D0A2020626F726465722D7261646975733A2030203270782032';
wwv_flow_api.g_varchar2_table(512) := '707820303B0D0A7D0D0A0D0A2E636865636B626F785F67726F757020696E7075742C0D0A2E726164696F5F67726F757020696E707574207B0D0A20200D0A20200D0A7D0D0A2E636865636B626F785F67726F757020696E707574202B206C6162656C3A62';
wwv_flow_api.g_varchar2_table(513) := '65666F72652C0D0A2E726164696F5F67726F757020696E707574202B206C6162656C3A6265666F7265207B0D0A20206261636B67726F756E642D636F6C6F723A20236639663966393B0D0A7D0D0A2E636865636B626F785F67726F757020696E7075743A';
wwv_flow_api.g_varchar2_table(514) := '666F637573202B206C6162656C3A6265666F72652C0D0A2E726164696F5F67726F757020696E7075743A666F637573202B206C6162656C3A6265666F7265207B0D0A2020626F726465722D636F6C6F723A20233035366262663B0D0A7D0D0A2E63686563';
wwv_flow_api.g_varchar2_table(515) := '6B626F785F67726F757020696E7075743A666F6375733A636865636B6564202B206C6162656C3A6265666F72652C0D0A2E726164696F5F67726F757020696E7075743A666F6375733A636865636B6564202B206C6162656C3A6265666F7265207B0D0A20';
wwv_flow_api.g_varchar2_table(516) := '20626F726465722D636F6C6F723A20233035366262663B0D0A20206261636B67726F756E642D636F6C6F723A20233035366262663B0D0A2020626F782D736861646F773A20302030203020317078202366396639663920696E7365743B0D0A7D0D0A2E63';
wwv_flow_api.g_varchar2_table(517) := '6865636B626F785F67726F757020696E7075743A636865636B6564202B206C6162656C3A6265666F72652C0D0A2E726164696F5F67726F757020696E7075743A636865636B6564202B206C6162656C3A6265666F7265207B0D0A2020626F726465722D63';
wwv_flow_api.g_varchar2_table(518) := '6F6C6F723A20233035366262663B0D0A20206261636B67726F756E642D636F6C6F723A20233035366262663B0D0A7D0D0A0D0A2E726164696F5F67726F757020696E707574202B206C6162656C3A6166746572207B0D0A20206261636B67726F756E642D';
wwv_flow_api.g_varchar2_table(519) := '636F6C6F723A20236639663966393B0D0A7D0D0A0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570202E636865636B626F785F67726F757020696E707574207B0D0A20200D0A20200D0A7D0D0A2E';
wwv_flow_api.g_varchar2_table(520) := '742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570202E636865636B626F785F67726F757020696E707574202B206C6162656C3A6265666F7265207B0D0A20206261636B67726F756E642D636F6C6F723A20';
wwv_flow_api.g_varchar2_table(521) := '236536653665363B0D0A2020626F726465722D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570202E636865636B626F785F67726F757020';
wwv_flow_api.g_varchar2_table(522) := '696E7075743A666F637573202B206C6162656C3A6265666F7265207B0D0A2020626F726465722D636F6C6F723A20233035366262663B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F757020';
wwv_flow_api.g_varchar2_table(523) := '2E636865636B626F785F67726F757020696E7075743A666F6375733A636865636B6564202B206C6162656C3A6265666F7265207B0D0A2020626F726465722D636F6C6F723A20236639663966393B0D0A20206261636B67726F756E642D636F6C6F723A20';
wwv_flow_api.g_varchar2_table(524) := '236639663966393B0D0A2020626F782D736861646F773A20302030203020317078202330353662626620696E7365743B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570202E636865636B';
wwv_flow_api.g_varchar2_table(525) := '626F785F67726F757020696E7075743A666F6375733A636865636B6564202B206C6162656C3A6166746572207B0D0A2020636F6C6F723A20233035366262663B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F4275';
wwv_flow_api.g_varchar2_table(526) := '74746F6E47726F7570202E636865636B626F785F67726F757020696E7075743A636865636B6564202B206C6162656C3A6265666F7265207B0D0A2020626F726465722D636F6C6F723A20236639663966393B0D0A20206261636B67726F756E642D636F6C';
wwv_flow_api.g_varchar2_table(527) := '6F723A20236639663966393B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570202E636865636B626F785F67726F757020696E7075743A636865636B6564202B206C6162656C3A61667465';
wwv_flow_api.g_varchar2_table(528) := '72207B0D0A2020636F6C6F723A20233035366262663B0D0A7D0D0A0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D70726554657874426C6F636B202E742D466F726D2D6974656D546578742D2D7072652C0D0A2E742D466F726D2D6669';
wwv_flow_api.g_varchar2_table(529) := '656C64436F6E7461696E65722D2D706F737454657874426C6F636B202E742D466F726D2D6974656D546578742D2D706F7374207B0D0A20206261636B67726F756E642D636F6C6F723A20236639663966393B0D0A2020626F782D736861646F773A203020';
wwv_flow_api.g_varchar2_table(530) := '30203020302E3172656D202364666466646620696E7365743B0D0A2020626F726465722D7261646975733A203270783B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D70726554657874426C6F636B202E742D466F726D2D6974';
wwv_flow_api.g_varchar2_table(531) := '656D546578742D2D707265207B0D0A2020626F726465722D7261646975733A2032707820302030203270783B0D0A7D0D0A2E752D52544C202E742D466F726D2D6669656C64436F6E7461696E65722D2D70726554657874426C6F636B202E742D466F726D';
wwv_flow_api.g_varchar2_table(532) := '2D6974656D546578742D2D707265207B0D0A2020626F726465722D7261646975733A2030203270782032707820303B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D706F737454657874426C6F636B202E742D466F726D2D6974';
wwv_flow_api.g_varchar2_table(533) := '656D546578742D2D706F7374207B0D0A2020626F726465722D7261646975733A2030203270782032707820303B0D0A7D0D0A2E752D52544C202E742D466F726D2D6669656C64436F6E7461696E65722D2D706F737454657874426C6F636B202E742D466F';
wwv_flow_api.g_varchar2_table(534) := '726D2D6974656D546578742D2D706F7374207B0D0A2020626F726465722D7261646975733A2032707820302030203270783B0D0A7D0D0A0D0A2E617065782D6974656D2D6861732D69636F6E3A666F637573202B202E617065782D6974656D2D69636F6E';
wwv_flow_api.g_varchar2_table(535) := '2C0D0A2E617065782D6974656D2D6D756C74692E69732D666F6375736564202B202E617065782D6974656D2D69636F6E207B0D0A2020636F6C6F723A20233035366262663B0D0A7D0D0A0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D';
wwv_flow_api.g_varchar2_table(536) := '666C6F6174696E674C6162656C202E617065782D6974656D2D69636F6E207B0D0A2020636F6C6F723A20233430343034303B0D0A2020626F782D736861646F773A202D302E3172656D20302030202364666466646620696E7365743B0D0A2020626F7264';
wwv_flow_api.g_varchar2_table(537) := '65722D7261646975733A2032707820302030203270783B0D0A7D0D0A2E752D52544C202E742D466F726D2D6669656C64436F6E7461696E65722D2D666C6F6174696E674C6162656C202E617065782D6974656D2D69636F6E207B0D0A2020626F782D7368';
wwv_flow_api.g_varchar2_table(538) := '61646F773A20302E3172656D20302030202364666466646620696E7365743B0D0A2020626F726465722D7261646975733A2030203270782032707820303B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D666C6F6174696E674C';
wwv_flow_api.g_varchar2_table(539) := '6162656C202E617065782D6974656D2D6861732D69636F6E3A666F637573202B202E617065782D6974656D2D69636F6E2C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D666C6F6174696E674C6162656C202E617065782D6974656D2D';
wwv_flow_api.g_varchar2_table(540) := '6D756C74692E69732D666F6375736564202B202E617065782D6974656D2D69636F6E207B0D0A2020626F782D736861646F773A206E6F6E653B0D0A7D0D0A0D0A2E742D466F726D2D68656C70427574746F6E3A666F637573202E612D49636F6E207B0D0A';
wwv_flow_api.g_varchar2_table(541) := '2020636F6C6F723A20233035366262663B0D0A7D0D0A0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570202E742D466F726D2D6974656D57726170706572203E202E617065782D6974656D2D6772';
wwv_flow_api.g_varchar2_table(542) := '6F7570203E202E617065782D6974656D2D6F7074696F6E3A66697273742D6F662D74797065206C6162656C207B0D0A2020626F726465722D7261646975733A2032707820327078203020303B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E746169';
wwv_flow_api.g_varchar2_table(543) := '6E65722D2D726164696F427574746F6E47726F7570202E742D466F726D2D6974656D57726170706572203E202E617065782D6974656D2D67726F7570203E202E617065782D6974656D2D6F7074696F6E3A6C6173742D6F662D74797065206C6162656C20';
wwv_flow_api.g_varchar2_table(544) := '7B0D0A2020626F726465722D7261646975733A2030203020327078203270783B0D0A7D0D0A0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570202E617065782D6974656D2D67726964202E617065';
wwv_flow_api.g_varchar2_table(545) := '782D6974656D2D677269642D726F773A6F6E6C792D6368696C64202E617065782D6974656D2D6F7074696F6E3A66697273742D6F662D74797065206C6162656C207B0D0A2020626F726465722D7261646975733A2032707820302030203270783B0D0A7D';
wwv_flow_api.g_varchar2_table(546) := '0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570202E617065782D6974656D2D67726964202E617065782D6974656D2D677269642D726F773A6F6E6C792D6368696C64202E617065782D6974656D';
wwv_flow_api.g_varchar2_table(547) := '2D6F7074696F6E3A6C6173742D6F662D74797065206C6162656C207B0D0A2020626F726465722D7261646975733A2030203270782032707820303B0D0A7D0D0A2E752D52544C202E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F';
wwv_flow_api.g_varchar2_table(548) := '427574746F6E47726F7570202E617065782D6974656D2D67726964202E617065782D6974656D2D677269642D726F773A6F6E6C792D6368696C64202E617065782D6974656D2D6F7074696F6E3A66697273742D6F662D74797065206C6162656C207B0D0A';
wwv_flow_api.g_varchar2_table(549) := '2020626F726465722D7261646975733A2030203270782032707820303B0D0A7D0D0A2E752D52544C202E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570202E617065782D6974656D2D67726964202E61';
wwv_flow_api.g_varchar2_table(550) := '7065782D6974656D2D677269642D726F773A6F6E6C792D6368696C64202E617065782D6974656D2D6F7074696F6E3A6C6173742D6F662D74797065206C6162656C207B0D0A2020626F726465722D7261646975733A2032707820302030203270783B0D0A';
wwv_flow_api.g_varchar2_table(551) := '7D0D0A0D0A2E742D4865616465722D6272616E64696E67207B0D0A20206261636B67726F756E642D636F6C6F723A20236536653665363B0D0A7D0D0A2E742D4865616465722D6C6F676F2C0D0A2E742D486561646572202E742D427574746F6E2D2D6865';
wwv_flow_api.g_varchar2_table(552) := '616465722E69732D6163746976652C0D0A2E742D486561646572202E742D427574746F6E2D2D686561646572207B0D0A2020636F6C6F723A20233430343034303B0D0A7D0D0A2E742D4865616465722D6C6F676F3A686F7665722C0D0A2E742D48656164';
wwv_flow_api.g_varchar2_table(553) := '6572202E742D427574746F6E2D2D6865616465722E69732D6163746976653A686F7665722C0D0A2E742D486561646572202E742D427574746F6E2D2D6865616465723A686F766572207B0D0A2020746578742D6465636F726174696F6E3A206E6F6E653B';
wwv_flow_api.g_varchar2_table(554) := '0D0A7D0D0A2E742D4865616465722D6C6F676F2D6C696E6B207B0D0A2020636F6C6F723A20696E68657269743B0D0A7D0D0A2E742D4865616465722D6C6F676F2D6C696E6B3A666F6375732C0D0A2E742D4865616465722D6C6F676F2D6C696E6B3A6163';
wwv_flow_api.g_varchar2_table(555) := '746976653A666F637573207B0D0A20206F75746C696E653A206E6F6E653B0D0A2020626F782D736861646F773A20302030203020317078202331383933663920696E7365743B0D0A7D0D0A2E742D4865726F526567696F6E2D69636F6E207B0D0A202062';
wwv_flow_api.g_varchar2_table(556) := '6F726465722D7261646975733A203470783B0D0A20206261636B67726F756E642D636F6C6F723A20233332333333363B0D0A2020636F6C6F723A20236633663366343B0D0A7D0D0A2E742D4865726F526567696F6E2D7469746C65207B0D0A2020636F6C';
wwv_flow_api.g_varchar2_table(557) := '6F723A20233166316631663B0D0A7D0D0A2E742D4865726F526567696F6E2D636F6C2D2D636F6E74656E74207B0D0A2020636F6C6F723A20233663366336633B0D0A7D0D0A0D0A2E742D426F64792D7469746C65202E742D4865726F526567696F6E2D74';
wwv_flow_api.g_varchar2_table(558) := '69746C652C0D0A2E742D426F64792D7469746C65202E742D4865726F526567696F6E2D636F6C2D2D636F6E74656E74207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A0D0A2E612D495252207B0D0A2020626F726465722D726164697573';
wwv_flow_api.g_varchar2_table(559) := '3A203270783B0D0A2020626F726465722D636F6C6F723A207267626128302C20302C20302C20302E31293B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E612D495252202E612D4952522D706167696E617469';
wwv_flow_api.g_varchar2_table(560) := '6F6E2D6C6162656C207B0D0A2020636F6C6F723A20233733373337333B0D0A7D0D0A2E612D4952522D7265706F727453756D6D6172792D76616C7565207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E612D4952522D636F6E74726F6C';
wwv_flow_api.g_varchar2_table(561) := '73436F6E7461696E6572207B0D0A2020626F726465722D746F702D636F6C6F723A20236635663566353B0D0A20206261636B67726F756E642D636F6C6F723A20236661666166613B0D0A7D0D0A2E612D4952522D66756C6C56696577207B0D0A20206261';
wwv_flow_api.g_varchar2_table(562) := '636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E612D4952522D627574746F6E2E612D4952522D627574746F6E2D2D636F6E74726F6C73207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E74';
wwv_flow_api.g_varchar2_table(563) := '3B0D0A7D0D0A2E612D4952522D746F6F6C626172207B0D0A20206261636B67726F756E643A20236666666666663B0D0A2020626F726465722D636F6C6F723A20236536653665363B0D0A7D0D0A2E612D5265706F72742D70657263656E7443686172742D';
wwv_flow_api.g_varchar2_table(564) := '66696C6C207B0D0A20206261636B67726F756E642D636F6C6F723A20233332333333363B0D0A7D0D0A2E612D5265706F72742D70657263656E744368617274207B0D0A20206261636B67726F756E642D636F6C6F723A20236231623262363B0D0A7D0D0A';
wwv_flow_api.g_varchar2_table(565) := '2E612D4952522D627574746F6E2D2D636F6C536561726368207B0D0A2020626F726465722D746F702D72696768742D7261646975733A20302021696D706F7274616E743B0D0A2020626F726465722D626F74746F6D2D72696768742D7261646975733A20';
wwv_flow_api.g_varchar2_table(566) := '302021696D706F7274616E743B0D0A7D0D0A2E752D52544C202E612D4952522D627574746F6E2D2D636F6C536561726368207B0D0A2020626F726465722D746F702D72696768742D7261646975733A203270782021696D706F7274616E743B0D0A202062';
wwv_flow_api.g_varchar2_table(567) := '6F726465722D626F74746F6D2D72696768742D7261646975733A203270782021696D706F7274616E743B0D0A2020626F726465722D746F702D6C6566742D7261646975733A20302021696D706F7274616E743B0D0A2020626F726465722D626F74746F6D';
wwv_flow_api.g_varchar2_table(568) := '2D6C6566742D7261646975733A20302021696D706F7274616E743B0D0A7D0D0A2E612D4952522D69636F6E566965775461626C652C0D0A2E612D4952522D6368617274566965772C0D0A2E612D4952522D7069766F74566965772C0D0A2E612D4952522D';
wwv_flow_api.g_varchar2_table(569) := '67726F75704279566965772C0D0A2E612D4952522D64657461696C56696577207B0D0A2020626F726465722D746F702D636F6C6F723A20236635663566353B0D0A7D0D0A2E612D4952522D746F6F6C6261722D2D73696E676C65526F77207B0D0A202062';
wwv_flow_api.g_varchar2_table(570) := '6F726465722D626F74746F6D2D636F6C6F723A20236630663066303B0D0A7D0D0A2E612D4952522D686561646572207B0D0A20206261636B67726F756E642D636F6C6F723A20236661666166613B0D0A2020626F726465722D746F703A2031707820736F';
wwv_flow_api.g_varchar2_table(571) := '6C696420236536653665363B0D0A2020626F782D736861646F773A20696E7365742031707820302030203020236536653665363B0D0A7D0D0A2E612D4952522D6865616465723A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20';
wwv_flow_api.g_varchar2_table(572) := '236632663266323B0D0A7D0D0A2E612D4952522D6865616465722E69732D6163746976652061207B0D0A2020636F6C6F723A20696E68657269743B0D0A7D0D0A2E612D4952522D6865616465722E69732D616374697665202E612D4952522D6865616465';
wwv_flow_api.g_varchar2_table(573) := '72536F7274207B0D0A2020636F6C6F723A20696E68657269743B0D0A7D0D0A2E612D4952522D6865616465722E69732D6163746976652C0D0A2E612D47562D6865616465722E69732D616374697665207B0D0A20206261636B67726F756E642D636F6C6F';
wwv_flow_api.g_varchar2_table(574) := '723A20233230323032303B0D0A2020636F6C6F723A20234646463B0D0A7D0D0A2E612D4952522D6865616465722D2D67726F7570207B0D0A20206261636B67726F756E642D636F6C6F723A20236635663566353B0D0A7D0D0A2E612D4952522D7461626C';
wwv_flow_api.g_varchar2_table(575) := '65207472207464207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E612D4952522D7461626C65207B0D0A2020626F726465722D636F6C6C617073653A207365';
wwv_flow_api.g_varchar2_table(576) := '7061726174653B0D0A7D0D0A2E612D4952522D7461626C652074723A686F766572207464207B0D0A20206261636B67726F756E642D636F6C6F723A20236639663966393B0D0A7D0D0A2E742D4952522D726567696F6E2D2D6E6F426F7264657273202E61';
wwv_flow_api.g_varchar2_table(577) := '2D495252207B0D0A2020626F726465722D7261646975733A203270783B0D0A7D0D0A2E612D4952522D7461626C65207464207B0D0A2020626F726465722D6C6566743A2031707820736F6C696420236632663266323B0D0A2020626F726465722D746F70';
wwv_flow_api.g_varchar2_table(578) := '3A2031707820736F6C696420236632663266323B0D0A7D0D0A2E612D4952522D6865616465724C696E6B3A666F637573207B0D0A2020626F782D736861646F773A20302030203020317078202330353662626620696E7365743B0D0A7D0D0A2E612D4952';
wwv_flow_api.g_varchar2_table(579) := '522D7365617263682D6669656C643A666F637573207B0D0A2020626F726465722D636F6C6F723A20233035366262663B0D0A2020626F782D736861646F773A202D31707820302030202330353662626620696E7365742C20317078203020302023303536';
wwv_flow_api.g_varchar2_table(580) := '62626620696E7365743B0D0A7D0D0A2E612D4952522D73696E676C65526F772D6E616D652C0D0A2E612D4952522D73696E676C65526F772D76616C7565207B0D0A2020626F726465722D626F74746F6D2D636F6C6F723A20236630663066303B0D0A2020';
wwv_flow_api.g_varchar2_table(581) := '636F6C6F723A20233430343034303B0D0A7D0D0A2E612D4952522D73696E676C65526F772D76616C7565207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E612D4952522D73696E676C65526F772D726F773A';
wwv_flow_api.g_varchar2_table(582) := '686F766572202E612D4952522D73696E676C65526F772D76616C7565207B0D0A20206261636B67726F756E642D636F6C6F723A20236637663766373B0D0A7D0D0A2E612D4952522D73696E676C65526F772D6E616D65207B0D0A20206261636B67726F75';
wwv_flow_api.g_varchar2_table(583) := '6E642D636F6C6F723A20236637663766373B0D0A7D0D0A2E612D4952522D73696E676C65526F772D726F773A686F766572202E612D4952522D73696E676C65526F772D6E616D65207B0D0A20206261636B67726F756E642D636F6C6F723A202366306630';
wwv_flow_api.g_varchar2_table(584) := '66303B0D0A7D0D0A2E612D4952522D627574746F6E2E612D4952522D627574746F6E2D2D706167696E6174696F6E3A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20233035366262663B0D0A7D0D0A2E612D4952522D7265706F';
wwv_flow_api.g_varchar2_table(585) := '727453756D6D6172792D6C6162656C2C0D0A2E612D4952522D636F6E74726F6C734C6162656C207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A406D65646961206F6E6C792073637265656E20616E6420286D';
wwv_flow_api.g_varchar2_table(586) := '696E2D77696474683A20373639707829207B0D0A20202E69732D6D6178696D697A65642E742D4952522D726567696F6E202E742D6668742D7468656164202E612D4952522D686561646572207B0D0A20202020626F726465722D626F74746F6D3A203170';
wwv_flow_api.g_varchar2_table(587) := '7820736F6C696420236536653665363B0D0A20207D0D0A7D0D0A2E75692D7769646765742D636F6E74656E74202E612D4952522D69636F6E4C6973742D6C696E6B207B0D0A2020636F6C6F723A20233236323632363B0D0A20206261636B67726F756E64';
wwv_flow_api.g_varchar2_table(588) := '2D636F6C6F723A20236666666666663B0D0A7D0D0A2E612D4952522D69636F6E4C6973742D6C696E6B3A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20236637663766373B0D0A7D0D0A0D0A2E612D4952522D627574746F6E3A';
wwv_flow_api.g_varchar2_table(589) := '666F637573207B0D0A2020626F782D736861646F773A20696E68657269743B0D0A7D0D0A0D0A2E612D4952522D736F7274576964676574207B0D0A20206261636B67726F756E642D636F6C6F723A20726762612833322C2033322C2033322C20302E3935';
wwv_flow_api.g_varchar2_table(590) := '293B0D0A20202D7765626B69742D6261636B64726F702D66696C7465723A20626C757228347078293B0D0A2020636F6C6F723A20234646463B0D0A2020626F726465722D77696474683A20303B0D0A2020626F782D736861646F773A2030203270782034';
wwv_flow_api.g_varchar2_table(591) := '7078202D327078207267626128302C20302C20302C20302E35292C2030203870782031367078202D347078207267626128302C20302C20302C20302E3135293B0D0A2020626F726465722D626F74746F6D2D6C6566742D7261646975733A203270783B0D';
wwv_flow_api.g_varchar2_table(592) := '0A2020626F726465722D626F74746F6D2D72696768742D7261646975733A203270783B0D0A2020626F782D736861646F773A2030203870782031367078207267626128302C20302C20302C20302E3235292C20302030203020317078207267626128302C';
wwv_flow_api.g_varchar2_table(593) := '20302C20302C20302E31293B0D0A7D0D0A2E612D4952522D736F7274576964676574203A3A2D7765626B69742D7363726F6C6C626172207B0D0A202077696474683A203870783B0D0A20206865696768743A203870783B0D0A7D0D0A2E612D4952522D73';
wwv_flow_api.g_varchar2_table(594) := '6F7274576964676574203A3A2D7765626B69742D7363726F6C6C6261722D7468756D62207B0D0A20206261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E35293B0D0A7D0D0A2E612D4952522D736F7274';
wwv_flow_api.g_varchar2_table(595) := '576964676574203A3A2D7765626B69742D7363726F6C6C6261722D747261636B207B0D0A20206261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E3235293B0D0A7D0D0A0D0A2E612D4952522D736F7274';
wwv_flow_api.g_varchar2_table(596) := '5769646765742D68656C70207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A0D0A2E612D4952522D736F72745769646765742D616374696F6E73207B0D0A202070616464696E673A203870783B0D0A';
wwv_flow_api.g_varchar2_table(597) := '2020626F726465722D7261646975733A203270783B0D0A202077696474683A206175746F3B0D0A2020626F726465722D626F74746F6D2D77696474683A20303B0D0A7D0D0A2E612D4952522D736F72745769646765742D616374696F6E732D6974656D20';
wwv_flow_api.g_varchar2_table(598) := '7B0D0A2020626F726465722D72696768742D77696474683A20303B0D0A7D0D0A2E612D4952522D627574746F6E2E612D4952522D736F72745769646765742D627574746F6E207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E737061';
wwv_flow_api.g_varchar2_table(599) := '72656E743B0D0A2020636F6C6F723A20234646463B0D0A2020626F726465722D7261646975733A203270783B0D0A7D0D0A2E612D4952522D627574746F6E2E612D4952522D736F72745769646765742D627574746F6E3A686F766572207B0D0A20206261';
wwv_flow_api.g_varchar2_table(600) := '636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E35293B0D0A7D0D0A2E612D4952522D627574746F6E2E612D4952522D736F72745769646765742D627574746F6E3A666F637573207B0D0A2020626F782D736861646F773A';
wwv_flow_api.g_varchar2_table(601) := '20302030203020317078202330353662626620696E7365743B0D0A7D0D0A2E612D4952522D627574746F6E2E612D4952522D736F72745769646765742D627574746F6E2E69732D6163746976652C0D0A2E612D4952522D627574746F6E2E612D4952522D';
wwv_flow_api.g_varchar2_table(602) := '736F72745769646765742D627574746F6E3A6163746976653A666F637573207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E35293B0D0A7D0D0A2E612D4952522D736F72745769646765742D73656172';
wwv_flow_api.g_varchar2_table(603) := '63684C6162656C207B0D0A20206865696768743A20343070783B0D0A202070616464696E673A2031327078203870783B0D0A7D0D0A2E612D4952522D736F72745769646765742D7365617263684C6162656C3A6265666F7265207B0D0A2020636F6C6F72';
wwv_flow_api.g_varchar2_table(604) := '3A20234646463B0D0A7D0D0A2E612D4952522D736F72745769646765742D736561726368203E202E612D4952522D736F72745769646765742D7365617263684669656C645B747970653D2274657874225D207B0D0A2020617070656172616E63653A206E';
wwv_flow_api.g_varchar2_table(605) := '6F6E653B0D0A20206261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E31293B0D0A20206865696768743A20343070783B0D0A2020636F6C6F723A20234646463B0D0A7D0D0A2E612D4952522D736F7274';
wwv_flow_api.g_varchar2_table(606) := '5769646765742D736561726368203E202E612D4952522D736F72745769646765742D7365617263684669656C645B747970653D2274657874225D3A666F637573207B0D0A2020626F782D736861646F773A20302030203020317078202330353662626620';
wwv_flow_api.g_varchar2_table(607) := '696E7365743B0D0A7D0D0A2E612D4952522D736F72745769646765742D726F7773207B0D0A2020626F726465722D746F702D77696474683A20303B0D0A7D0D0A2E612D4952522D736F72745769646765742D726F77207B0D0A2020636F6C6F723A202346';
wwv_flow_api.g_varchar2_table(608) := '46463B0D0A2020626F782D736861646F773A206E6F6E653B0D0A7D0D0A2E612D4952522D736F72745769646765742D726F773A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20';
wwv_flow_api.g_varchar2_table(609) := '302E3135293B0D0A7D0D0A2E612D4952522D736F72745769646765742D726F773A666F637573207B0D0A2020626F782D736861646F773A20302030203020317078202330353662626620696E7365743B0D0A7D0D0A2E612D4947202E612D4952522D736F';
wwv_flow_api.g_varchar2_table(610) := '72745769646765743A6265666F7265207B0D0A2020636F6C6F723A20726762612833322C2033322C2033322C20302E3935293B0D0A7D0D0A2E6F6A2D6476742D63617465676F727931207B0D0A2020636F6C6F723A20233330396664623B0D0A7D0D0A2E';
wwv_flow_api.g_varchar2_table(611) := '6F6A2D6476742D63617465676F727932207B0D0A2020636F6C6F723A20233363616638353B0D0A7D0D0A2E6F6A2D6476742D63617465676F727933207B0D0A2020636F6C6F723A20236662636534613B0D0A7D0D0A2E6F6A2D6476742D63617465676F72';
wwv_flow_api.g_varchar2_table(612) := '7934207B0D0A2020636F6C6F723A20236539356235343B0D0A7D0D0A2E6F6A2D6476742D63617465676F727935207B0D0A2020636F6C6F723A20233835346539623B0D0A7D0D0A2E6F6A2D6476742D63617465676F727936207B0D0A2020636F6C6F723A';
wwv_flow_api.g_varchar2_table(613) := '20233265626662633B0D0A7D0D0A2E6F6A2D6476742D63617465676F727937207B0D0A2020636F6C6F723A20236564383133653B0D0A7D0D0A2E6F6A2D6476742D63617465676F727938207B0D0A2020636F6C6F723A20236538356438383B0D0A7D0D0A';
wwv_flow_api.g_varchar2_table(614) := '2E6F6A2D6476742D63617465676F727939207B0D0A2020636F6C6F723A20233133623663663B0D0A7D0D0A2E6F6A2D6476742D63617465676F72793130207B0D0A2020636F6C6F723A20233831626235663B0D0A7D0D0A2E6F6A2D6476742D6361746567';
wwv_flow_api.g_varchar2_table(615) := '6F72793131207B0D0A2020636F6C6F723A20236361353839643B0D0A7D0D0A2E6F6A2D6476742D63617465676F72793132207B0D0A2020636F6C6F723A20236464646535333B0D0A7D0D0A0D0A2E742D4C696E6B734C6973742D6974656D2C0D0A2E742D';
wwv_flow_api.g_varchar2_table(616) := '4C696E6B734C6973742D6C696E6B207B0D0A2020626F726465722D636F6C6F723A20236536653665363B0D0A7D0D0A2E742D4C696E6B734C6973742D69636F6E207B0D0A2020636F6C6F723A20236439643964393B0D0A7D0D0A2E742D4C696E6B734C69';
wwv_flow_api.g_varchar2_table(617) := '73742D6C696E6B3A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20236632663266323B0D0A7D0D0A2E742D4C696E6B734C6973742D6C696E6B3A666F637573207B0D0A2020626F782D736861646F773A20302030203020317078';
wwv_flow_api.g_varchar2_table(618) := '202330353662626620696E7365743B0D0A7D0D0A0D0A2E742D4C696E6B734C6973742D2D73686F774172726F77202E742D4C696E6B734C6973742D6C696E6B3A6265666F7265207B0D0A2020636F6C6F723A20236439643964393B0D0A7D0D0A0D0A2E74';
wwv_flow_api.g_varchar2_table(619) := '2D4C696E6B734C6973742D2D73686F774261646765202E742D4C696E6B734C6973742D6261646765207B0D0A20206261636B67726F756E642D636F6C6F723A20236635663566353B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D4C';
wwv_flow_api.g_varchar2_table(620) := '696E6B734C6973742D2D73686F774261646765202E742D4C696E6B734C6973742D6C696E6B3A686F766572202E742D4C696E6B734C6973742D6261646765207B0D0A20206261636B67726F756E642D636F6C6F723A20236562656265623B0D0A7D0D0A2E';
wwv_flow_api.g_varchar2_table(621) := '742D4C696E6B734C6973742D2D73686F774261646765202E742D4C696E6B734C6973742D6974656D2E69732D657870616E646564203E202E742D4C696E6B734C6973742D6C696E6B202E742D4C696E6B734C6973742D6261646765207B0D0A2020626163';
wwv_flow_api.g_varchar2_table(622) := '6B67726F756E642D636F6C6F723A20236266626662663B0D0A7D0D0A0D0A2E742D4C696E6B734C6973742D2D627269676874486F766572202E742D4C696E6B734C6973742D6974656D2E69732D657870616E646564202E742D4C696E6B734C6973742D6C';
wwv_flow_api.g_varchar2_table(623) := '696E6B3A686F7665723A6265666F7265207B0D0A2020636F6C6F723A2072676261283235352C203235352C203235352C20302E35293B0D0A7D0D0A2E742D4C696E6B734C6973742D2D627269676874486F766572202E742D4C696E6B734C6973742D6C69';
wwv_flow_api.g_varchar2_table(624) := '6E6B3A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20233332333333363B0D0A2020636F6C6F723A20236633663366343B0D0A7D0D0A2E742D4C696E6B734C6973742D2D627269676874486F766572202E742D4C696E6B734C69';
wwv_flow_api.g_varchar2_table(625) := '73742D6C696E6B3A686F766572202E742D4C696E6B734C6973742D69636F6E207B0D0A2020636F6C6F723A2072676261283235352C203235352C203235352C20302E3735293B0D0A7D0D0A2E742D4C696E6B734C6973742D6974656D2E69732D65787061';
wwv_flow_api.g_varchar2_table(626) := '6E646564207B0D0A20206261636B67726F756E642D636F6C6F723A20234643464346433B0D0A20206261636B67726F756E643A206C696E6561722D6772616469656E74287267626128302C20302C20302C20302E303135292C207267626128302C20302C';
wwv_flow_api.g_varchar2_table(627) := '20302C203029292C206C696E6561722D6772616469656E74287267626128302C20302C20302C2030292C207267626128302C20302C20302C20302E30313529293B0D0A7D0D0A2E742D4C696E6B734C6973742D6974656D2E69732D657870616E64656420';
wwv_flow_api.g_varchar2_table(628) := '2E742D4C696E6B734C6973742D6C696E6B3A686F7665723A6265666F7265207B0D0A2020636F6C6F723A20233332333333363B0D0A7D0D0A2E742D4C696E6B734C6973742D6974656D2E69732D657870616E646564202E742D4C696E6B734C6973742D6C';
wwv_flow_api.g_varchar2_table(629) := '696E6B3A6265666F7265207B0D0A2020636F6C6F723A207267626128302C20302C20302C20302E3235293B0D0A7D0D0A2E742D4C696E6B734C6973742D2D73686F774261646765202E742D4C696E6B734C6973742D6261646765207B0D0A2020626F7264';
wwv_flow_api.g_varchar2_table(630) := '65722D7261646975733A203470783B0D0A7D0D0A2E742D4C696E6B734C6973742D2D69636F6E4F6E6C79202E742D4C696E6B734C6973742D69636F6E207B0D0A2020626F726465722D7261646975733A20313030253B0D0A7D0D0A2E742D4C696E6B734C';
wwv_flow_api.g_varchar2_table(631) := '6973742D2D616374696F6E73202E742D4C696E6B734C6973742D6C6162656C207B0D0A2020636F6C6F723A20233162316231623B0D0A7D0D0A2E742D4C696E6B734C6973742D2D616374696F6E73202E742D4C696E6B734C6973742D69636F6E207B0D0A';
wwv_flow_api.g_varchar2_table(632) := '2020636F6C6F723A20233162316231623B0D0A7D0D0A2E742D4C696E6B734C6973742D2D616374696F6E73202E742D4C696E6B734C6973742D6C696E6B3A686F766572202E742D4C696E6B734C6973742D69636F6E2C0D0A2E742D4C696E6B734C697374';
wwv_flow_api.g_varchar2_table(633) := '2D2D616374696F6E73202E742D4C696E6B734C6973742D6C696E6B3A686F766572202E742D4C696E6B734C6973742D6C6162656C2C0D0A2E742D4C696E6B734C6973742D2D616374696F6E73202E742D4C696E6B734C6973742D6C696E6B3A686F766572';
wwv_flow_api.g_varchar2_table(634) := '202E742D4C696E6B734C6973742D6261646765207B0D0A2020636F6C6F723A20233339333933393B0D0A7D0D0A2E742D426F64792D616374696F6E73202E742D4C696E6B734C6973742D6C696E6B3A686F766572207B0D0A20206261636B67726F756E64';
wwv_flow_api.g_varchar2_table(635) := '2D636F6C6F723A20236537653765373B0D0A7D0D0A0D0A2E742D4C6F67696E2D69636F6E56616C69646174696F6E207B0D0A20206261636B67726F756E643A20233362616132633B0D0A2020636F6C6F723A2077686974653B0D0A7D0D0A626F6479202E';
wwv_flow_api.g_varchar2_table(636) := '742D4C6F67696E2D7469746C65207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D4C6F67696E2D726567696F6E207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E742D4C6F67696E2D';
wwv_flow_api.g_varchar2_table(637) := '6C6F676F207B0D0A2020636F6C6F723A20233332333333363B0D0A7D0D0A406D65646961206F6E6C792073637265656E20616E6420286D61782D77696474683A20343830707829207B0D0A20202E742D50616765426F64792D2D6C6F67696E2C0D0A2020';
wwv_flow_api.g_varchar2_table(638) := '2E742D50616765426F64792D2D6C6F67696E202E742D426F6479207B0D0A202020206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A20207D0D0A7D0D0A0D0A2E742D4D656469614C697374207B0D0A2020626F726465722D636F6C';
wwv_flow_api.g_varchar2_table(639) := '6F723A20236530653065303B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E742D4D656469614C6973742D6974656D207B0D0A2020626F726465722D636F6C6F723A20236530653065303B0D0A7D0D0A2E742D';
wwv_flow_api.g_varchar2_table(640) := '4D656469614C6973742D6974656D2E69732D616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3035293B0D0A7D0D0A2E742D4D656469614C6973742D2D686F72697A6F6E74616C202E74';
wwv_flow_api.g_varchar2_table(641) := '2D4D656469614C6973742D6974656D207B0D0A2020626F726465722D72696768743A2031707820736F6C696420236530653065303B0D0A7D0D0A0D0A612E742D4D656469614C6973742D6974656D57726170207B0D0A2020636F6C6F723A202330353662';
wwv_flow_api.g_varchar2_table(642) := '62663B0D0A7D0D0A612E742D4D656469614C6973742D6974656D577261703A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20236661666166613B0D0A2020636F6C6F723A20233035366262663B0D0A7D0D0A612E742D4D656469';
wwv_flow_api.g_varchar2_table(643) := '614C6973742D6974656D577261703A666F637573207B0D0A2020626F782D736861646F773A20302030203020317078202330353662626620696E7365743B0D0A7D0D0A2E742D4D656469614C6973742D6974656D57726170207B0D0A2020636F6C6F723A';
wwv_flow_api.g_varchar2_table(644) := '20233236323632363B0D0A7D0D0A2E742D4D656469614C6973742D62616467652C0D0A2E742D4D656469614C6973742D64657363207B0D0A2020636F6C6F723A20233733373337333B0D0A7D0D0A2E742D4D656469614C6973742D69636F6E207B0D0A20';
wwv_flow_api.g_varchar2_table(645) := '206261636B67726F756E642D636F6C6F723A20233332333333363B0D0A2020636F6C6F723A20236633663366343B0D0A7D0D0A2E742D4D656469614C6973742D2D636F6C73207B0D0A2020626F782D736861646F773A202D317078202D31707820302030';
wwv_flow_api.g_varchar2_table(646) := '202365306530653020696E7365743B0D0A7D0D0A2E742D4D656469614C6973742D2D636F6C73202E742D4D656469614C6973742D6974656D3A6265666F72652C0D0A2E742D4D656469614C6973742D2D636F6C73202E742D4D656469614C6973742D6974';
wwv_flow_api.g_varchar2_table(647) := '656D3A6166746572207B0D0A20206261636B67726F756E642D636F6C6F723A20236536653665363B0D0A7D0D0A0D0A2E612D4D656E752D636F6E74656E74207B0D0A2020626F726465722D7261646975733A203270783B0D0A20206261636B67726F756E';
wwv_flow_api.g_varchar2_table(648) := '642D636F6C6F723A20236666666666663B0D0A2020626F726465722D77696474683A20303B0D0A2020626F782D736861646F773A2030203870782031367078207267626128302C20302C20302C20302E3235292C20302030203020317078207267626128';
wwv_flow_api.g_varchar2_table(649) := '302C20302C20302C20302E31293B0D0A202070616464696E673A2038707820303B0D0A7D0D0A2E612D4D656E752D636F6E74656E74202E612D4D656E752D7363726F6C6C42746E2D2D646F776E2C0D0A2E612D4D656E752D636F6E74656E74202E612D4D';
wwv_flow_api.g_varchar2_table(650) := '656E752D7363726F6C6C42746E2D2D7570207B0D0A20206261636B67726F756E642D636F6C6F723A20236637663766373B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E612D4D656E75207B0D0A20206D696E2D77696474683A20313630';
wwv_flow_api.g_varchar2_table(651) := '70783B0D0A7D0D0A2E612D4D656E75202E612D4D656E752D6974656D207B0D0A20206C696E652D6865696768743A20333670783B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E612D4D656E75202E612D4D656E752D6974656D203E202E';
wwv_flow_api.g_varchar2_table(652) := '612D4D656E752D696E6E6572202E612D4D656E752D616363656C2C0D0A2E612D4D656E75202E612D4D656E752D6974656D203E202E612D4D656E752D696E6E6572202E612D4D656E752D7375624D656E75436F6C207B0D0A20206F7061636974793A202E';
wwv_flow_api.g_varchar2_table(653) := '38353B0D0A7D0D0A2E612D4D656E75202E612D4D656E752D6974656D2E69732D666F63757365642C0D0A2E612D4D656E75202E612D4D656E752D6974656D2E69732D657870616E646564207B0D0A2020636F6C6F723A20236633663366343B0D0A202062';
wwv_flow_api.g_varchar2_table(654) := '61636B67726F756E642D636F6C6F723A20233332333333363B0D0A7D0D0A2E612D4D656E75202E612D4D656E752D6974656D2E69732D64697361626C65642E69732D666F6375736564207B0D0A2020636F6C6F723A20726762612833382C2033382C2033';
wwv_flow_api.g_varchar2_table(655) := '382C20302E35293B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E612D4D656E75202E612D4D656E752D6974656D2E69732D64697361626C65642E69732D666F6375736564203E202E612D4D656E752D696E6E';
wwv_flow_api.g_varchar2_table(656) := '6572202E612D4D656E752D616363656C207B0D0A20206F7061636974793A202E353B0D0A7D0D0A2E612D4D656E75202E612D4D656E752D6974656D202E612D4D656E752D7375624D656E75436F6C207B0D0A20206865696768743A20333670783B0D0A20';
wwv_flow_api.g_varchar2_table(657) := '2070616464696E673A203130707820347078203130707820303B0D0A7D0D0A2E612D4D656E75202E612D4D656E752D6974656D202E612D4D656E752D737461747573436F6C207B0D0A202070616464696E673A2031307078203870783B0D0A7D0D0A2E61';
wwv_flow_api.g_varchar2_table(658) := '2D4D656E752D68536570617261746F72207B0D0A2020626F726465722D636F6C6F723A20726762612833382C2033382C2033382C20302E31293B0D0A20206D617267696E2D746F703A203470783B0D0A202070616464696E672D746F703A203270783B0D';
wwv_flow_api.g_varchar2_table(659) := '0A202070616464696E672D626F74746F6D3A203270783B0D0A7D0D0A0D0A2E612D4D656E75426172202E612D4D656E752D636F6E74656E74207B0D0A20206261636B67726F756E642D636C69703A2070616464696E672D626F783B0D0A2020626F782D73';
wwv_flow_api.g_varchar2_table(660) := '6861646F773A2030203870782031367078207267626128302C20302C20302C20302E3235293B0D0A2020626F726465722D636F6C6F723A207267626128302C20302C20302C20302E31293B0D0A2020626F726465722D77696474683A203170783B0D0A7D';
wwv_flow_api.g_varchar2_table(661) := '0D0A0D0A2E612D4D656E754261722D6C6162656C207B0D0A2020646973706C61793A20696E6C696E652D626C6F636B3B0D0A2020666F6E742D73697A653A20312E3472656D3B0D0A20206C696E652D6865696768743A20312E3672656D3B0D0A20207061';
wwv_flow_api.g_varchar2_table(662) := '6464696E673A20313270783B0D0A2020746578742D6465636F726174696F6E3A206E6F6E653B0D0A2020666C65782D67726F773A20313B0D0A7D0D0A2E612D4D656E754261722D6C6162656C3A686F766572207B0D0A20206261636B67726F756E642D63';
wwv_flow_api.g_varchar2_table(663) := '6C69703A2070616464696E672D626F783B0D0A2020746578742D6465636F726174696F6E3A206E6F6E653B0D0A7D0D0A2E612D4D656E754261722D6C6162656C202B202E612D4D656E752D7375624D656E75436F6C207B0D0A2020666C65782D73687269';
wwv_flow_api.g_varchar2_table(664) := '6E6B3A20303B0D0A2020616C69676E2D73656C663A2063656E7465723B0D0A20206C696E652D6865696768743A20313B0D0A7D0D0A2E612D4D656E754261722D6974656D207B0D0A2020646973706C61793A20666C65783B0D0A2020666C6F61743A206C';
wwv_flow_api.g_varchar2_table(665) := '6566743B0D0A202070616464696E673A20303B0D0A2020626F726465722D77696474683A2030203170783B0D0A2020626F782D736861646F773A206E6F6E653B0D0A20206D617267696E2D6C6566743A20303B0D0A20206261636B67726F756E642D636C';
wwv_flow_api.g_varchar2_table(666) := '69703A20636F6E74656E742D626F783B0D0A20200D0A20200D0A20200D0A20200D0A7D0D0A2E752D52544C202E612D4D656E754261722D6974656D207B0D0A2020666C6F61743A2072696768743B0D0A7D0D0A2E612D4D656E754261722D6974656D2E69';
wwv_flow_api.g_varchar2_table(667) := '732D657870616E646564207B0D0A20206F75746C696E653A206E6F6E653B0D0A7D0D0A2E612D4D656E754261722D6974656D3A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A2E612D';
wwv_flow_api.g_varchar2_table(668) := '4D656E754261722D6974656D3A66697273742D6368696C64207B0D0A2020626F726465722D6C6566742D77696474683A20303B0D0A7D0D0A2E752D52544C202E612D4D656E754261722D6974656D3A66697273742D6368696C64207B0D0A2020626F7264';
wwv_flow_api.g_varchar2_table(669) := '65722D72696768742D77696474683A20303B0D0A2020626F726465722D6C6566742D77696474683A203170783B0D0A7D0D0A2E612D4D656E754261722D6974656D2E69732D666F6375736564207B0D0A2020626F782D736861646F773A206E6F6E653B0D';
wwv_flow_api.g_varchar2_table(670) := '0A7D0D0A2E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E74202E612D4D656E754261722D6C6162656C207B0D0A2020666F6E742D7765696768743A20626F6C643B0D0A7D0D0A2E612D4D656E754261722D6974656D203E202E';
wwv_flow_api.g_varchar2_table(671) := '612D4D656E752D7375624D656E75436F6C2C0D0A2E612D4D656E754261722D6974656D2E612D4D656E752D2D73706C6974203E202E612D4D656E752D7375624D656E75436F6C207B0D0A2020626F726465722D77696474683A20303B0D0A202070616464';
wwv_flow_api.g_varchar2_table(672) := '696E673A20302031327078203020303B0D0A7D0D0A2E752D52544C202E612D4D656E754261722D6974656D203E202E612D4D656E752D7375624D656E75436F6C2C0D0A2E752D52544C202E612D4D656E754261722D6974656D2E612D4D656E752D2D7370';
wwv_flow_api.g_varchar2_table(673) := '6C6974203E202E612D4D656E752D7375624D656E75436F6C207B0D0A202070616464696E672D72696768743A20303B0D0A202070616464696E672D6C6566743A20313270783B0D0A2020626F726465722D72696768743A20302021696D706F7274616E74';
wwv_flow_api.g_varchar2_table(674) := '3B0D0A7D0D0A2E612D4D656E754261722D6974656D203E202E612D4D656E752D7375624D656E75436F6C202E612D49636F6E207B0D0A2020626F726465722D7261646975733A2031322E35253B0D0A7D0D0A2E612D4D656E754261722D6974656D203E20';
wwv_flow_api.g_varchar2_table(675) := '2E612D4D656E752D7375624D656E75436F6C202E612D49636F6E3A6265666F7265207B0D0A2020636F6E74656E743A20275C65306332273B0D0A7D0D0A2E612D4D656E754261722D6974656D203E20627574746F6E202B202E612D4D656E752D7375624D';
wwv_flow_api.g_varchar2_table(676) := '656E75436F6C207B0D0A20200D0A20206D617267696E2D6C6566743A202D3670783B0D0A7D0D0A2E752D52544C202E612D4D656E754261722D6974656D203E20627574746F6E202B202E612D4D656E752D7375624D656E75436F6C207B0D0A20206D6172';
wwv_flow_api.g_varchar2_table(677) := '67696E2D6C6566743A20303B0D0A20206D617267696E2D72696768743A202D3670783B0D0A7D0D0A0D0A2E742D4865616465722D6E61762D6C697374207B0D0A20206261636B67726F756E642D636F6C6F723A20233332333333363B0D0A7D0D0A2E742D';
wwv_flow_api.g_varchar2_table(678) := '4865616465722D6E6176202E612D4D656E754261722D6C6162656C207B0D0A2020636F6C6F723A20236464646464643B0D0A7D0D0A2E742D4865616465722D6E6176202E742D4D656E752D6261646765207B0D0A202070616464696E673A203020367078';
wwv_flow_api.g_varchar2_table(679) := '3B0D0A2020666F6E742D73697A653A20313170783B0D0A20206C696E652D6865696768743A20696E68657269743B0D0A2020666F6E742D7765696768743A203530303B0D0A20206261636B67726F756E642D636F6C6F723A20233332333333363B0D0A20';
wwv_flow_api.g_varchar2_table(680) := '20636F6C6F723A20236633663366343B0D0A2020646973706C61793A20696E6C696E652D626C6F636B3B0D0A2020766572746963616C2D616C69676E3A20746F703B0D0A20206D617267696E2D6C6566743A203470783B0D0A2020626F726465722D7261';
wwv_flow_api.g_varchar2_table(681) := '646975733A20313670783B0D0A7D0D0A2E752D52544C202E742D4865616465722D6E6176202E742D4D656E752D6261646765207B0D0A20206D617267696E2D6C6566743A20303B0D0A20206D617267696E2D72696768743A203470783B0D0A7D0D0A2E74';
wwv_flow_api.g_varchar2_table(682) := '2D4865616465722D6E6176202E612D4D656E754261722D6974656D207B0D0A20200D0A2020626F726465722D636F6C6F723A20233431343234353B0D0A20200D0A20200D0A20200D0A7D0D0A2E742D4865616465722D6E6176202E612D4D656E75426172';
wwv_flow_api.g_varchar2_table(683) := '2D6974656D2E69732D666F6375736564207B0D0A20206261636B67726F756E642D636F6C6F723A20233233323332373B0D0A7D0D0A2E742D4865616465722D6E6176202E612D4D656E754261722D6974656D2E69732D666F6375736564202E612D4D656E';
wwv_flow_api.g_varchar2_table(684) := '754261722D6C6162656C207B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D4865616465722D6E6176202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E742C0D0A2E742D4865616465722D6E6176202E61';
wwv_flow_api.g_varchar2_table(685) := '2D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E742E69732D666F63757365642C0D0A2E742D4865616465722D6E6176202E612D4D656E754261722D6974656D2E69732D657870616E6465642C0D0A2E742D4865616465722D6E6176';
wwv_flow_api.g_varchar2_table(686) := '202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E742E69732D657870616E646564207B0D0A20206261636B67726F756E642D636F6C6F723A20233163316331663B0D0A7D0D0A2E742D4865616465722D6E6176202E612D4D65';
wwv_flow_api.g_varchar2_table(687) := '6E754261722D6974656D2E612D4D656E752D2D63757272656E74202E612D4D656E754261722D6C6162656C2C0D0A2E742D4865616465722D6E6176202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E742E69732D666F637573';
wwv_flow_api.g_varchar2_table(688) := '6564202E612D4D656E754261722D6C6162656C2C0D0A2E742D4865616465722D6E6176202E612D4D656E754261722D6974656D2E69732D657870616E646564202E612D4D656E754261722D6C6162656C2C0D0A2E742D4865616465722D6E6176202E612D';
wwv_flow_api.g_varchar2_table(689) := '4D656E754261722D6974656D2E612D4D656E752D2D63757272656E742E69732D657870616E646564202E612D4D656E754261722D6C6162656C207B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D4865616465722D6E6176202E612D';
wwv_flow_api.g_varchar2_table(690) := '4D656E754261722D6974656D203E202E612D4D656E752D7375624D656E75436F6C202E612D49636F6E207B0D0A2020636F6C6F723A2072676261283235352C203235352C203235352C20302E38293B0D0A7D0D0A2E742D4865616465722D6E6176202E61';
wwv_flow_api.g_varchar2_table(691) := '2D4D656E754261722D6974656D2E612D4D656E752D2D73706C6974203E202E612D4D656E752D7375624D656E75436F6C3A686F766572202E612D49636F6E2C0D0A2E742D4865616465722D6E6176202E612D4D656E754261722D6974656D2E69732D666F';
wwv_flow_api.g_varchar2_table(692) := '6375736564203E20627574746F6E202B202E612D4D656E752D7375624D656E75436F6C202E612D49636F6E207B0D0A20200D0A20206261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E3135293B0D0A7D';
wwv_flow_api.g_varchar2_table(693) := '0D0A2E742D4865616465722D6E6176202E612D4D656E754261722D6974656D2E69732D657870616E646564203E202E612D4D656E752D7375624D656E75436F6C202E612D49636F6E2C0D0A2E742D4865616465722D6E6176202E612D4D656E754261722D';
wwv_flow_api.g_varchar2_table(694) := '6974656D2E69732D657870616E646564203E202E612D4D656E752D7375624D656E75436F6C3A686F766572202E612D49636F6E207B0D0A20206261636B67726F756E642D636F6C6F723A20233332333333363B0D0A2020626F726465722D636F6C6F723A';
wwv_flow_api.g_varchar2_table(695) := '20233332333333363B0D0A2020636F6C6F723A20236633663366343B0D0A7D0D0A0D0A2E742D4D656E75426172207B0D0A20206261636B67726F756E642D636F6C6F723A20236638663866383B0D0A7D0D0A2E742D4D656E75426172202E612D4D656E75';
wwv_flow_api.g_varchar2_table(696) := '4261722D6C6162656C207B0D0A2020636F6C6F723A20233338333833383B0D0A7D0D0A2E742D4D656E75426172202E612D4D656E754261722D6974656D207B0D0A20200D0A2020626F726465722D636F6C6F723A20236534653465343B0D0A20200D0A20';
wwv_flow_api.g_varchar2_table(697) := '200D0A20200D0A7D0D0A2E742D4D656E75426172202E612D4D656E754261722D6974656D2E69732D666F6375736564207B0D0A20206261636B67726F756E642D636F6C6F723A20236630663066303B0D0A7D0D0A2E742D4D656E75426172202E612D4D65';
wwv_flow_api.g_varchar2_table(698) := '6E754261722D6974656D2E612D4D656E752D2D63757272656E742C0D0A2E742D4D656E75426172202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E742E69732D666F63757365642C0D0A2E742D4D656E75426172202E612D4D';
wwv_flow_api.g_varchar2_table(699) := '656E754261722D6974656D2E69732D657870616E6465642C0D0A2E742D4D656E75426172202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E742E69732D657870616E646564207B0D0A20206261636B67726F756E642D636F6C';
wwv_flow_api.g_varchar2_table(700) := '6F723A20233332333333363B0D0A7D0D0A2E742D4D656E75426172202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E74202E612D4D656E754261722D6C6162656C2C0D0A2E742D4D656E75426172202E612D4D656E75426172';
wwv_flow_api.g_varchar2_table(701) := '2D6974656D2E612D4D656E752D2D63757272656E742E69732D666F6375736564202E612D4D656E754261722D6C6162656C2C0D0A2E742D4D656E75426172202E612D4D656E754261722D6974656D2E69732D657870616E646564202E612D4D656E754261';
wwv_flow_api.g_varchar2_table(702) := '722D6C6162656C2C0D0A2E742D4D656E75426172202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E742E69732D657870616E646564202E612D4D656E754261722D6C6162656C207B0D0A2020636F6C6F723A20236633663366';
wwv_flow_api.g_varchar2_table(703) := '343B0D0A7D0D0A2E742D4D656E75426172202E612D4D656E754261722D6974656D203E202E612D4D656E752D7375624D656E75436F6C202E612D49636F6E207B0D0A2020636F6C6F723A20726762612835362C2035362C2035362C20302E38293B0D0A7D';
wwv_flow_api.g_varchar2_table(704) := '0D0A2E742D4D656E75426172202E612D4D656E754261722D6974656D2E612D4D656E752D2D73706C6974203E202E612D4D656E752D7375624D656E75436F6C3A686F766572202E612D49636F6E2C0D0A2E742D4D656E75426172202E612D4D656E754261';
wwv_flow_api.g_varchar2_table(705) := '722D6974656D2E69732D666F6375736564203E20627574746F6E202B202E612D4D656E752D7375624D656E75436F6C202E612D49636F6E207B0D0A20200D0A20206261636B67726F756E642D636F6C6F723A20726762612835362C2035362C2035362C20';
wwv_flow_api.g_varchar2_table(706) := '302E3135293B0D0A7D0D0A2E742D4D656E75426172202E612D4D656E754261722D6974656D2E69732D657870616E646564203E202E612D4D656E752D7375624D656E75436F6C202E612D49636F6E2C0D0A2E742D4D656E75426172202E612D4D656E7542';
wwv_flow_api.g_varchar2_table(707) := '61722D6974656D2E69732D657870616E646564203E202E612D4D656E752D7375624D656E75436F6C3A686F766572202E612D49636F6E207B0D0A20206261636B67726F756E642D636F6C6F723A20236633663366343B0D0A2020626F726465722D636F6C';
wwv_flow_api.g_varchar2_table(708) := '6F723A20236633663366343B0D0A2020636F6C6F723A20233332333333363B0D0A7D0D0A2E742D4E617654616273207B0D0A20206261636B67726F756E642D636F6C6F723A20233332333333363B0D0A7D0D0A2E742D4E6176546162733A3A2D7765626B';
wwv_flow_api.g_varchar2_table(709) := '69742D7363726F6C6C6261722D7468756D62207B0D0A20206261636B67726F756E642D636F6C6F723A20233233323332373B0D0A2020626F782D736861646F773A20696E7365742031707820302030203020233332333333363B0D0A7D0D0A2E742D4E61';
wwv_flow_api.g_varchar2_table(710) := '76546162733A3A2D7765626B69742D7363726F6C6C6261722D7468756D623A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20233430343034373B0D0A7D0D0A2E742D4E6176546162733A3A2D7765626B69742D7363726F6C6C62';
wwv_flow_api.g_varchar2_table(711) := '61722D747261636B207B0D0A20206261636B67726F756E643A20233332333333363B0D0A7D0D0A2E742D4E6176546162733A3A2D7765626B69742D7363726F6C6C6261722D747261636B3A686F766572207B0D0A20206261636B67726F756E642D636F6C';
wwv_flow_api.g_varchar2_table(712) := '6F723A20233537353935653B0D0A7D0D0A2E742D4E6176546162732D6974656D207B0D0A2020636F6C6F723A20236464646464643B0D0A2020626F726465722D636F6C6F723A20233430343034373B0D0A7D0D0A2E742D4E6176546162732D6974656D3A';
wwv_flow_api.g_varchar2_table(713) := '686F7665722C0D0A2E742D4E6176546162732D6974656D2E69732D616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A20233163316331663B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D4E6176546162732D';
wwv_flow_api.g_varchar2_table(714) := '6261646765207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A2020636F6C6F723A20233163316331663B0D0A7D0D0A0D0A2E742D506F7075704C4F562D6C696E6B7320613A686F766572207B0D0A20206261636B6772';
wwv_flow_api.g_varchar2_table(715) := '6F756E642D636F6C6F723A20233035366262663B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D506F7075704C4F562D726573756C74735365742074723A686F766572207464207B0D0A20206261636B67726F756E642D636F6C6F72';
wwv_flow_api.g_varchar2_table(716) := '3A20234543463246422021696D706F7274616E743B0D0A7D0D0A2E742D506F7075704C4F562D726573756C74735365742074723A6E74682D6368696C6428326E29207464207B0D0A20206261636B67726F756E642D636F6C6F723A20234641464146413B';
wwv_flow_api.g_varchar2_table(717) := '0D0A7D0D0A2E742D506F7075704C4F562D726573756C74735365742D6C696E6B2C0D0A2E75692D7769646765742D636F6E74656E7420612E742D506F7075704C4F562D726573756C74735365742D6C696E6B207B0D0A2020636F6C6F723A202330353662';
wwv_flow_api.g_varchar2_table(718) := '62663B0D0A7D0D0A2E742D506167652D2D706F7075704C4F56207B0D0A20206261636B67726F756E642D636F6C6F723A20234646463B0D0A7D0D0A2E742D506F7075704C4F562D616374696F6E73207B0D0A20206261636B67726F756E642D636F6C6F72';
wwv_flow_api.g_varchar2_table(719) := '3A20236638663866383B0D0A7D0D0A2E742D426F6479202E742D506F7075704C4F562D6C696E6B732061207B0D0A2020636F6C6F723A20233339333933393B0D0A7D0D0A2E742D426F64792D7469746C65202E742D506F7075704C4F562D6C696E6B7320';
wwv_flow_api.g_varchar2_table(720) := '61207B0D0A2020636F6C6F723A20233430343034303B0D0A7D0D0A2E742D426F64792D696E666F202E742D506F7075704C4F562D6C696E6B732061207B0D0A2020636F6C6F723A20233430343034303B0D0A7D0D0A2E742D526567696F6E202E742D506F';
wwv_flow_api.g_varchar2_table(721) := '7075704C4F562D6C696E6B7320612C0D0A2E742D427574746F6E526567696F6E202E742D506F7075704C4F562D6C696E6B732061207B0D0A2020636F6C6F723A20233430343034303B0D0A7D0D0A2E742D506F7075704C4F562D6C696E6B7320613A686F';
wwv_flow_api.g_varchar2_table(722) := '766572207B0D0A20206261636B67726F756E642D636F6C6F723A20233036383766313B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D426F6479202E742D506F7075704C4F562D706167696E6174696F6E207B0D0A2020636F6C6F72';
wwv_flow_api.g_varchar2_table(723) := '3A20233739373937393B0D0A7D0D0A2E742D426F64792D7469746C65202E742D506F7075704C4F562D706167696E6174696F6E207B0D0A2020636F6C6F723A20233830383038303B0D0A7D0D0A2E742D426F64792D696E666F202E742D506F7075704C4F';
wwv_flow_api.g_varchar2_table(724) := '562D706167696E6174696F6E207B0D0A2020636F6C6F723A20233830383038303B0D0A7D0D0A2E742D526567696F6E202E742D506F7075704C4F562D706167696E6174696F6E2C0D0A2E742D427574746F6E526567696F6E202E742D506F7075704C4F56';
wwv_flow_api.g_varchar2_table(725) := '2D706167696E6174696F6E207B0D0A2020636F6C6F723A20233830383038303B0D0A7D0D0A2E612D506F7075704C4F562D736561726368426172207B0D0A202070616464696E673A203870783B0D0A7D0D0A2E612D506F7075704C4F562D726573756C74';
wwv_flow_api.g_varchar2_table(726) := '73202E612D49636F6E4C6973742D6974656D207B0D0A2020636F6C6F723A20696E68657269743B0D0A7D0D0A2E612D506F7075704C4F562D726573756C7473202E612D49636F6E4C6973742D6974656D3A686F766572207B0D0A20206261636B67726F75';
wwv_flow_api.g_varchar2_table(727) := '6E642D636F6C6F723A20233035366262663B0D0A2020636F6C6F723A20236666666666663B0D0A2020626F782D736861646F773A20302030203020317078202330343564613620696E7365743B0D0A7D0D0A2E612D506F7075704C4F562D726573756C74';
wwv_flow_api.g_varchar2_table(728) := '73202E612D49636F6E4C6973742D6974656D3A686F7665722061207B0D0A2020636F6C6F723A20696E68657269743B0D0A7D0D0A2E612D506F7075704C4F562D726573756C7473202E612D47562D6C6F61644D6F7265207B0D0A2020626F726465722D74';
wwv_flow_api.g_varchar2_table(729) := '6F702D636F6C6F723A207267626128302C20302C20302C20302E3135293B0D0A7D0D0A0D0A2E742D526567696F6E2C0D0A2E742D436F6E74656E74426C6F636B2D2D6C696768744247202E742D436F6E74656E74426C6F636B2D626F6479207B0D0A2020';
wwv_flow_api.g_varchar2_table(730) := '6261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E742D426F6479202E6669656C64646174612062207B0D0A2020636F6C6F723A20233339333933393B0D0A7D0D0A2E742D426F64792D7469746C65202E6669656C64646174';
wwv_flow_api.g_varchar2_table(731) := '612062207B0D0A2020636F6C6F723A20233430343034303B0D0A7D0D0A2E742D426F64792D696E666F202E6669656C64646174612062207B0D0A2020636F6C6F723A20233430343034303B0D0A7D0D0A2E742D526567696F6E202E6669656C6464617461';
wwv_flow_api.g_varchar2_table(732) := '20622C0D0A2E742D427574746F6E526567696F6E202E6669656C64646174612062207B0D0A2020636F6C6F723A20233430343034303B0D0A7D0D0A2E742D526567696F6E2D686561646572207B0D0A20206261636B67726F756E642D636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(733) := '6666666666663B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6E6F55492C0D0A2E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6C696E6B207B';
wwv_flow_api.g_varchar2_table(734) := '0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D426F64792D616374696F6E73202E742D526567696F6E2D686561646572207B0D0A20206261636B67726F756E643A207472616E73706172656E743B0D0A2020636F6C6F723A20233162';
wwv_flow_api.g_varchar2_table(735) := '316231623B0D0A7D0D0A2E742D526567696F6E2D2D737461636B6564207B0D0A2020626F726465722D7261646975733A20302021696D706F7274616E743B0D0A7D0D0A2E742D526567696F6E2D2D6E6F426F72646572203E202E742D526567696F6E2D68';
wwv_flow_api.g_varchar2_table(736) := '6561646572207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D526567696F6E2D2D6E6F426F72646572203E202E742D526567696F6E2D68656164657220';
wwv_flow_api.g_varchar2_table(737) := '2E742D427574746F6E2D2D6E6F55492C0D0A2E742D526567696F6E2D2D6E6F426F72646572203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6C696E6B207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A0D0A';
wwv_flow_api.g_varchar2_table(738) := '2E742D526567696F6E2D2D616363656E7431203E202E742D526567696F6E2D686561646572207B0D0A20206261636B67726F756E642D636F6C6F723A20233330396664623B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D52656769';
wwv_flow_api.g_varchar2_table(739) := '6F6E2D2D616363656E7431203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6E6F55492C0D0A2E742D526567696F6E2D2D616363656E7431203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6C69';
wwv_flow_api.g_varchar2_table(740) := '6E6B207B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D526567696F6E2D2D616363656E74312E742D526567696F6E2D2D74657874436F6E74656E74203E202E742D526567696F6E2D686561646572207B0D0A2020636F6C6F723A20';
wwv_flow_api.g_varchar2_table(741) := '233330396664623B0D0A7D0D0A0D0A2E742D526567696F6E2D2D616363656E7432203E202E742D526567696F6E2D686561646572207B0D0A20206261636B67726F756E642D636F6C6F723A20233133623663663B0D0A2020636F6C6F723A202365346639';
wwv_flow_api.g_varchar2_table(742) := '66643B0D0A7D0D0A2E742D526567696F6E2D2D616363656E7432203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6E6F55492C0D0A2E742D526567696F6E2D2D616363656E7432203E202E742D526567696F6E2D6865616465';
wwv_flow_api.g_varchar2_table(743) := '72202E742D427574746F6E2D2D6C696E6B207B0D0A2020636F6C6F723A20236534663966643B0D0A7D0D0A2E742D526567696F6E2D2D616363656E74322E742D526567696F6E2D2D74657874436F6E74656E74203E202E742D526567696F6E2D68656164';
wwv_flow_api.g_varchar2_table(744) := '6572207B0D0A2020636F6C6F723A20233133623663663B0D0A7D0D0A0D0A2E742D526567696F6E2D2D616363656E7433203E202E742D526567696F6E2D686561646572207B0D0A20206261636B67726F756E642D636F6C6F723A20233265626662633B0D';
wwv_flow_api.g_varchar2_table(745) := '0A2020636F6C6F723A20236630666366623B0D0A7D0D0A2E742D526567696F6E2D2D616363656E7433203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6E6F55492C0D0A2E742D526567696F6E2D2D616363656E7433203E20';
wwv_flow_api.g_varchar2_table(746) := '2E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6C696E6B207B0D0A2020636F6C6F723A20236630666366623B0D0A7D0D0A2E742D526567696F6E2D2D616363656E74332E742D526567696F6E2D2D74657874436F6E74656E74203E';
wwv_flow_api.g_varchar2_table(747) := '202E742D526567696F6E2D686561646572207B0D0A2020636F6C6F723A20233265626662633B0D0A7D0D0A0D0A2E742D526567696F6E2D2D616363656E7434203E202E742D526567696F6E2D686561646572207B0D0A20206261636B67726F756E642D63';
wwv_flow_api.g_varchar2_table(748) := '6F6C6F723A20233363616638353B0D0A2020636F6C6F723A20236630666166363B0D0A7D0D0A2E742D526567696F6E2D2D616363656E7434203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6E6F55492C0D0A2E742D526567';
wwv_flow_api.g_varchar2_table(749) := '696F6E2D2D616363656E7434203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6C696E6B207B0D0A2020636F6C6F723A20236630666166363B0D0A7D0D0A2E742D526567696F6E2D2D616363656E74342E742D526567696F6E';
wwv_flow_api.g_varchar2_table(750) := '2D2D74657874436F6E74656E74203E202E742D526567696F6E2D686561646572207B0D0A2020636F6C6F723A20233363616638353B0D0A7D0D0A0D0A2E742D526567696F6E2D2D616363656E7435203E202E742D526567696F6E2D686561646572207B0D';
wwv_flow_api.g_varchar2_table(751) := '0A20206261636B67726F756E642D636F6C6F723A20233831626235663B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D526567696F6E2D2D616363656E7435203E202E742D526567696F6E2D686561646572202E742D427574746F6E';
wwv_flow_api.g_varchar2_table(752) := '2D2D6E6F55492C0D0A2E742D526567696F6E2D2D616363656E7435203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6C696E6B207B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D526567696F6E2D2D61';
wwv_flow_api.g_varchar2_table(753) := '6363656E74352E742D526567696F6E2D2D74657874436F6E74656E74203E202E742D526567696F6E2D686561646572207B0D0A2020636F6C6F723A20233831626235663B0D0A7D0D0A0D0A2E742D526567696F6E2D2D616363656E7436203E202E742D52';
wwv_flow_api.g_varchar2_table(754) := '6567696F6E2D686561646572207B0D0A20206261636B67726F756E642D636F6C6F723A20236464646535333B0D0A2020636F6C6F723A20233261326130383B0D0A7D0D0A2E742D526567696F6E2D2D616363656E7436203E202E742D526567696F6E2D68';
wwv_flow_api.g_varchar2_table(755) := '6561646572202E742D427574746F6E2D2D6E6F55492C0D0A2E742D526567696F6E2D2D616363656E7436203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6C696E6B207B0D0A2020636F6C6F723A20233261326130383B0D0A';
wwv_flow_api.g_varchar2_table(756) := '7D0D0A2E742D526567696F6E2D2D616363656E74362E742D526567696F6E2D2D74657874436F6E74656E74203E202E742D526567696F6E2D686561646572207B0D0A2020636F6C6F723A20236464646535333B0D0A7D0D0A0D0A2E742D526567696F6E2D';
wwv_flow_api.g_varchar2_table(757) := '2D616363656E7437203E202E742D526567696F6E2D686561646572207B0D0A20206261636B67726F756E642D636F6C6F723A20236662636534613B0D0A2020636F6C6F723A20233434333330323B0D0A7D0D0A2E742D526567696F6E2D2D616363656E74';
wwv_flow_api.g_varchar2_table(758) := '37203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6E6F55492C0D0A2E742D526567696F6E2D2D616363656E7437203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6C696E6B207B0D0A2020636F';
wwv_flow_api.g_varchar2_table(759) := '6C6F723A20233434333330323B0D0A7D0D0A2E742D526567696F6E2D2D616363656E74372E742D526567696F6E2D2D74657874436F6E74656E74203E202E742D526567696F6E2D686561646572207B0D0A2020636F6C6F723A20236662636534613B0D0A';
wwv_flow_api.g_varchar2_table(760) := '7D0D0A0D0A2E742D526567696F6E2D2D616363656E7438203E202E742D526567696F6E2D686561646572207B0D0A20206261636B67726F756E642D636F6C6F723A20236564383133653B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E74';
wwv_flow_api.g_varchar2_table(761) := '2D526567696F6E2D2D616363656E7438203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6E6F55492C0D0A2E742D526567696F6E2D2D616363656E7438203E202E742D526567696F6E2D686561646572202E742D427574746F';
wwv_flow_api.g_varchar2_table(762) := '6E2D2D6C696E6B207B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D526567696F6E2D2D616363656E74382E742D526567696F6E2D2D74657874436F6E74656E74203E202E742D526567696F6E2D686561646572207B0D0A2020636F';
wwv_flow_api.g_varchar2_table(763) := '6C6F723A20236564383133653B0D0A7D0D0A0D0A2E742D526567696F6E2D2D616363656E7439203E202E742D526567696F6E2D686561646572207B0D0A20206261636B67726F756E642D636F6C6F723A20236539356235343B0D0A2020636F6C6F723A20';
wwv_flow_api.g_varchar2_table(764) := '236666666666663B0D0A7D0D0A2E742D526567696F6E2D2D616363656E7439203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6E6F55492C0D0A2E742D526567696F6E2D2D616363656E7439203E202E742D526567696F6E2D';
wwv_flow_api.g_varchar2_table(765) := '686561646572202E742D427574746F6E2D2D6C696E6B207B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D526567696F6E2D2D616363656E74392E742D526567696F6E2D2D74657874436F6E74656E74203E202E742D526567696F6E';
wwv_flow_api.g_varchar2_table(766) := '2D686561646572207B0D0A2020636F6C6F723A20236539356235343B0D0A7D0D0A0D0A2E742D526567696F6E2D2D616363656E743130203E202E742D526567696F6E2D686561646572207B0D0A20206261636B67726F756E642D636F6C6F723A20236538';
wwv_flow_api.g_varchar2_table(767) := '356438383B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D526567696F6E2D2D616363656E743130203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6E6F55492C0D0A2E742D526567696F6E2D2D616363';
wwv_flow_api.g_varchar2_table(768) := '656E743130203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6C696E6B207B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D526567696F6E2D2D616363656E7431302E742D526567696F6E2D2D74657874';
wwv_flow_api.g_varchar2_table(769) := '436F6E74656E74203E202E742D526567696F6E2D686561646572207B0D0A2020636F6C6F723A20236538356438383B0D0A7D0D0A0D0A2E742D526567696F6E2D2D616363656E743131203E202E742D526567696F6E2D686561646572207B0D0A20206261';
wwv_flow_api.g_varchar2_table(770) := '636B67726F756E642D636F6C6F723A20236361353839643B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D526567696F6E2D2D616363656E743131203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6E6F';
wwv_flow_api.g_varchar2_table(771) := '55492C0D0A2E742D526567696F6E2D2D616363656E743131203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6C696E6B207B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D526567696F6E2D2D61636365';
wwv_flow_api.g_varchar2_table(772) := '6E7431312E742D526567696F6E2D2D74657874436F6E74656E74203E202E742D526567696F6E2D686561646572207B0D0A2020636F6C6F723A20236361353839643B0D0A7D0D0A0D0A2E742D526567696F6E2D2D616363656E743132203E202E742D5265';
wwv_flow_api.g_varchar2_table(773) := '67696F6E2D686561646572207B0D0A20206261636B67726F756E642D636F6C6F723A20233835346539623B0D0A2020636F6C6F723A20236636663066383B0D0A7D0D0A2E742D526567696F6E2D2D616363656E743132203E202E742D526567696F6E2D68';
wwv_flow_api.g_varchar2_table(774) := '6561646572202E742D427574746F6E2D2D6E6F55492C0D0A2E742D526567696F6E2D2D616363656E743132203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6C696E6B207B0D0A2020636F6C6F723A20236636663066383B0D';
wwv_flow_api.g_varchar2_table(775) := '0A7D0D0A2E742D526567696F6E2D2D616363656E7431322E742D526567696F6E2D2D74657874436F6E74656E74203E202E742D526567696F6E2D686561646572207B0D0A2020636F6C6F723A20233835346539623B0D0A7D0D0A0D0A2E742D526567696F';
wwv_flow_api.g_varchar2_table(776) := '6E2D2D616363656E743133203E202E742D526567696F6E2D686561646572207B0D0A20206261636B67726F756E642D636F6C6F723A20233561363861643B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D526567696F6E2D2D616363';
wwv_flow_api.g_varchar2_table(777) := '656E743133203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6E6F55492C0D0A2E742D526567696F6E2D2D616363656E743133203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6C696E6B207B0D';
wwv_flow_api.g_varchar2_table(778) := '0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D526567696F6E2D2D616363656E7431332E742D526567696F6E2D2D74657874436F6E74656E74203E202E742D526567696F6E2D686561646572207B0D0A2020636F6C6F723A2023356136';
wwv_flow_api.g_varchar2_table(779) := '3861643B0D0A7D0D0A0D0A2E742D526567696F6E2D2D616363656E743134203E202E742D526567696F6E2D686561646572207B0D0A20206261636B67726F756E642D636F6C6F723A20236166626163353B0D0A2020636F6C6F723A20233331336134343B';
wwv_flow_api.g_varchar2_table(780) := '0D0A7D0D0A2E742D526567696F6E2D2D616363656E743134203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6E6F55492C0D0A2E742D526567696F6E2D2D616363656E743134203E202E742D526567696F6E2D686561646572';
wwv_flow_api.g_varchar2_table(781) := '202E742D427574746F6E2D2D6C696E6B207B0D0A2020636F6C6F723A20233331336134343B0D0A7D0D0A2E742D526567696F6E2D2D616363656E7431342E742D526567696F6E2D2D74657874436F6E74656E74203E202E742D526567696F6E2D68656164';
wwv_flow_api.g_varchar2_table(782) := '6572207B0D0A2020636F6C6F723A20236166626163353B0D0A7D0D0A0D0A2E742D526567696F6E2D2D616363656E743135203E202E742D526567696F6E2D686561646572207B0D0A20206261636B67726F756E642D636F6C6F723A20233665383539383B';
wwv_flow_api.g_varchar2_table(783) := '0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D526567696F6E2D2D616363656E743135203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6E6F55492C0D0A2E742D526567696F6E2D2D616363656E743135';
wwv_flow_api.g_varchar2_table(784) := '203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6C696E6B207B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D526567696F6E2D2D616363656E7431352E742D526567696F6E2D2D74657874436F6E7465';
wwv_flow_api.g_varchar2_table(785) := '6E74203E202E742D526567696F6E2D686561646572207B0D0A2020636F6C6F723A20233665383539383B0D0A7D0D0A2E742D526567696F6E2D626F6479207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D526567696F6E2D2D6869';
wwv_flow_api.g_varchar2_table(786) := '646553686F772E69732D636F6C6C6170736564207B0D0A2020626F726465722D626F74746F6D2D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A2E742D426F64792D616374696F6E73202E742D526567696F6E207B0D0A20206261636B6772';
wwv_flow_api.g_varchar2_table(787) := '6F756E642D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A2E742D426F64792D616374696F6E73202E742D526567696F6E2D686561646572207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A7D';
wwv_flow_api.g_varchar2_table(788) := '0D0A2E742D426F64792D73696465202E742D526567696F6E207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A2E742D526567696F6E2C0D0A2E742D526567696F6E2D686561646572207B0D0A202062';
wwv_flow_api.g_varchar2_table(789) := '6F726465722D7261646975733A203270783B0D0A7D0D0A2E742D526567696F6E2D2D6E6F4247207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A2E742D426F64792D616374696F6E73202E742D5265';
wwv_flow_api.g_varchar2_table(790) := '67696F6E207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A2E742D526567696F6E2D2D6361726F7573656C202E612D546162732D627574746F6E207B0D0A2020626F726465722D7261646975733A20';
wwv_flow_api.g_varchar2_table(791) := '3270783B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3235293B0D0A2020636F6C6F723A20234646463B0D0A7D0D0A2E742D526567696F6E2D2D6361726F7573656C202E612D546162732D627574746F';
wwv_flow_api.g_varchar2_table(792) := '6E3A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E35293B0D0A7D0D0A2E742D526567696F6E2D2D6361726F7573656C202E612D546162732D627574746F6E3A6163746976652C0D0A2E';
wwv_flow_api.g_varchar2_table(793) := '742D526567696F6E2D2D6361726F7573656C202E612D546162732D627574746F6E3A6163746976653A666F637573207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3735293B0D0A7D0D0A2E742D5265';
wwv_flow_api.g_varchar2_table(794) := '67696F6E2D2D6361726F7573656C202E612D546162732D6E6578742D726567696F6E207B0D0A2020626F726465722D7261646975733A2032707820302030203270783B0D0A7D0D0A2E742D526567696F6E2D2D6361726F7573656C202E612D546162732D';
wwv_flow_api.g_varchar2_table(795) := '70726576696F75732D726567696F6E207B0D0A2020626F726465722D7261646975733A2030203270782032707820303B0D0A7D0D0A2E742D526567696F6E2D2D6361726F7573656C202E612D526567696F6E2D6361726F7573656C4E61764974656D2E61';
wwv_flow_api.g_varchar2_table(796) := '2D546162732D73656C6563746564202E612D526567696F6E2D6361726F7573656C4C696E6B207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3435293B0D0A7D0D0A2E742D526567696F6E2D2D636172';
wwv_flow_api.g_varchar2_table(797) := '6F7573656C202E612D526567696F6E2D6361726F7573656C4E61764974656D2E612D546162732D73656C6563746564202E612D526567696F6E2D6361726F7573656C4C696E6B3A666F637573207B0D0A20206261636B67726F756E642D636F6C6F723A20';
wwv_flow_api.g_varchar2_table(798) := '233332333333363B0D0A7D0D0A2E742D526567696F6E2D2D6361726F7573656C202E612D526567696F6E2D6361726F7573656C4C696E6B207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3135293B0D';
wwv_flow_api.g_varchar2_table(799) := '0A2020626F726465722D7261646975733A20313030253B0D0A7D0D0A0D0A2E742D5265706F72742D63656C6C2C0D0A2E742D5265706F72742D636F6C48656164207B0D0A2020626F726465723A2031707820736F6C696420236536653665363B0D0A7D0D';
wwv_flow_api.g_varchar2_table(800) := '0A2E742D5265706F72742D7265706F7274207472202E742D5265706F72742D63656C6C3A6C6173742D6368696C642C0D0A2E742D5265706F72742D7265706F7274207472202E742D5265706F72742D636F6C486561643A6C6173742D6368696C64207B0D';
wwv_flow_api.g_varchar2_table(801) := '0A2020626F726465722D72696768743A2031707820736F6C696420236536653665363B0D0A7D0D0A2E742D5265706F72742D7265706F72742074723A6C6173742D6368696C64202E742D5265706F72742D63656C6C207B0D0A2020626F726465722D626F';
wwv_flow_api.g_varchar2_table(802) := '74746F6D3A2031707820736F6C696420236536653665363B0D0A7D0D0A2E742D5265706F7274202E69732D737475636B202E742D5265706F72742D636F6C48656164207B0D0A20206261636B67726F756E642D636F6C6F723A2072676261283235352C20';
wwv_flow_api.g_varchar2_table(803) := '3235352C203235352C20302E3935293B0D0A20202D7765626B69742D6261636B64726F702D66696C7465723A20626C757228347078293B0D0A7D0D0A2E742D5265706F72742D2D726F77486967686C69676874202E742D5265706F72742D7265706F7274';
wwv_flow_api.g_varchar2_table(804) := '2074723A686F766572202E742D5265706F72742D63656C6C2C0D0A2E742D5265706F72742D2D726F77486967686C69676874202E742D5265706F72742D7265706F72742074723A6E74682D6368696C64286F6464293A686F766572202E742D5265706F72';
wwv_flow_api.g_varchar2_table(805) := '742D63656C6C207B0D0A20206261636B67726F756E642D636F6C6F723A20236661666166612021696D706F7274616E743B0D0A7D0D0A2E742D5265706F72742D2D737461746963526F77436F6C6F7273202E742D5265706F72742D7265706F7274207472';
wwv_flow_api.g_varchar2_table(806) := '3A6E74682D6368696C64286F646429202E742D5265706F72742D63656C6C207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A0D0A2E742D5265706F72742D2D616C74526F777344656661756C74202E';
wwv_flow_api.g_varchar2_table(807) := '742D5265706F72742D7265706F72742074723A6E74682D6368696C64286F646429202E742D5265706F72742D63656C6C207B0D0A20206261636B67726F756E642D636F6C6F723A20236663666366633B0D0A7D0D0A0D0A2E742D5265706F72742D706167';
wwv_flow_api.g_varchar2_table(808) := '696E6174696F6E5465787420622C0D0A2E742D5265706F72742D706167696E6174696F6E5465787420613A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20233332333333363B0D0A2020636F6C6F723A20236633663366343B0D';
wwv_flow_api.g_varchar2_table(809) := '0A7D0D0A2E742D536561726368526573756C74732D64657363207B0D0A2020636F6C6F723A20233166316631663B0D0A7D0D0A2E742D536561726368526573756C74732D64617465207B0D0A2020636F6C6F723A20233663366336633B0D0A7D0D0A2E74';
wwv_flow_api.g_varchar2_table(810) := '2D536561726368526573756C74732D6D697363207B0D0A2020636F6C6F723A20233663366336633B0D0A7D0D0A2E742D526567696F6E202E742D536561726368526573756C74732D64657363207B0D0A2020636F6C6F723A20233236323632363B0D0A7D';
wwv_flow_api.g_varchar2_table(811) := '0D0A2E742D526567696F6E202E742D536561726368526573756C74732D64617465207B0D0A2020636F6C6F723A20233733373337333B0D0A7D0D0A2E742D526567696F6E202E742D536561726368526573756C74732D6D697363207B0D0A2020636F6C6F';
wwv_flow_api.g_varchar2_table(812) := '723A20233733373337333B0D0A7D0D0A2E742D5374617475734C6973742D626C6F636B486561646572207B0D0A2020636F6C6F723A20233236323632363B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E742D';
wwv_flow_api.g_varchar2_table(813) := '5374617475734C6973742D68656164657254657874416C742C0D0A2E742D5374617475734C6973742D617474722C0D0A2E742D5374617475734C6973742D7465787444657363207B0D0A2020636F6C6F723A20233733373337333B0D0A7D0D0A2E742D53';
wwv_flow_api.g_varchar2_table(814) := '74617475734C6973742D6974656D5469746C65207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D5374617475734C6973742D2D6461746573202E742D5374617475734C6973742D6D61726B6572207B0D0A2020636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(815) := '3730373037303B0D0A2020626F726465722D7261646975733A203270783B0D0A20206261636B67726F756E642D636F6C6F723A20234646463B0D0A7D0D0A2E742D5374617475734C6973742D2D6461746573202E742D5374617475734C6973742D6D6172';
wwv_flow_api.g_varchar2_table(816) := '6B65723A6166746572207B0D0A20206261636B67726F756E642D636F6C6F723A20234130413041303B0D0A2020626F726465722D7261646975733A2032707820327078203020303B0D0A7D0D0A2E742D5374617475734C6973742D2D62756C6C65747320';
wwv_flow_api.g_varchar2_table(817) := '2E742D5374617475734C6973742D6D61726B6572207B0D0A2020626F726465722D7261646975733A20323470783B0D0A20206261636B67726F756E642D636F6C6F723A20236666663B0D0A2020636F6C6F723A20233430343034303B0D0A7D0D0A2E742D';
wwv_flow_api.g_varchar2_table(818) := '5374617475734C6973742D2D62756C6C657473202E742D5374617475734C6973742D6974656D2E69732D636F6D706C657465202E742D5374617475734C6973742D6D61726B6572207B0D0A20206261636B67726F756E642D636F6C6F723A202337303730';
wwv_flow_api.g_varchar2_table(819) := '37303B0D0A7D0D0A2E742D5374617475734C6973742D2D62756C6C657473202E742D5374617475734C6973742D6974656D2E69732D64616E676572202E742D5374617475734C6973742D6D61726B65722C0D0A2E742D5374617475734C6973742D2D6275';
wwv_flow_api.g_varchar2_table(820) := '6C6C657473202E742D5374617475734C6973742D6974656D2E69732D6572726F72202E742D5374617475734C6973742D6D61726B6572207B0D0A20206261636B67726F756E642D636F6C6F723A20236666336233303B0D0A7D0D0A2E742D537461747573';
wwv_flow_api.g_varchar2_table(821) := '4C6973742D2D62756C6C657473202E742D5374617475734C6973742D6974656D2E69732D6F70656E202E742D5374617475734C6973742D6D61726B6572207B0D0A20206261636B67726F756E642D636F6C6F723A20233463643936343B0D0A7D0D0A2E74';
wwv_flow_api.g_varchar2_table(822) := '2D5374617475734C6973742D2D62756C6C657473202E742D5374617475734C6973742D6974656D2E69732D7761726E696E67202E742D5374617475734C6973742D6D61726B6572207B0D0A20206261636B67726F756E642D636F6C6F723A202366666363';
wwv_flow_api.g_varchar2_table(823) := '30303B0D0A7D0D0A2E742D5374617475734C6973742D2D62756C6C657473202E742D5374617475734C6973742D6974656D2E69732D6E756C6C202E742D5374617475734C6973742D6D61726B6572207B0D0A20206261636B67726F756E642D636F6C6F72';
wwv_flow_api.g_varchar2_table(824) := '3A20234630463046303B0D0A7D0D0A2E742D5374617475734C6973742D2D62756C6C657473202E742D5374617475734C6973742D6974656D2E69732D6E756C6C202E742D5374617475734C6973742D6D61726B6572207B0D0A2020636F6C6F723A202341';
wwv_flow_api.g_varchar2_table(825) := '30413041303B0D0A7D0D0A0D0A2E742D546162732D2D73696D706C65202E742D546162732D6974656D2E69732D616374697665202E742D546162732D6C696E6B207B0D0A2020626F782D736861646F773A2030202D327078203020233035366262662069';
wwv_flow_api.g_varchar2_table(826) := '6E7365743B0D0A7D0D0A2E742D546162732D2D73696D706C65202E742D546162732D6C696E6B3A666F637573207B0D0A2020626F782D736861646F773A20302030203020317078202330353662626620696E7365743B0D0A7D0D0A2E742D546162732D2D';
wwv_flow_api.g_varchar2_table(827) := '70696C6C207B0D0A20206261636B67726F756E642D636F6C6F723A20236639663966393B0D0A2020626F726465722D7261646975733A203270783B0D0A7D0D0A2E742D546162732D2D70696C6C202E742D49636F6E207B0D0A2020636F6C6F723A202332';
wwv_flow_api.g_varchar2_table(828) := '36323632363B0D0A7D0D0A2E742D546162732D2D70696C6C202E742D546162732D6C696E6B207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D546162732D2D70696C6C202E742D546162732D6C696E6B3A686F766572207B0D0A20';
wwv_flow_api.g_varchar2_table(829) := '206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E742D546162732D2D70696C6C202E742D546162732D6C696E6B3A666F637573207B0D0A2020626F782D736861646F773A20302030203020317078202330353662626620';
wwv_flow_api.g_varchar2_table(830) := '696E7365743B0D0A7D0D0A2E742D546162732D2D70696C6C202E742D546162732D6C696E6B3A616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E742D546162732D2D70696C6C202E742D5461';
wwv_flow_api.g_varchar2_table(831) := '62732D6974656D3A66697273742D6368696C64202E742D546162732D6C696E6B207B0D0A2020626F726465722D7261646975733A2032707820302030203270783B0D0A7D0D0A2E742D546162732D2D70696C6C202E742D546162732D6974656D2E69732D';
wwv_flow_api.g_varchar2_table(832) := '616374697665202E742D546162732D6C696E6B207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E742D546162732D2D73696D706C65202E742D49636F6E207B0D0A2020636F6C6F723A20233236323632363B';
wwv_flow_api.g_varchar2_table(833) := '0D0A7D0D0A2E742D546162732D2D73696D706C65202E742D546162732D6C696E6B207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D546162732D2D73696D706C65202E742D546162732D6C696E6B3A686F766572207B0D0A202062';
wwv_flow_api.g_varchar2_table(834) := '61636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E303235293B0D0A7D0D0A2E742D546162732D2D73696D706C65202E742D546162732D6C696E6B3A616374697665207B0D0A20206261636B67726F756E642D636F6C6F72';
wwv_flow_api.g_varchar2_table(835) := '3A207267626128302C20302C20302C20302E3135293B0D0A7D0D0A2E742D426F6479202E742D546162732D2D73696D706C65202E742D546162732D6C696E6B207B0D0A2020636F6C6F723A20233166316631663B0D0A7D0D0A2E742D426F64792D746974';
wwv_flow_api.g_varchar2_table(836) := '6C65202E742D546162732D2D73696D706C65202E742D546162732D6C696E6B207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D526567696F6E202E742D546162732D2D73696D706C65202E742D546162732D6C696E6B207B0D0A20';
wwv_flow_api.g_varchar2_table(837) := '20636F6C6F723A20233236323632363B0D0A7D0D0A0D0A2E617065782D726473202E617065782D7264732D73656C6563746564207370616E207B0D0A2020626F782D736861646F773A2030202D3270782030202330353662626620696E7365743B0D0A7D';
wwv_flow_api.g_varchar2_table(838) := '0D0A2E617065782D72647320613A666F637573207B0D0A2020626F782D736861646F773A20302030203020317078202330353662626620696E7365743B0D0A7D0D0A2E617065782D7264732061207B0D0A2020636F6C6F723A20233166316631663B0D0A';
wwv_flow_api.g_varchar2_table(839) := '7D0D0A2E742D426F64792D7469746C65202E617065782D72647320612C0D0A2E742D426F64792D696E666F202E617065782D7264732061207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D526567696F6E202E617065782D726473';
wwv_flow_api.g_varchar2_table(840) := '2061207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E617065782D72647320613A686F766572207B0D0A2020636F6C6F723A20233035366262663B0D0A7D0D0A2E617065782D726473202E617065782D7264732D73656C656374656420';
wwv_flow_api.g_varchar2_table(841) := '61207B0D0A2020636F6C6F723A20233035366262663B0D0A7D0D0A2E617065782D7264732D686F7665722E6C6566742061207B0D0A20206261636B67726F756E643A202D7765626B69742D6C696E6561722D6772616469656E74286C6566742C20236666';
wwv_flow_api.g_varchar2_table(842) := '66666666203530252C2072676261283235352C203235352C203235352C2030292031303025293B0D0A20200D0A20206261636B67726F756E643A206C696E6561722D6772616469656E7428746F2072696768742C2023666666666666203530252C207267';
wwv_flow_api.g_varchar2_table(843) := '6261283235352C203235352C203235352C2030292031303025293B0D0A20200D0A7D0D0A2E617065782D7264732D686F7665722E72696768742061207B0D0A20206261636B67726F756E643A202D7765626B69742D6C696E6561722D6772616469656E74';
wwv_flow_api.g_varchar2_table(844) := '286C6566742C20236666666666662030252C2072676261283235352C203235352C203235352C2030292031252C202366666666666620353025293B0D0A20200D0A20206261636B67726F756E643A206C696E6561722D6772616469656E7428746F207269';
wwv_flow_api.g_varchar2_table(845) := '6768742C20236666666666662030252C2072676261283235352C203235352C203235352C2030292031252C202366666666666620353025293B0D0A20200D0A7D0D0A0D0A2E766572746963616C2D726473202E617065782D726473202E617065782D7264';
wwv_flow_api.g_varchar2_table(846) := '732D73656C6563746564207370616E2C0D0A2E742D426F64792D73696465202E617065782D726473202E617065782D7264732D73656C6563746564207370616E207B0D0A2020626F782D736861646F773A2034707820302030202330353662626620696E';
wwv_flow_api.g_varchar2_table(847) := '7365743B0D0A7D0D0A2E752D52544C202E766572746963616C2D726473202E617065782D726473202E617065782D7264732D73656C6563746564207370616E2C0D0A2E752D52544C202E742D426F64792D73696465202E617065782D726473202E617065';
wwv_flow_api.g_varchar2_table(848) := '782D7264732D73656C6563746564207370616E207B0D0A2020626F782D736861646F773A202D34707820302030202330353662626620696E7365743B0D0A7D0D0A0D0A2E612D546167436C6F75642D6C696E6B207B0D0A2020626F726465722D636F6C6F';
wwv_flow_api.g_varchar2_table(849) := '723A20236632663266323B0D0A2020626F726465722D7261646975733A203270783B0D0A20206261636B67726F756E643A20236661666166613B0D0A20207472616E736974696F6E3A206261636B67726F756E642D636F6C6F7220302E32732C20626F72';
wwv_flow_api.g_varchar2_table(850) := '6465722D636F6C6F7220302E32732C20626F782D736861646F7720302E32732C20636F6C6F7220302E32733B0D0A2020636F6C6F723A20233035363862613B0D0A7D0D0A2E612D546167436C6F75642D6C696E6B207370616E207B0D0A20207472616E73';
wwv_flow_api.g_varchar2_table(851) := '6974696F6E3A20636F6C6F72202E32733B0D0A7D0D0A2E612D546167436C6F75642D6C696E6B3A686F766572207B0D0A2020746578742D6465636F726174696F6E3A206E6F6E653B0D0A20206261636B67726F756E642D636F6C6F723A20233332333333';
wwv_flow_api.g_varchar2_table(852) := '363B0D0A2020626F726465722D636F6C6F723A20233332333333363B0D0A2020636F6C6F723A20236633663366343B0D0A2020626F782D736861646F773A20302030203020327078202333323333333620696E7365743B0D0A7D0D0A2E612D546167436C';
wwv_flow_api.g_varchar2_table(853) := '6F75642D6C696E6B3A686F766572207370616E207B0D0A2020636F6C6F723A20236633663366343B0D0A7D0D0A2E612D546167436C6F75642D636F756E74207B0D0A2020636F6C6F723A20233636363636363B0D0A2020666F6E742D7765696768743A20';
wwv_flow_api.g_varchar2_table(854) := '3530303B0D0A7D0D0A2E742D54696D656C696E65207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D54696D656C696E652D757365726E616D652C0D0A2E742D54696D656C696E652D646174652C0D0A2E742D54696D656C696E652D';
wwv_flow_api.g_varchar2_table(855) := '64657363207B0D0A2020636F6C6F723A20233733373337333B0D0A7D0D0A2E742D54696D656C696E652D617661746172207B0D0A20206261636B67726F756E642D636F6C6F723A20233332333333363B0D0A2020636F6C6F723A20236633663366343B0D';
wwv_flow_api.g_varchar2_table(856) := '0A7D0D0A2E742D54696D656C696E652D77726170207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D54696D656C696E652D74797065207B0D0A20206261636B67726F756E642D636F6C6F723A20236635663566353B0D0A2020636F';
wwv_flow_api.g_varchar2_table(857) := '6C6F723A20233236323632363B0D0A7D0D0A2E742D54696D656C696E652D747970652E69732D6E6577207B0D0A20206261636B67726F756E642D636F6C6F723A20233362616132633B0D0A2020636F6C6F723A20234646463B0D0A7D0D0A2E742D54696D';
wwv_flow_api.g_varchar2_table(858) := '656C696E652D747970652E69732D75706461746564207B0D0A20206261636B67726F756E642D636F6C6F723A20233030373664663B0D0A2020636F6C6F723A20234646463B0D0A7D0D0A2E742D54696D656C696E652D747970652E69732D72656D6F7665';
wwv_flow_api.g_varchar2_table(859) := '64207B0D0A20206261636B67726F756E642D636F6C6F723A20236634343333363B0D0A2020636F6C6F723A20234646463B0D0A7D0D0A2E742D54696D656C696E652D777261703A666F637573207B0D0A20206F75746C696E653A206E6F6E653B0D0A2020';
wwv_flow_api.g_varchar2_table(860) := '626F782D736861646F773A20302030203020317078202330353662626620696E7365743B0D0A7D0D0A406D6564696120286D696E2D77696474683A20373639707829207B0D0A20202E742D426F64792D6E6176207B0D0A202020206261636B67726F756E';
wwv_flow_api.g_varchar2_table(861) := '642D636F6C6F723A20233332333333363B0D0A20207D0D0A7D0D0A2E742D547265654E6176207B0D0A20206261636B67726F756E642D636F6C6F723A20233332333333363B0D0A7D0D0A2E742D50616765426F64792D2D6C6566744E6176202E742D426F';
wwv_flow_api.g_varchar2_table(862) := '64792D6E61763A3A2D7765626B69742D7363726F6C6C6261722D7468756D62207B0D0A20206261636B67726F756E642D636F6C6F723A20233233323332373B0D0A2020626F782D736861646F773A20696E73657420317078203020302030202333323333';
wwv_flow_api.g_varchar2_table(863) := '33363B0D0A7D0D0A2E742D50616765426F64792D2D6C6566744E6176202E742D426F64792D6E61763A3A2D7765626B69742D7363726F6C6C6261722D7468756D623A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A202334303430';
wwv_flow_api.g_varchar2_table(864) := '34373B0D0A7D0D0A2E742D50616765426F64792D2D6C6566744E6176202E742D426F64792D6E61763A3A2D7765626B69742D7363726F6C6C6261722D747261636B207B0D0A20206261636B67726F756E643A20233332333333363B0D0A7D0D0A2E742D50';
wwv_flow_api.g_varchar2_table(865) := '616765426F64792D2D6C6566744E6176202E742D426F64792D6E61763A3A2D7765626B69742D7363726F6C6C6261722D747261636B3A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20233537353935653B0D0A7D0D0A2E742D52';
wwv_flow_api.g_varchar2_table(866) := '6567696F6E207B0D0A20200D0A7D0D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D666F6375736564207B0D0A2020626F782D736861646F773A20302030';
wwv_flow_api.g_varchar2_table(867) := '203020317078202330353662626620696E7365743B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D';
wwv_flow_api.g_varchar2_table(868) := '54726565566965772D726F772E69732D63757272656E742C0D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D73656C65637465642C0D0A2E742D52656769';
wwv_flow_api.g_varchar2_table(869) := '6F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702E69732D73656C6563746564207B0D0A20206261636B67726F756E642D636F6C6F723A20236637';
wwv_flow_api.g_varchar2_table(870) := '663766373B0D0A7D0D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702C0D0A2E742D526567696F6E202E612D547265655669';
wwv_flow_api.g_varchar2_table(871) := '65772D6E6F64652D2D746F704C6576656C2E69732D636F6C6C61707369626C65203E202E612D54726565566965772D726F772C0D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C20756C207B0D0A20206261';
wwv_flow_api.g_varchar2_table(872) := '636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D686F766572207B0D0A20206261636B';
wwv_flow_api.g_varchar2_table(873) := '67726F756E642D636F6C6F723A20236630663066302021696D706F7274616E743B0D0A7D0D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D686F76657220';
wwv_flow_api.g_varchar2_table(874) := '2B202E612D54726565566965772D746F67676C652C0D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C2E69732D636F6C6C61707369626C65202E612D54726565566965772D746F67676C65207B0D0A202063';
wwv_flow_api.g_varchar2_table(875) := '6F6C6F723A20726762612833382C2033382C2033382C20302E3735293B0D0A7D0D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D686F766572202B202E61';
wwv_flow_api.g_varchar2_table(876) := '2D54726565566965772D746F67676C653A686F7665722C0D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C2E69732D636F6C6C61707369626C65202E612D54726565566965772D746F67676C653A686F7665';
wwv_flow_api.g_varchar2_table(877) := '72207B0D0A2020636F6C6F723A20233236323632362021696D706F7274616E743B0D0A7D0D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D686F';
wwv_flow_api.g_varchar2_table(878) := '766572207B0D0A2020636F6C6F723A20233236323632362021696D706F7274616E743B0D0A7D0D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E74207B0D0A';
wwv_flow_api.g_varchar2_table(879) := '2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E74202E66612C0D0A2E742D526567696F6E202E612D5472';
wwv_flow_api.g_varchar2_table(880) := '6565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E74202E612D49636F6E207B0D0A2020636F6C6F723A20726762612833382C2033382C2033382C20302E3935293B0D0A7D0D0A2E742D526567696F6E20';
wwv_flow_api.g_varchar2_table(881) := '2E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E74202E66613A6265666F72652C0D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D';
wwv_flow_api.g_varchar2_table(882) := '54726565566965772D636F6E74656E74202E612D49636F6E3A6265666F7265207B0D0A2020636F6C6F723A20696E68657269743B0D0A7D0D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D547265';
wwv_flow_api.g_varchar2_table(883) := '65566965772D636F6E74656E742E69732D686F766572202E66612C0D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D63757272656E742D2D746F';
wwv_flow_api.g_varchar2_table(884) := '70202E66612C0D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D686F766572202E612D49636F6E2C0D0A2E742D526567696F6E202E612D547265';
wwv_flow_api.g_varchar2_table(885) := '65566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D63757272656E742D2D746F70202E612D49636F6E207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D526567696F6E20';
wwv_flow_api.g_varchar2_table(886) := '2E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D6C6162656C207B0D0A2020636F6C6F723A20696E68657269743B0D0A7D0D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F';
wwv_flow_api.g_varchar2_table(887) := '704C6576656C202E612D54726565566965772D636F6E74656E742E69732D63757272656E742C0D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D';
wwv_flow_api.g_varchar2_table(888) := '73656C65637465642C0D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D63757272656E742D2D746F70207B0D0A2020636F6C6F723A2023323632';
wwv_flow_api.g_varchar2_table(889) := '3632363B0D0A7D0D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D746F67676C65207B0D0A2020636F6C6F723A20726762612833382C2033382C2033382C20302E3735293B';
wwv_flow_api.g_varchar2_table(890) := '0D0A7D0D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D746F67676C653A686F766572207B0D0A2020636F6C6F723A20233236323632362021696D706F7274616E743B0D0A';
wwv_flow_api.g_varchar2_table(891) := '7D0D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C2E69732D636F6C6C61707369626C65203E202E612D54726565566965772D726F772E69732D73656C65637465642C0D0A2E742D526567696F6E202E612D';
wwv_flow_api.g_varchar2_table(892) := '54726565566965772D6E6F64652D2D746F704C6576656C2E69732D636F6C6C61707369626C65203E202E612D54726565566965772D726F772E69732D666F6375736564207B0D0A20206261636B67726F756E642D636F6C6F723A20236637663766373B0D';
wwv_flow_api.g_varchar2_table(893) := '0A7D0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D666F6375736564207B0D0A2020626F782D736861646F773A203020302030203170782023303536';
wwv_flow_api.g_varchar2_table(894) := '62626620696E7365743B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D72';
wwv_flow_api.g_varchar2_table(895) := '6F772E69732D63757272656E742C0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D73656C65637465642C0D0A2E742D547265654E6176202E612D5472';
wwv_flow_api.g_varchar2_table(896) := '6565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702E69732D73656C6563746564207B0D0A20206261636B67726F756E642D636F6C6F723A20233233323332373B0D0A7D';
wwv_flow_api.g_varchar2_table(897) := '0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702C0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64';
wwv_flow_api.g_varchar2_table(898) := '652D2D746F704C6576656C2E69732D636F6C6C61707369626C65203E202E612D54726565566965772D726F772C0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C20756C207B0D0A20206261636B67726F';
wwv_flow_api.g_varchar2_table(899) := '756E642D636F6C6F723A20233163316331663B0D0A7D0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D686F766572207B0D0A20206261636B67726F75';
wwv_flow_api.g_varchar2_table(900) := '6E642D636F6C6F723A20233262326232662021696D706F7274616E743B0D0A7D0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D686F766572202B202E';
wwv_flow_api.g_varchar2_table(901) := '612D54726565566965772D746F67676C652C0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C2E69732D636F6C6C61707369626C65202E612D54726565566965772D746F67676C65207B0D0A2020636F6C';
wwv_flow_api.g_varchar2_table(902) := '6F723A2072676261283235352C203235352C203235352C20302E3735293B0D0A7D0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D686F766572202B20';
wwv_flow_api.g_varchar2_table(903) := '2E612D54726565566965772D746F67676C653A686F7665722C0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C2E69732D636F6C6C61707369626C65202E612D54726565566965772D746F67676C653A68';
wwv_flow_api.g_varchar2_table(904) := '6F766572207B0D0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69';
wwv_flow_api.g_varchar2_table(905) := '732D686F766572207B0D0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E';
wwv_flow_api.g_varchar2_table(906) := '74207B0D0A2020636F6C6F723A20236464646464643B0D0A7D0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E74202E66612C0D0A2E742D547265654E61';
wwv_flow_api.g_varchar2_table(907) := '76202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E74202E612D49636F6E207B0D0A2020636F6C6F723A20236161616161613B0D0A7D0D0A2E742D547265654E6176202E612D54726565';
wwv_flow_api.g_varchar2_table(908) := '566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E74202E66613A6265666F72652C0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D547265655669';
wwv_flow_api.g_varchar2_table(909) := '65772D636F6E74656E74202E612D49636F6E3A6265666F7265207B0D0A2020636F6C6F723A20696E68657269743B0D0A7D0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D5472656556696577';
wwv_flow_api.g_varchar2_table(910) := '2D636F6E74656E742E69732D686F766572202E66612C0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D63757272656E742D2D746F70202E66';
wwv_flow_api.g_varchar2_table(911) := '612C0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D686F766572202E612D49636F6E2C0D0A2E742D547265654E6176202E612D5472656556';
wwv_flow_api.g_varchar2_table(912) := '6965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D63757272656E742D2D746F70202E612D49636F6E207B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D547265654E6176202E';
wwv_flow_api.g_varchar2_table(913) := '612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D6C6162656C207B0D0A2020636F6C6F723A20696E68657269743B0D0A7D0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F';
wwv_flow_api.g_varchar2_table(914) := '704C6576656C202E612D54726565566965772D636F6E74656E742E69732D63757272656E742C0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E6973';
wwv_flow_api.g_varchar2_table(915) := '2D73656C65637465642C0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D63757272656E742D2D746F70207B0D0A2020636F6C6F723A202366';
wwv_flow_api.g_varchar2_table(916) := '66666666663B0D0A7D0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D746F67676C65207B0D0A2020636F6C6F723A2072676261283232312C203232312C203232312C20';
wwv_flow_api.g_varchar2_table(917) := '302E3735293B0D0A7D0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D746F67676C653A686F766572207B0D0A2020636F6C6F723A20236464646464642021696D706F72';
wwv_flow_api.g_varchar2_table(918) := '74616E743B0D0A7D0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C2E69732D636F6C6C61707369626C65202E612D54726565566965772D636F6E74656E74202E66612C0D0A2E742D547265654E617620';
wwv_flow_api.g_varchar2_table(919) := '2E612D54726565566965772D6E6F64652D2D746F704C6576656C2E69732D636F6C6C61707369626C65202E612D54726565566965772D636F6E74656E74202E612D49636F6E207B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D5472';
wwv_flow_api.g_varchar2_table(920) := '65654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C2E69732D636F6C6C61707369626C65202E612D54726565566965772D636F6E74656E74207B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E6A732D6E6176';
wwv_flow_api.g_varchar2_table(921) := '436F6C6C6170736564202E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C203E202E612D54726565566965772D636F6E74656E74202E612D54726565566965772D6C6162656C202E612D54726565566965772D';
wwv_flow_api.g_varchar2_table(922) := '6261646765207B0D0A20206261636B67726F756E643A20233064306430653B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D547265654E6176202E612D54726565566965772D6261646765207B0D0A2020626F782D736861646F773A';
wwv_flow_api.g_varchar2_table(923) := '203020302030203170782072676261283235352C203235352C203235352C20302E31293B0D0A2020666F6E742D7765696768743A203430303B0D0A7D0D0A2E742D547265654E6176202E612D54726565566965772D636F6E74656E742E69732D63757272';
wwv_flow_api.g_varchar2_table(924) := '656E74202E612D54726565566965772D6C6162656C2C0D0A2E742D547265654E6176202E612D54726565566965772D636F6E74656E742E69732D63757272656E742D2D746F70202E612D54726565566965772D6C6162656C207B0D0A2020666F6E742D77';
wwv_flow_api.g_varchar2_table(925) := '65696768743A203530303B0D0A7D0D0A0D0A2E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C6576656C207B0D0A2020626F726465722D626F74746F6D3A2031707820736F6C696420726762612832';
wwv_flow_api.g_varchar2_table(926) := '34332C203234332C203234342C20302E303735293B0D0A7D0D0A2E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D';
wwv_flow_api.g_varchar2_table(927) := '746F702C0D0A2E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F70207E20756C202E612D5472656556696577';
wwv_flow_api.g_varchar2_table(928) := '2D726F77207B0D0A2020626F782D736861646F773A20696E736574202333323333333620347078203020303B0D0A7D0D0A2E752D52544C202E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C657665';
wwv_flow_api.g_varchar2_table(929) := '6C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702C0D0A2E752D52544C202E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D5472656556696577';
wwv_flow_api.g_varchar2_table(930) := '2D726F772E69732D63757272656E742D2D746F70207E20756C202E612D54726565566965772D726F77207B0D0A2020626F782D736861646F773A20696E7365742023333233333336202D347078203020303B0D0A7D0D0A2E742D547265654E61762D2D73';
wwv_flow_api.g_varchar2_table(931) := '74796C6541202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702E69732D666F63757365642C0D0A2E742D547265654E61762D2D7374796C6541202E612D';
wwv_flow_api.g_varchar2_table(932) := '54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F70207E20756C202E612D54726565566965772D726F772E69732D666F6375736564207B0D0A2020626F782D736861';
wwv_flow_api.g_varchar2_table(933) := '646F773A20696E736574202333323333333620347078203020302C20302030203020317078202333323333333620696E7365743B0D0A7D0D0A2E752D52544C202E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D';
wwv_flow_api.g_varchar2_table(934) := '2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702E69732D666F63757365642C0D0A2E752D52544C202E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D74';
wwv_flow_api.g_varchar2_table(935) := '6F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F70207E20756C202E612D54726565566965772D726F772E69732D666F6375736564207B0D0A2020626F782D736861646F773A20696E736574202333323333';
wwv_flow_api.g_varchar2_table(936) := '3336202D347078203020302C20302030203020317078202333323333333620696E7365743B0D0A7D0D0A2E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6261646765207B0D0A20206261636B67726F756E642D636F6C6F72';
wwv_flow_api.g_varchar2_table(937) := '3A20233332333333363B0D0A2020636F6C6F723A20236633663366343B0D0A7D0D0A2E6A732D6E6176436F6C6C6170736564202E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C6576656C203E202E';
wwv_flow_api.g_varchar2_table(938) := '612D54726565566965772D636F6E74656E74202E612D54726565566965772D6C6162656C202E612D54726565566965772D6261646765207B0D0A20206261636B67726F756E642D636F6C6F723A20233332333333363B0D0A2020636F6C6F723A20236633';
wwv_flow_api.g_varchar2_table(939) := '663366343B0D0A2020626F782D736861646F773A206E6F6E653B0D0A7D0D0A0D0A2E742D547265654E61762D2D7374796C6542202E612D54726565566965772D6E6F64652D2D746F704C6576656C20756C207B0D0A20206261636B67726F756E642D636F';
wwv_flow_api.g_varchar2_table(940) := '6C6F723A207472616E73706172656E743B0D0A7D0D0A2E742D547265654E61762D2D7374796C6542202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702C';
wwv_flow_api.g_varchar2_table(941) := '0D0A2E742D547265654E61762D2D7374796C6542202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702E69732D73656C6563746564207B0D0A2020626163';
wwv_flow_api.g_varchar2_table(942) := '6B67726F756E642D636F6C6F723A20233332333333363B0D0A7D0D0A2E742D547265654E61762D2D7374796C6542202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E74';
wwv_flow_api.g_varchar2_table(943) := '2D2D746F702E69732D73656C6563746564202B202E612D54726565566965772D746F67676C652C0D0A2E742D547265654E61762D2D7374796C6542202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D63';
wwv_flow_api.g_varchar2_table(944) := '6F6E74656E742E69732D63757272656E742D2D746F70207B0D0A2020636F6C6F723A20236633663366343B0D0A7D0D0A2E742D547265654E61762D2D7374796C6542202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D547265';
wwv_flow_api.g_varchar2_table(945) := '65566965772D636F6E74656E742E69732D63757272656E742D2D746F702E69732D686F766572207B0D0A2020636F6C6F723A20236633663366342021696D706F7274616E743B0D0A7D0D0A2E742D547265654E61762D2D7374796C6542202E612D547265';
wwv_flow_api.g_varchar2_table(946) := '65566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702E69732D686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20233334333633392021696D706F7274';
wwv_flow_api.g_varchar2_table(947) := '616E743B0D0A7D0D0A2E742D547265654E61762D2D7374796C6542202E612D54726565566965772D6261646765207B0D0A20206261636B67726F756E642D636F6C6F723A20233332333333363B0D0A2020636F6C6F723A20236633663366343B0D0A2020';
wwv_flow_api.g_varchar2_table(948) := '626F782D736861646F773A206E6F6E653B0D0A7D0D0A0D0A2E742D56616C69646174696F6E2D64617465207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D56616C69646174696F6E2D75736572207B0D0A2020636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(949) := '3430343034303B0D0A7D0D0A2E742D426F64792D616374696F6E73202E742D56616C69646174696F6E2D64617465207B0D0A2020636F6C6F723A20233162316231623B0D0A7D0D0A2E742D426F64792D616374696F6E73202E742D56616C69646174696F';
wwv_flow_api.g_varchar2_table(950) := '6E2D75736572207B0D0A2020636F6C6F723A20233335333533353B0D0A7D0D0A0D0A2E742D4469616C6F672D706167652D2D77697A617264207B0D0A2020626F726465723A20236536653665363B0D0A7D0D0A2E742D57697A617264207B0D0A20206261';
wwv_flow_api.g_varchar2_table(951) := '636B67726F756E642D636F6C6F723A20236666666666663B0D0A2020626F726465722D7261646975733A203270783B0D0A2020626F726465722D636F6C6F723A20236536653665363B0D0A7D0D0A2E742D57697A617264202E742D57697A6172642D7469';
wwv_flow_api.g_varchar2_table(952) := '746C65207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D57697A617264202E742D57697A6172642D686561646572207B0D0A20206261636B67726F756E642D636F6C6F723A20236661666166613B0D0A2020626F726465722D636F';
wwv_flow_api.g_varchar2_table(953) := '6C6F723A20236564656465643B0D0A7D0D0A2E742D57697A61726453746570732D777261703A6166746572207B0D0A20206261636B67726F756E642D636F6C6F723A20236536653665363B0D0A7D0D0A2E742D57697A61726453746570732D7374657020';
wwv_flow_api.g_varchar2_table(954) := '2E742D57697A61726453746570732D6D61726B6572207B0D0A20206261636B67726F756E642D636F6C6F723A20236363636363633B0D0A7D0D0A2E742D57697A61726453746570732D737465702E69732D636F6D706C657465202E742D57697A61726453';
wwv_flow_api.g_varchar2_table(955) := '746570732D6D61726B6572207B0D0A20206261636B67726F756E642D636F6C6F723A20233362616132633B0D0A2020636F6C6F723A20234646463B0D0A7D0D0A2E742D57697A61726453746570732D737465702E69732D616374697665202E742D57697A';
wwv_flow_api.g_varchar2_table(956) := '61726453746570732D6D61726B6572207B0D0A20206261636B67726F756E642D636F6C6F723A20233332333333363B0D0A7D0D0A2E742D57697A61726453746570732D6C6162656C207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A612E';
wwv_flow_api.g_varchar2_table(957) := '742D57697A61726453746570732D777261705B687265665D3A686F766572202E742D57697A61726453746570732D6C6162656C2C0D0A612E742D57697A61726453746570732D777261705B687265665D3A666F637573202E742D57697A61726453746570';
wwv_flow_api.g_varchar2_table(958) := '732D6C6162656C207B0D0A2020636F6C6F723A20233035366262663B0D0A2020746578742D6465636F726174696F6E3A20756E6465726C696E653B0D0A7D0D0A612E742D57697A61726453746570732D777261705B687265665D3A666F637573202E742D';
wwv_flow_api.g_varchar2_table(959) := '57697A61726453746570732D6D61726B6572207B0D0A2020626F782D736861646F773A2030203020302031707820236666666666662C2030203020302032707820233035366262662C203020302031707820327078207267626128352C203130372C2031';
wwv_flow_api.g_varchar2_table(960) := '39312C20302E3235293B0D0A7D0D0A0D0A2E75692D776964676574207B0D0A2020666F6E742D66616D696C793A202748656C766574696361204E657565272C20275365676F65205549272C2048656C7665746963612C20417269616C2C2073616E732D73';
wwv_flow_api.g_varchar2_table(961) := '657269663B0D0A2020666F6E742D73697A653A20313270783B0D0A7D0D0A2E75692D776964676574202E75692D776964676574207B0D0A2020666F6E742D73697A653A20313270783B0D0A7D0D0A0D0A626F6479202E75692D7769646765742D636F6E74';
wwv_flow_api.g_varchar2_table(962) := '656E74207B0D0A2020626F726465722D636F6C6F723A20236562656265623B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A626F6479202E75692D776964676574';
wwv_flow_api.g_varchar2_table(963) := '2D636F6E74656E742061207B0D0A2020636F6C6F723A20233035366262663B0D0A7D0D0A626F6479202E75692D7769646765742D686561646572207B0D0A2020626F726465722D636F6C6F723A20236562656265623B0D0A20206261636B67726F756E64';
wwv_flow_api.g_varchar2_table(964) := '2D636F6C6F723A20236666666666663B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A626F6479202E75692D7769646765742D6865616465722061207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A0D0A626F6479202E7569';
wwv_flow_api.g_varchar2_table(965) := '2D73746174652D64656661756C742C0D0A626F6479202E75692D7769646765742D636F6E74656E74202E75692D73746174652D64656661756C742C0D0A626F6479202E75692D7769646765742D686561646572202E75692D73746174652D64656661756C';
wwv_flow_api.g_varchar2_table(966) := '74207B0D0A20206261636B67726F756E642D636F6C6F723A20236638663866383B0D0A2020636F6C6F723A20233338333833383B0D0A7D0D0A626F6479202E75692D73746174652D64656661756C7420612C0D0A626F6479202E75692D73746174652D64';
wwv_flow_api.g_varchar2_table(967) := '656661756C7420613A6C696E6B2C0D0A626F6479202E75692D73746174652D64656661756C7420613A766973697465642C0D0A626F6479202E75692D73746174652D61637469766520612C0D0A626F6479202E75692D73746174652D6163746976652061';
wwv_flow_api.g_varchar2_table(968) := '3A6C696E6B2C0D0A626F6479202E75692D73746174652D61637469766520613A76697369746564207B0D0A2020636F6C6F723A20233035366262663B0D0A7D0D0A626F6479202E75692D73746174652D686F7665722C0D0A626F6479202E75692D776964';
wwv_flow_api.g_varchar2_table(969) := '6765742D636F6E74656E74202E75692D73746174652D686F7665722C0D0A626F6479202E75692D7769646765742D686561646572202E75692D73746174652D686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B';
wwv_flow_api.g_varchar2_table(970) := '0D0A2020636F6C6F723A20233338333833383B0D0A7D0D0A626F6479202E75692D73746174652D666F6375732C0D0A626F6479202E75692D7769646765742D636F6E74656E74202E75692D73746174652D666F6375732C0D0A626F6479202E75692D7769';
wwv_flow_api.g_varchar2_table(971) := '646765742D686561646572202E75692D73746174652D666F637573207B0D0A2020626F782D736861646F773A20302030203020317078202330353662626620696E7365742C203020302031707820327078207267626128352C203130372C203139312C20';
wwv_flow_api.g_varchar2_table(972) := '302E3235292021696D706F7274616E743B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A2020636F6C6F723A20233338333833383B0D0A7D0D0A626F6479202E75692D646174657069636B6572202E75692D6461746570';
wwv_flow_api.g_varchar2_table(973) := '69636B65722D627574746F6E70616E6520627574746F6E3A666F637573207B0D0A20206F75746C696E653A206E6F6E653B0D0A2020626F782D736861646F773A20302030203020317078202330353662626620696E7365742C2030203020317078203270';
wwv_flow_api.g_varchar2_table(974) := '78207267626128352C203130372C203139312C20302E3235292021696D706F7274616E743B0D0A7D0D0A626F6479202E75692D73746174652D686F76657220612C0D0A626F6479202E75692D73746174652D686F76657220613A686F7665722C0D0A626F';
wwv_flow_api.g_varchar2_table(975) := '6479202E75692D73746174652D686F76657220613A6C696E6B2C0D0A626F6479202E75692D73746174652D686F76657220613A766973697465642C0D0A626F6479202E75692D73746174652D666F63757320612C0D0A626F6479202E75692D7374617465';
wwv_flow_api.g_varchar2_table(976) := '2D666F63757320613A686F7665722C0D0A626F6479202E75692D73746174652D666F63757320613A6C696E6B2C0D0A626F6479202E75692D73746174652D666F63757320613A76697369746564207B0D0A2020636F6C6F723A20233035366262663B0D0A';
wwv_flow_api.g_varchar2_table(977) := '7D0D0A626F6479202E75692D73746174652D6163746976652C0D0A626F6479202E75692D7769646765742D636F6E74656E74202E75692D73746174652D6163746976652C0D0A626F6479202E75692D7769646765742D686561646572202E75692D737461';
wwv_flow_api.g_varchar2_table(978) := '74652D616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A20236465646564653B0D0A2020636F6C6F723A20233338333833383B0D0A7D0D0A0D0A626F6479202E75692D73746174652D686967686C696768742C0D0A626F6479202E';
wwv_flow_api.g_varchar2_table(979) := '75692D7769646765742D636F6E74656E74202E75692D73746174652D686967686C696768742C0D0A626F6479202E75692D7769646765742D686561646572202E75692D73746174652D686967686C69676874207B0D0A20206261636B67726F756E642D63';
wwv_flow_api.g_varchar2_table(980) := '6F6C6F723A20236231623262363B0D0A2020636F6C6F723A20233161316131613B0D0A7D0D0A626F6479202E75692D73746174652D686967686C6967687420612C0D0A626F6479202E75692D7769646765742D636F6E74656E74202E75692D7374617465';
wwv_flow_api.g_varchar2_table(981) := '2D686967686C6967687420612C0D0A626F6479202E75692D7769646765742D686561646572202E75692D73746174652D686967686C696768742061207B0D0A2020636F6C6F723A20233161316131613B0D0A7D0D0A626F6479202E75692D73746174652D';
wwv_flow_api.g_varchar2_table(982) := '6572726F722C0D0A626F6479202E75692D7769646765742D636F6E74656E74202E75692D73746174652D6572726F722C0D0A626F6479202E75692D7769646765742D686561646572202E75692D73746174652D6572726F72207B0D0A20206261636B6772';
wwv_flow_api.g_varchar2_table(983) := '6F756E642D636F6C6F723A20236634343333363B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A626F6479202E75692D73746174652D6572726F7220612C0D0A626F6479202E75692D7769646765742D636F6E74656E74202E75692D737461';
wwv_flow_api.g_varchar2_table(984) := '74652D6572726F7220612C0D0A626F6479202E75692D7769646765742D686561646572202E75692D73746174652D6572726F722061207B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A626F6479202E75692D73746174652D6572726F722D';
wwv_flow_api.g_varchar2_table(985) := '746578742C0D0A626F6479202E75692D7769646765742D636F6E74656E74202E75692D73746174652D6572726F722D746578742C0D0A626F6479202E75692D7769646765742D686561646572202E75692D73746174652D6572726F722D74657874207B0D';
wwv_flow_api.g_varchar2_table(986) := '0A2020636F6C6F723A20236634343333363B0D0A7D0D0A0D0A626F6479202E75692D646174657069636B6572207464207370616E2E75692D73746174652D64656661756C742C0D0A626F6479202E75692D646174657069636B657220746420612E75692D';
wwv_flow_api.g_varchar2_table(987) := '73746174652D64656661756C74207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A626F6479202E75692D646174657069636B6572207464207370616E';
wwv_flow_api.g_varchar2_table(988) := '2E75692D73746174652D64656661756C742E75692D73746174652D6163746976652C0D0A626F6479202E75692D646174657069636B657220746420612E75692D73746174652D64656661756C742E75692D73746174652D616374697665207B0D0A202062';
wwv_flow_api.g_varchar2_table(989) := '61636B67726F756E642D636F6C6F723A20233332333333363B0D0A2020636F6C6F723A20236633663366343B0D0A2020666F6E742D7765696768743A20626F6C643B0D0A7D0D0A626F6479202E75692D646174657069636B6572207464207370616E2E75';
wwv_flow_api.g_varchar2_table(990) := '692D73746174652D64656661756C742E75692D73746174652D6163746976652E75692D73746174652D686F7665722C0D0A626F6479202E75692D646174657069636B657220746420612E75692D73746174652D64656661756C742E75692D73746174652D';
wwv_flow_api.g_varchar2_table(991) := '6163746976652E75692D73746174652D686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20233332333333362021696D706F7274616E743B0D0A7D0D0A626F6479202E75692D646174657069636B6572207464207370616E2E75692D';
wwv_flow_api.g_varchar2_table(992) := '73746174652D64656661756C742E75692D73746174652D686F7665722C0D0A626F6479202E75692D646174657069636B657220746420612E75692D73746174652D64656661756C742E75692D73746174652D686F766572207B0D0A20206261636B67726F';
wwv_flow_api.g_varchar2_table(993) := '756E642D636F6C6F723A20236632663266322021696D706F7274616E743B0D0A7D0D0A626F6479202E75692D646174657069636B6572207464207370616E2E75692D73746174652D64656661756C743A666F6375732C0D0A626F6479202E75692D646174';
wwv_flow_api.g_varchar2_table(994) := '657069636B657220746420612E75692D73746174652D64656661756C743A666F637573207B0D0A20206F75746C696E653A206E6F6E653B0D0A2020626F782D736861646F773A20302030203020317078202330353662626620696E7365742C2030203020';
wwv_flow_api.g_varchar2_table(995) := '31707820327078207267626128352C203130372C203139312C20302E3235292021696D706F7274616E743B0D0A7D0D0A626F6479202E75692D646174657069636B6572207464207370616E2E75692D73746174652D64656661756C742E75692D73746174';
wwv_flow_api.g_varchar2_table(996) := '652D686967686C696768742C0D0A626F6479202E75692D646174657069636B657220746420612E75692D73746174652D64656661756C742E75692D73746174652D686967686C69676874207B0D0A20206261636B67726F756E642D636F6C6F723A202365';
wwv_flow_api.g_varchar2_table(997) := '62656265623B0D0A7D0D0A626F6479202E75692D646174657069636B6572207468207B0D0A2020636F6C6F723A20233636363636363B0D0A7D0D0A626F6479202E75692D646174657069636B6572202E75692D646174657069636B65722D686561646572';
wwv_flow_api.g_varchar2_table(998) := '2C0D0A626F6479202E75692D646174657069636B6572202E75692D646174657069636B65722D627574746F6E70616E6520627574746F6E2C0D0A626F6479202E75692D646174657069636B6572202E75692D646174657069636B65722D6E6578742C0D0A';
wwv_flow_api.g_varchar2_table(999) := '626F6479202E75692D646174657069636B6572202E75692D646174657069636B65722D70726576207B0D0A2020626F726465722D7261646975733A203270783B0D0A7D0D0A0D0A626F6479202E75692D6469616C6F67202E75692D6469616C6F672D7469';
wwv_flow_api.g_varchar2_table(1000) := '746C65626172207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A2020626F726465722D626F74746F6D3A2031707820736F6C6964207267626128302C20302C20302C20302E3035293B0D0A7D0D0A626F6479202E7569';
wwv_flow_api.g_varchar2_table(1001) := '2D6469616C6F67202E75692D6469616C6F672D7469746C65207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A626F6479202E75692D6469616C6F67202E75692D6469616C6F672D636F6E74656E742C0D0A2E742D4469616C6F672D706167';
wwv_flow_api.g_varchar2_table(1002) := '65207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A0D0A2E742D4469616C6F672D2D77697A6172642E75692D6469616C6F672C0D0A2E742D4469616C6F672D2D';
wwv_flow_api.g_varchar2_table(1003) := '77697A6172642E75692D6469616C6F67202E75692D6469616C6F672D7469746C656261722C0D0A2E742D4469616C6F672D2D77697A61726420626F6479202E75692D6469616C6F67202E75692D6469616C6F672D636F6E74656E74207B0D0A2020626163';
wwv_flow_api.g_varchar2_table(1004) := '6B67726F756E642D636F6C6F723A20236666666666663B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D4469616C6F672D2D77697A6172642E75692D6469616C6F67202E75692D6469616C6F672D7469746C65207B0D0A2020636F6C';
wwv_flow_api.g_varchar2_table(1005) := '6F723A20233236323632363B0D0A7D0D0A0D0A626F6479202E75692D636F726E65722D616C6C207B0D0A2020626F726465722D7261646975733A203270783B0D0A7D0D0A626F6479202E75692D636F726E65722D746F702C0D0A626F6479202E75692D63';
wwv_flow_api.g_varchar2_table(1006) := '6F726E65722D6C6566742C0D0A626F6479202E75692D636F726E65722D746C207B0D0A2020626F726465722D746F702D6C6566742D7261646975733A203270783B0D0A7D0D0A626F6479202E75692D636F726E65722D746F702C0D0A626F6479202E7569';
wwv_flow_api.g_varchar2_table(1007) := '2D636F726E65722D72696768742C0D0A626F6479202E75692D636F726E65722D7472207B0D0A2020626F726465722D746F702D72696768742D7261646975733A203270783B0D0A7D0D0A626F6479202E75692D636F726E65722D626F74746F6D2C0D0A62';
wwv_flow_api.g_varchar2_table(1008) := '6F6479202E75692D636F726E65722D6C6566742C0D0A626F6479202E75692D636F726E65722D626C207B0D0A2020626F726465722D626F74746F6D2D6C6566742D7261646975733A203270783B0D0A7D0D0A626F6479202E75692D636F726E65722D626F';
wwv_flow_api.g_varchar2_table(1009) := '74746F6D2C0D0A626F6479202E75692D636F726E65722D72696768742C0D0A626F6479202E75692D636F726E65722D6272207B0D0A2020626F726465722D626F74746F6D2D72696768742D7261646975733A203270783B0D0A7D0D0A0D0A626F6479202E';
wwv_flow_api.g_varchar2_table(1010) := '75692D627574746F6E2E75692D636F726E65722D616C6C207B0D0A2020626F726465722D7261646975733A203270783B0D0A7D0D0A626F6479202E75692D627574746F6E2E75692D636F726E65722D746F702C0D0A626F6479202E75692D627574746F6E';
wwv_flow_api.g_varchar2_table(1011) := '2E75692D636F726E65722D6C6566742C0D0A626F6479202E75692D627574746F6E2E75692D636F726E65722D746C207B0D0A2020626F726465722D746F702D6C6566742D7261646975733A203270783B0D0A7D0D0A626F6479202E75692D627574746F6E';
wwv_flow_api.g_varchar2_table(1012) := '2E75692D636F726E65722D746F702C0D0A626F6479202E75692D627574746F6E2E75692D636F726E65722D72696768742C0D0A626F6479202E75692D627574746F6E2E75692D636F726E65722D7472207B0D0A2020626F726465722D746F702D72696768';
wwv_flow_api.g_varchar2_table(1013) := '742D7261646975733A203270783B0D0A7D0D0A626F6479202E75692D627574746F6E2E75692D636F726E65722D626F74746F6D2C0D0A626F6479202E75692D627574746F6E2E75692D636F726E65722D6C6566742C0D0A626F6479202E75692D62757474';
wwv_flow_api.g_varchar2_table(1014) := '6F6E2E75692D636F726E65722D626C207B0D0A2020626F726465722D626F74746F6D2D6C6566742D7261646975733A203270783B0D0A7D0D0A626F6479202E75692D627574746F6E2E75692D636F726E65722D626F74746F6D2C0D0A626F6479202E7569';
wwv_flow_api.g_varchar2_table(1015) := '2D627574746F6E2E75692D636F726E65722D72696768742C0D0A626F6479202E75692D627574746F6E2E75692D636F726E65722D6272207B0D0A2020626F726465722D626F74746F6D2D72696768742D7261646975733A203270783B0D0A7D0D0A626F64';
wwv_flow_api.g_varchar2_table(1016) := '79202E75692D6469616C6F67202E75692D6469616C6F672D7469746C656261722D636C6F7365207B0D0A2020626F726465722D7261646975733A20313030253B0D0A7D0D0A626F6479202E75692D6469616C6F67202E75692D6469616C6F672D62757474';
wwv_flow_api.g_varchar2_table(1017) := '6F6E70616E65207B0D0A2020626F726465722D746F702D636F6C6F723A20236562656265623B0D0A7D0D0A0D0A2E752D7761726E696E67207B0D0A20206261636B67726F756E642D636F6C6F723A20236662636534612021696D706F7274616E743B0D0A';
wwv_flow_api.g_varchar2_table(1018) := '2020636F6C6F723A20233434333330323B0D0A7D0D0A2E752D7761726E696E672D74657874207B0D0A2020636F6C6F723A20236662636534612021696D706F7274616E743B0D0A7D0D0A2E752D7761726E696E672D6267207B0D0A20206261636B67726F';
wwv_flow_api.g_varchar2_table(1019) := '756E642D636F6C6F723A20236662636534612021696D706F7274616E743B0D0A7D0D0A2E752D7761726E696E672D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236662636534612021696D706F7274616E743B0D0A7D0D0A0D0A2E75';
wwv_flow_api.g_varchar2_table(1020) := '2D73756363657373207B0D0A20206261636B67726F756E642D636F6C6F723A20233362616132632021696D706F7274616E743B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E752D737563636573732D74657874207B0D0A2020636F6C6F';
wwv_flow_api.g_varchar2_table(1021) := '723A20233362616132632021696D706F7274616E743B0D0A7D0D0A2E752D737563636573732D6267207B0D0A20206261636B67726F756E642D636F6C6F723A20233362616132632021696D706F7274616E743B0D0A7D0D0A2E752D737563636573732D62';
wwv_flow_api.g_varchar2_table(1022) := '6F72646572207B0D0A2020626F726465722D636F6C6F723A20233362616132632021696D706F7274616E743B0D0A7D0D0A0D0A2E752D64616E676572207B0D0A20206261636B67726F756E642D636F6C6F723A20236634343333362021696D706F727461';
wwv_flow_api.g_varchar2_table(1023) := '6E743B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E752D64616E6765722D74657874207B0D0A2020636F6C6F723A20236634343333362021696D706F7274616E743B0D0A7D0D0A2E752D64616E6765722D6267207B0D0A20206261636B';
wwv_flow_api.g_varchar2_table(1024) := '67726F756E642D636F6C6F723A20236634343333362021696D706F7274616E743B0D0A7D0D0A2E752D64616E6765722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236634343333362021696D706F7274616E743B0D0A7D0D0A0D0A';
wwv_flow_api.g_varchar2_table(1025) := '2E752D696E666F207B0D0A20206261636B67726F756E642D636F6C6F723A20233030373664662021696D706F7274616E743B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E752D696E666F2D74657874207B0D0A2020636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(1026) := '3030373664662021696D706F7274616E743B0D0A7D0D0A2E752D696E666F2D6267207B0D0A20206261636B67726F756E642D636F6C6F723A20233030373664662021696D706F7274616E743B0D0A7D0D0A2E752D696E666F2D626F72646572207B0D0A20';
wwv_flow_api.g_varchar2_table(1027) := '20626F726465722D636F6C6F723A20233030373664662021696D706F7274616E743B0D0A7D0D0A0D0A2E752D686F74207B0D0A20206261636B67726F756E642D636F6C6F723A20233332333333362021696D706F7274616E743B0D0A2020636F6C6F723A';
wwv_flow_api.g_varchar2_table(1028) := '20236666666666663B0D0A7D0D0A2E752D686F742D74657874207B0D0A2020636F6C6F723A20233332333333362021696D706F7274616E743B0D0A7D0D0A2E752D686F742D6267207B0D0A20206261636B67726F756E642D636F6C6F723A202333323333';
wwv_flow_api.g_varchar2_table(1029) := '33362021696D706F7274616E743B0D0A7D0D0A2E752D686F742D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233332333333362021696D706F7274616E743B0D0A7D0D0A0D0A2E752D6E6F726D616C207B0D0A20206261636B67726F';
wwv_flow_api.g_varchar2_table(1030) := '756E642D636F6C6F723A20236638663866382021696D706F7274616E743B0D0A2020636F6C6F723A20233166316631663B0D0A7D0D0A2E752D6E6F726D616C2D74657874207B0D0A2020636F6C6F723A20233166316631662021696D706F7274616E743B';
wwv_flow_api.g_varchar2_table(1031) := '0D0A7D0D0A2E752D6E6F726D616C2D6267207B0D0A20206261636B67726F756E642D636F6C6F723A20233166316631662021696D706F7274616E743B0D0A7D0D0A2E752D6E6F726D616C2D626F72646572207B0D0A2020626F726465722D636F6C6F723A';
wwv_flow_api.g_varchar2_table(1032) := '20233166316631662021696D706F7274616E743B0D0A7D0D0A0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203129202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20233330396664623B0D';
wwv_flow_api.g_varchar2_table(1033) := '0A202066696C6C3A20233330396664623B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203129202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A';
wwv_flow_api.g_varchar2_table(1034) := '6E74682D6368696C642834356E202B203129202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233330396664623B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C64283435';
wwv_flow_api.g_varchar2_table(1035) := '6E202B203129202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203129202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20233330396664623B0D0A7D0D0A2E752D636F6C6F';
wwv_flow_api.g_varchar2_table(1036) := '7273203E203A6E74682D6368696C642834356E202B203129202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203129202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D63';
wwv_flow_api.g_varchar2_table(1037) := '6F6C6F723A20233330396664623B0D0A20207374726F6B653A20233330396664623B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203229202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F';
wwv_flow_api.g_varchar2_table(1038) := '723A20233133623663663B0D0A202066696C6C3A20233133623663663B0D0A2020636F6C6F723A20236534663966643B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203229202E752D636F6C6F722D62672C0D0A2E';
wwv_flow_api.g_varchar2_table(1039) := '752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203229202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233133623663663B0D0A7D0D0A2E752D636F6C6F7273203E203A';
wwv_flow_api.g_varchar2_table(1040) := '6E74682D6368696C642834356E202B203229202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203229202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20233133623663663B';
wwv_flow_api.g_varchar2_table(1041) := '0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203229202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203229202E752D636F6C6F722D626F72646572207B';
wwv_flow_api.g_varchar2_table(1042) := '0D0A2020626F726465722D636F6C6F723A20233133623663663B0D0A20207374726F6B653A20233133623663663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203329202E752D636F6C6F72207B0D0A2020626163';
wwv_flow_api.g_varchar2_table(1043) := '6B67726F756E642D636F6C6F723A20233265626662633B0D0A202066696C6C3A20233265626662633B0D0A2020636F6C6F723A20236630666366623B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203329202E752D';
wwv_flow_api.g_varchar2_table(1044) := '636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203329202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233265626662633B0D0A7D0D0A2E';
wwv_flow_api.g_varchar2_table(1045) := '752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203329202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203329202E752D636F6C6F722D74657874207B0D0A2020636F6C';
wwv_flow_api.g_varchar2_table(1046) := '6F723A20233265626662633B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203329202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203329202E752D636F';
wwv_flow_api.g_varchar2_table(1047) := '6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233265626662633B0D0A20207374726F6B653A20233265626662633B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203429202E752D636F';
wwv_flow_api.g_varchar2_table(1048) := '6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20233363616638353B0D0A202066696C6C3A20233363616638353B0D0A2020636F6C6F723A20236630666166363B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C6428';
wwv_flow_api.g_varchar2_table(1049) := '34356E202B203429202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203429202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A202333';
wwv_flow_api.g_varchar2_table(1050) := '63616638353B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203429202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203429202E752D636F6C6F722D74';
wwv_flow_api.g_varchar2_table(1051) := '657874207B0D0A2020636F6C6F723A20233363616638353B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203429202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C64283435';
wwv_flow_api.g_varchar2_table(1052) := '6E202B203429202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233363616638353B0D0A20207374726F6B653A20233363616638353B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C64283435';
wwv_flow_api.g_varchar2_table(1053) := '6E202B203529202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20233831626235663B0D0A202066696C6C3A20233831626235663B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E752D636F6C6F7273203E';
wwv_flow_api.g_varchar2_table(1054) := '203A6E74682D6368696C642834356E202B203529202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203529202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F75';
wwv_flow_api.g_varchar2_table(1055) := '6E642D636F6C6F723A20233831626235663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203529202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B2035';
wwv_flow_api.g_varchar2_table(1056) := '29202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20233831626235663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203529202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A';
wwv_flow_api.g_varchar2_table(1057) := '6E74682D6368696C642834356E202B203529202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233831626235663B0D0A20207374726F6B653A20233831626235663B0D0A7D0D0A2E752D636F6C6F7273203E203A';
wwv_flow_api.g_varchar2_table(1058) := '6E74682D6368696C642834356E202B203629202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20236464646535333B0D0A202066696C6C3A20236464646535333B0D0A2020636F6C6F723A20233261326130383B0D0A7D0D';
wwv_flow_api.g_varchar2_table(1059) := '0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203629202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203629202E752D636F6C6F722D6261636B67726F756E64207B';
wwv_flow_api.g_varchar2_table(1060) := '0D0A20206261636B67726F756E642D636F6C6F723A20236464646535333B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203629202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D63';
wwv_flow_api.g_varchar2_table(1061) := '68696C642834356E202B203629202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20236464646535333B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203629202E752D636F6C6F722D62642C0D0A2E';
wwv_flow_api.g_varchar2_table(1062) := '752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203629202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236464646535333B0D0A20207374726F6B653A20236464646535333B0D0A7D0D0A2E';
wwv_flow_api.g_varchar2_table(1063) := '752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203729202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20236662636534613B0D0A202066696C6C3A20236662636534613B0D0A2020636F6C6F723A20';
wwv_flow_api.g_varchar2_table(1064) := '233434333330323B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203729202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203729202E752D636F6C6F722D';
wwv_flow_api.g_varchar2_table(1065) := '6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236662636534613B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203729202E752D636F6C6F722D7478742C0D0A2E752D636F6C';
wwv_flow_api.g_varchar2_table(1066) := '6F7273203E203A6E74682D6368696C642834356E202B203729202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20236662636534613B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203729202E752D';
wwv_flow_api.g_varchar2_table(1067) := '636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203729202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236662636534613B0D0A20207374726F6B653A202366';
wwv_flow_api.g_varchar2_table(1068) := '62636534613B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203829202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20236564383133653B0D0A202066696C6C3A2023656438313365';
wwv_flow_api.g_varchar2_table(1069) := '3B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203829202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20';
wwv_flow_api.g_varchar2_table(1070) := '3829202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236564383133653B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203829202E752D636F6C6F722D';
wwv_flow_api.g_varchar2_table(1071) := '7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203829202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20236564383133653B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C6428';
wwv_flow_api.g_varchar2_table(1072) := '34356E202B203829202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203829202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236564383133653B0D0A';
wwv_flow_api.g_varchar2_table(1073) := '20207374726F6B653A20236564383133653B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203929202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20236539356235343B0D0A202066';
wwv_flow_api.g_varchar2_table(1074) := '696C6C3A20236539356235343B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203929202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D';
wwv_flow_api.g_varchar2_table(1075) := '6368696C642834356E202B203929202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236539356235343B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20';
wwv_flow_api.g_varchar2_table(1076) := '3929202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203929202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20236539356235343B0D0A7D0D0A2E752D636F6C6F7273203E';
wwv_flow_api.g_varchar2_table(1077) := '203A6E74682D6368696C642834356E202B203929202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203929202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F72';
wwv_flow_api.g_varchar2_table(1078) := '3A20236539356235343B0D0A20207374726F6B653A20236539356235343B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313029202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20';
wwv_flow_api.g_varchar2_table(1079) := '236538356438383B0D0A202066696C6C3A20236538356438383B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313029202E752D636F6C6F722D62672C0D0A2E752D';
wwv_flow_api.g_varchar2_table(1080) := '636F6C6F7273203E203A6E74682D6368696C642834356E202B20313029202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236538356438383B0D0A7D0D0A2E752D636F6C6F7273203E203A6E';
wwv_flow_api.g_varchar2_table(1081) := '74682D6368696C642834356E202B20313029202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313029202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A2023653835643838';
wwv_flow_api.g_varchar2_table(1082) := '3B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313029202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313029202E752D636F6C6F722D626F726465';
wwv_flow_api.g_varchar2_table(1083) := '72207B0D0A2020626F726465722D636F6C6F723A20236538356438383B0D0A20207374726F6B653A20236538356438383B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313129202E752D636F6C6F72207B0D0A20';
wwv_flow_api.g_varchar2_table(1084) := '206261636B67726F756E642D636F6C6F723A20236361353839643B0D0A202066696C6C3A20236361353839643B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203131';
wwv_flow_api.g_varchar2_table(1085) := '29202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313129202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236361353839643B';
wwv_flow_api.g_varchar2_table(1086) := '0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313129202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313129202E752D636F6C6F722D7465787420';
wwv_flow_api.g_varchar2_table(1087) := '7B0D0A2020636F6C6F723A20236361353839643B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313129202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B';
wwv_flow_api.g_varchar2_table(1088) := '20313129202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236361353839643B0D0A20207374726F6B653A20236361353839643B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E20';
wwv_flow_api.g_varchar2_table(1089) := '2B20313229202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20233835346539623B0D0A202066696C6C3A20233835346539623B0D0A2020636F6C6F723A20236636663066383B0D0A7D0D0A2E752D636F6C6F7273203E20';
wwv_flow_api.g_varchar2_table(1090) := '3A6E74682D6368696C642834356E202B20313229202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313229202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F';
wwv_flow_api.g_varchar2_table(1091) := '756E642D636F6C6F723A20233835346539623B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313229202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B';
wwv_flow_api.g_varchar2_table(1092) := '20313229202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20233835346539623B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313229202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273';
wwv_flow_api.g_varchar2_table(1093) := '203E203A6E74682D6368696C642834356E202B20313229202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233835346539623B0D0A20207374726F6B653A20233835346539623B0D0A7D0D0A2E752D636F6C6F72';
wwv_flow_api.g_varchar2_table(1094) := '73203E203A6E74682D6368696C642834356E202B20313329202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20233561363861643B0D0A202066696C6C3A20233561363861643B0D0A2020636F6C6F723A20236666666666';
wwv_flow_api.g_varchar2_table(1095) := '663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313329202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313329202E752D636F6C6F722D6261636B';
wwv_flow_api.g_varchar2_table(1096) := '67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233561363861643B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313329202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273';
wwv_flow_api.g_varchar2_table(1097) := '203E203A6E74682D6368696C642834356E202B20313329202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20233561363861643B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313329202E752D63';
wwv_flow_api.g_varchar2_table(1098) := '6F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313329202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233561363861643B0D0A20207374726F6B653A202335';
wwv_flow_api.g_varchar2_table(1099) := '61363861643B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313429202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20236166626163353B0D0A202066696C6C3A20236166626163';
wwv_flow_api.g_varchar2_table(1100) := '353B0D0A2020636F6C6F723A20233331336134343B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313429202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E20';
wwv_flow_api.g_varchar2_table(1101) := '2B20313429202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236166626163353B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313429202E752D636F';
wwv_flow_api.g_varchar2_table(1102) := '6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313429202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20236166626163353B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D63';
wwv_flow_api.g_varchar2_table(1103) := '68696C642834356E202B20313429202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313429202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236166';
wwv_flow_api.g_varchar2_table(1104) := '626163353B0D0A20207374726F6B653A20236166626163353B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313529202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A202336653835';
wwv_flow_api.g_varchar2_table(1105) := '39383B0D0A202066696C6C3A20233665383539383B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313529202E752D636F6C6F722D62672C0D0A2E752D636F6C6F72';
wwv_flow_api.g_varchar2_table(1106) := '73203E203A6E74682D6368696C642834356E202B20313529202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233665383539383B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368';
wwv_flow_api.g_varchar2_table(1107) := '696C642834356E202B20313529202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313529202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20233665383539383B0D0A7D0D';
wwv_flow_api.g_varchar2_table(1108) := '0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313529202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313529202E752D636F6C6F722D626F72646572207B0D0A';
wwv_flow_api.g_varchar2_table(1109) := '2020626F726465722D636F6C6F723A20233665383539383B0D0A20207374726F6B653A20233665383539383B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313629202E752D636F6C6F72207B0D0A20206261636B';
wwv_flow_api.g_varchar2_table(1110) := '67726F756E642D636F6C6F723A20233539623265323B0D0A202066696C6C3A20233539623265323B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313629202E752D';
wwv_flow_api.g_varchar2_table(1111) := '636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313629202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233539623265323B0D0A7D0D0A';
wwv_flow_api.g_varchar2_table(1112) := '2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313629202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313629202E752D636F6C6F722D74657874207B0D0A2020';
wwv_flow_api.g_varchar2_table(1113) := '636F6C6F723A20233539623265323B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313629202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B2031362920';
wwv_flow_api.g_varchar2_table(1114) := '2E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233539623265323B0D0A20207374726F6B653A20233539623265323B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313729';
wwv_flow_api.g_varchar2_table(1115) := '202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20233432633564393B0D0A202066696C6C3A20233432633564393B0D0A2020636F6C6F723A20233035313531373B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D';
wwv_flow_api.g_varchar2_table(1116) := '6368696C642834356E202B20313729202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313729202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D63';
wwv_flow_api.g_varchar2_table(1117) := '6F6C6F723A20233432633564393B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313729202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B2031372920';
wwv_flow_api.g_varchar2_table(1118) := '2E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20233432633564393B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313729202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E';
wwv_flow_api.g_varchar2_table(1119) := '74682D6368696C642834356E202B20313729202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233432633564393B0D0A20207374726F6B653A20233432633564393B0D0A7D0D0A2E752D636F6C6F7273203E203A';
wwv_flow_api.g_varchar2_table(1120) := '6E74682D6368696C642834356E202B20313829202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20233538636363393B0D0A202066696C6C3A20233538636363393B0D0A2020636F6C6F723A20233039316331633B0D0A7D';
wwv_flow_api.g_varchar2_table(1121) := '0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313829202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313829202E752D636F6C6F722D6261636B67726F756E';
wwv_flow_api.g_varchar2_table(1122) := '64207B0D0A20206261636B67726F756E642D636F6C6F723A20233538636363393B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313829202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E';
wwv_flow_api.g_varchar2_table(1123) := '74682D6368696C642834356E202B20313829202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20233538636363393B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313829202E752D636F6C6F722D';
wwv_flow_api.g_varchar2_table(1124) := '62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313829202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233538636363393B0D0A20207374726F6B653A2023353863636339';
wwv_flow_api.g_varchar2_table(1125) := '3B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313929202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20233633626639643B0D0A202066696C6C3A20233633626639643B0D0A20';
wwv_flow_api.g_varchar2_table(1126) := '20636F6C6F723A20236666666666663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313929202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313929';
wwv_flow_api.g_varchar2_table(1127) := '202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233633626639643B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313929202E752D636F6C6F722D74';
wwv_flow_api.g_varchar2_table(1128) := '78742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313929202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20233633626639643B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C6428';
wwv_flow_api.g_varchar2_table(1129) := '34356E202B20313929202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313929202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233633626639643B';
wwv_flow_api.g_varchar2_table(1130) := '0D0A20207374726F6B653A20233633626639643B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323029202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20233961633937663B0D0A';
wwv_flow_api.g_varchar2_table(1131) := '202066696C6C3A20233961633937663B0D0A2020636F6C6F723A20233230333331363B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323029202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A';
wwv_flow_api.g_varchar2_table(1132) := '6E74682D6368696C642834356E202B20323029202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233961633937663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834';
wwv_flow_api.g_varchar2_table(1133) := '356E202B20323029202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323029202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20233961633937663B0D0A7D0D0A2E752D63';
wwv_flow_api.g_varchar2_table(1134) := '6F6C6F7273203E203A6E74682D6368696C642834356E202B20323029202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323029202E752D636F6C6F722D626F72646572207B0D0A2020626F72';
wwv_flow_api.g_varchar2_table(1135) := '6465722D636F6C6F723A20233961633937663B0D0A20207374726F6B653A20233961633937663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323129202E752D636F6C6F72207B0D0A20206261636B67726F756E';
wwv_flow_api.g_varchar2_table(1136) := '642D636F6C6F723A20236534653537353B0D0A202066696C6C3A20236534653537353B0D0A2020636F6C6F723A20233463346330663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323129202E752D636F6C6F72';
wwv_flow_api.g_varchar2_table(1137) := '2D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323129202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236534653537353B0D0A7D0D0A2E752D636F';
wwv_flow_api.g_varchar2_table(1138) := '6C6F7273203E203A6E74682D6368696C642834356E202B20323129202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323129202E752D636F6C6F722D74657874207B0D0A2020636F6C6F72';
wwv_flow_api.g_varchar2_table(1139) := '3A20236534653537353B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323129202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323129202E752D636F';
wwv_flow_api.g_varchar2_table(1140) := '6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236534653537353B0D0A20207374726F6B653A20236534653537353B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323229202E752D63';
wwv_flow_api.g_varchar2_table(1141) := '6F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20236663643836653B0D0A202066696C6C3A20236663643836653B0D0A2020636F6C6F723A20233639346630323B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C64';
wwv_flow_api.g_varchar2_table(1142) := '2834356E202B20323229202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323229202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A';
wwv_flow_api.g_varchar2_table(1143) := '20236663643836653B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323229202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323229202E752D636F';
wwv_flow_api.g_varchar2_table(1144) := '6C6F722D74657874207B0D0A2020636F6C6F723A20236663643836653B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323229202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368';
wwv_flow_api.g_varchar2_table(1145) := '696C642834356E202B20323229202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236663643836653B0D0A20207374726F6B653A20236663643836653B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D63';
wwv_flow_api.g_varchar2_table(1146) := '68696C642834356E202B20323329202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20236631396136353B0D0A202066696C6C3A20236631396136353B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E752D';
wwv_flow_api.g_varchar2_table(1147) := '636F6C6F7273203E203A6E74682D6368696C642834356E202B20323329202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323329202E752D636F6C6F722D6261636B67726F756E64207B0D0A';
wwv_flow_api.g_varchar2_table(1148) := '20206261636B67726F756E642D636F6C6F723A20236631396136353B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323329202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368';
wwv_flow_api.g_varchar2_table(1149) := '696C642834356E202B20323329202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20236631396136353B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323329202E752D636F6C6F722D62642C0D0A';
wwv_flow_api.g_varchar2_table(1150) := '2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323329202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236631396136353B0D0A20207374726F6B653A20236631396136353B0D0A7D0D';
wwv_flow_api.g_varchar2_table(1151) := '0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323429202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20236564376337363B0D0A202066696C6C3A20236564376337363B0D0A2020636F6C6F';
wwv_flow_api.g_varchar2_table(1152) := '723A20236666666666663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323429202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323429202E752D63';
wwv_flow_api.g_varchar2_table(1153) := '6F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236564376337363B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323429202E752D636F6C6F722D7478742C0D0A';
wwv_flow_api.g_varchar2_table(1154) := '2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323429202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20236564376337363B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B';
wwv_flow_api.g_varchar2_table(1155) := '20323429202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323429202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236564376337363B0D0A202073';
wwv_flow_api.g_varchar2_table(1156) := '74726F6B653A20236564376337363B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323529202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20236564376461303B0D0A202066696C';
wwv_flow_api.g_varchar2_table(1157) := '6C3A20236564376461303B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323529202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D63';
wwv_flow_api.g_varchar2_table(1158) := '68696C642834356E202B20323529202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236564376461303B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20';
wwv_flow_api.g_varchar2_table(1159) := '323529202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323529202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20236564376461303B0D0A7D0D0A2E752D636F6C6F7273';
wwv_flow_api.g_varchar2_table(1160) := '203E203A6E74682D6368696C642834356E202B20323529202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323529202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D63';
wwv_flow_api.g_varchar2_table(1161) := '6F6C6F723A20236564376461303B0D0A20207374726F6B653A20236564376461303B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323629202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C';
wwv_flow_api.g_varchar2_table(1162) := '6F723A20236435373962313B0D0A202066696C6C3A20236435373962313B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323629202E752D636F6C6F722D62672C0D';
wwv_flow_api.g_varchar2_table(1163) := '0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323629202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236435373962313B0D0A7D0D0A2E752D636F6C6F727320';
wwv_flow_api.g_varchar2_table(1164) := '3E203A6E74682D6368696C642834356E202B20323629202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323629202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20236435';
wwv_flow_api.g_varchar2_table(1165) := '373962313B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323629202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323629202E752D636F6C6F722D62';
wwv_flow_api.g_varchar2_table(1166) := '6F72646572207B0D0A2020626F726465722D636F6C6F723A20236435373962313B0D0A20207374726F6B653A20236435373962313B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323729202E752D636F6C6F7220';
wwv_flow_api.g_varchar2_table(1167) := '7B0D0A20206261636B67726F756E642D636F6C6F723A20233964373161663B0D0A202066696C6C3A20233964373161663B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E20';
wwv_flow_api.g_varchar2_table(1168) := '2B20323729202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323729202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A2023396437';
wwv_flow_api.g_varchar2_table(1169) := '3161663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323729202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323729202E752D636F6C6F722D74';
wwv_flow_api.g_varchar2_table(1170) := '657874207B0D0A2020636F6C6F723A20233964373161663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323729202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834';
wwv_flow_api.g_varchar2_table(1171) := '356E202B20323729202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233964373161663B0D0A20207374726F6B653A20233964373161663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C6428';
wwv_flow_api.g_varchar2_table(1172) := '34356E202B20323829202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20233762383662643B0D0A202066696C6C3A20233762383662643B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E752D636F6C6F72';
wwv_flow_api.g_varchar2_table(1173) := '73203E203A6E74682D6368696C642834356E202B20323829202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323829202E752D636F6C6F722D6261636B67726F756E64207B0D0A2020626163';
wwv_flow_api.g_varchar2_table(1174) := '6B67726F756E642D636F6C6F723A20233762383662643B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323829202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834';
wwv_flow_api.g_varchar2_table(1175) := '356E202B20323829202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20233762383662643B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323829202E752D636F6C6F722D62642C0D0A2E752D636F';
wwv_flow_api.g_varchar2_table(1176) := '6C6F7273203E203A6E74682D6368696C642834356E202B20323829202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233762383662643B0D0A20207374726F6B653A20233762383662643B0D0A7D0D0A2E752D63';
wwv_flow_api.g_varchar2_table(1177) := '6F6C6F7273203E203A6E74682D6368696C642834356E202B20323929202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20236266633864313B0D0A202066696C6C3A20236266633864313B0D0A2020636F6C6F723A202333';
wwv_flow_api.g_varchar2_table(1178) := '64343835343B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323929202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323929202E752D636F6C6F722D';
wwv_flow_api.g_varchar2_table(1179) := '6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236266633864313B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323929202E752D636F6C6F722D7478742C0D0A2E752D636F';
wwv_flow_api.g_varchar2_table(1180) := '6C6F7273203E203A6E74682D6368696C642834356E202B20323929202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20236266633864313B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B2032392920';
wwv_flow_api.g_varchar2_table(1181) := '2E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323929202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236266633864313B0D0A20207374726F6B65';
wwv_flow_api.g_varchar2_table(1182) := '3A20236266633864313B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333029202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20233862396461643B0D0A202066696C6C3A202338';
wwv_flow_api.g_varchar2_table(1183) := '62396461643B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333029202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C6428';
wwv_flow_api.g_varchar2_table(1184) := '34356E202B20333029202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233862396461643B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333029202E';
wwv_flow_api.g_varchar2_table(1185) := '752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333029202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20233862396461643B0D0A7D0D0A2E752D636F6C6F7273203E203A6E';
wwv_flow_api.g_varchar2_table(1186) := '74682D6368696C642834356E202B20333029202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333029202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A';
wwv_flow_api.g_varchar2_table(1187) := '20233862396461643B0D0A20207374726F6B653A20233862396461643B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333129202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(1188) := '3139386363613B0D0A202066696C6C3A20233139386363613B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333129202E752D636F6C6F722D62672C0D0A2E752D63';
wwv_flow_api.g_varchar2_table(1189) := '6F6C6F7273203E203A6E74682D6368696C642834356E202B20333129202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233139386363613B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74';
wwv_flow_api.g_varchar2_table(1190) := '682D6368696C642834356E202B20333129202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333129202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20233139386363613B';
wwv_flow_api.g_varchar2_table(1191) := '0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333129202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333129202E752D636F6C6F722D626F72646572';
wwv_flow_api.g_varchar2_table(1192) := '207B0D0A2020626F726465722D636F6C6F723A20233139386363613B0D0A20207374726F6B653A20233139386363613B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333229202E752D636F6C6F72207B0D0A2020';
wwv_flow_api.g_varchar2_table(1193) := '6261636B67726F756E642D636F6C6F723A20233032613562653B0D0A202066696C6C3A20233032613562653B0D0A2020636F6C6F723A20233030303030303B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333229';
wwv_flow_api.g_varchar2_table(1194) := '202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333229202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233032613562653B0D';
wwv_flow_api.g_varchar2_table(1195) := '0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333229202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333229202E752D636F6C6F722D74657874207B';
wwv_flow_api.g_varchar2_table(1196) := '0D0A2020636F6C6F723A20233032613562653B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333229202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20';
wwv_flow_api.g_varchar2_table(1197) := '333229202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233032613562653B0D0A20207374726F6B653A20233032613562653B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B';
wwv_flow_api.g_varchar2_table(1198) := '20333329202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20233138623161653B0D0A202066696C6C3A20233138623161653B0D0A2020636F6C6F723A20233030303030303B0D0A7D0D0A2E752D636F6C6F7273203E203A';
wwv_flow_api.g_varchar2_table(1199) := '6E74682D6368696C642834356E202B20333329202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333329202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F75';
wwv_flow_api.g_varchar2_table(1200) := '6E642D636F6C6F723A20233138623161653B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333329202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20';
wwv_flow_api.g_varchar2_table(1201) := '333329202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20233138623161653B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333329202E752D636F6C6F722D62642C0D0A2E752D636F6C6F727320';
wwv_flow_api.g_varchar2_table(1202) := '3E203A6E74682D6368696C642834356E202B20333329202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233138623161653B0D0A20207374726F6B653A20233138623161653B0D0A7D0D0A2E752D636F6C6F7273';
wwv_flow_api.g_varchar2_table(1203) := '203E203A6E74682D6368696C642834356E202B20333429202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20233234613437353B0D0A202066696C6C3A20233234613437353B0D0A2020636F6C6F723A2023656666626637';
wwv_flow_api.g_varchar2_table(1204) := '3B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333429202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333429202E752D636F6C6F722D6261636B67';
wwv_flow_api.g_varchar2_table(1205) := '726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233234613437353B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333429202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F727320';
wwv_flow_api.g_varchar2_table(1206) := '3E203A6E74682D6368696C642834356E202B20333429202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20233234613437353B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333429202E752D636F';
wwv_flow_api.g_varchar2_table(1207) := '6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333429202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233234613437353B0D0A20207374726F6B653A20233234';
wwv_flow_api.g_varchar2_table(1208) := '613437353B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333529202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20233661616434323B0D0A202066696C6C3A2023366161643432';
wwv_flow_api.g_varchar2_table(1209) := '3B0D0A2020636F6C6F723A20233063313530363B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333529202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B';
wwv_flow_api.g_varchar2_table(1210) := '20333529202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233661616434323B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333529202E752D636F6C';
wwv_flow_api.g_varchar2_table(1211) := '6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333529202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20233661616434323B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368';
wwv_flow_api.g_varchar2_table(1212) := '696C642834356E202B20333529202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333529202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A2023366161';
wwv_flow_api.g_varchar2_table(1213) := '6434323B0D0A20207374726F6B653A20233661616434323B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333629202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20236339636133';
wwv_flow_api.g_varchar2_table(1214) := '393B0D0A202066696C6C3A20236339636133393B0D0A2020636F6C6F723A20233264326530343B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333629202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273';
wwv_flow_api.g_varchar2_table(1215) := '203E203A6E74682D6368696C642834356E202B20333629202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236339636133393B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D636869';
wwv_flow_api.g_varchar2_table(1216) := '6C642834356E202B20333629202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333629202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20236339636133393B0D0A7D0D0A';
wwv_flow_api.g_varchar2_table(1217) := '2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333629202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333629202E752D636F6C6F722D626F72646572207B0D0A20';
wwv_flow_api.g_varchar2_table(1218) := '20626F726465722D636F6C6F723A20236339636133393B0D0A20207374726F6B653A20236339636133393B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333729202E752D636F6C6F72207B0D0A20206261636B67';
wwv_flow_api.g_varchar2_table(1219) := '726F756E642D636F6C6F723A20236439623133623B0D0A202066696C6C3A20236439623133623B0D0A2020636F6C6F723A20233436333430303B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333729202E752D63';
wwv_flow_api.g_varchar2_table(1220) := '6F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333729202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236439623133623B0D0A7D0D0A2E';
wwv_flow_api.g_varchar2_table(1221) := '752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333729202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333729202E752D636F6C6F722D74657874207B0D0A202063';
wwv_flow_api.g_varchar2_table(1222) := '6F6C6F723A20236439623133623B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333729202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333729202E';
wwv_flow_api.g_varchar2_table(1223) := '752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236439623133623B0D0A20207374726F6B653A20236439623133623B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B2033382920';
wwv_flow_api.g_varchar2_table(1224) := '2E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20236437366132373B0D0A202066696C6C3A20236437366132373B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D63';
wwv_flow_api.g_varchar2_table(1225) := '68696C642834356E202B20333829202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333829202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F';
wwv_flow_api.g_varchar2_table(1226) := '6C6F723A20236437366132373B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333829202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333829202E';
wwv_flow_api.g_varchar2_table(1227) := '752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20236437366132373B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333829202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74';
wwv_flow_api.g_varchar2_table(1228) := '682D6368696C642834356E202B20333829202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236437366132373B0D0A20207374726F6B653A20236437366132373B0D0A7D0D0A2E752D636F6C6F7273203E203A6E';
wwv_flow_api.g_varchar2_table(1229) := '74682D6368696C642834356E202B20333929202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20236432343233623B0D0A202066696C6C3A20236432343233623B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D';
wwv_flow_api.g_varchar2_table(1230) := '0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333929202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333929202E752D636F6C6F722D6261636B67726F756E64';
wwv_flow_api.g_varchar2_table(1231) := '207B0D0A20206261636B67726F756E642D636F6C6F723A20236432343233623B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333929202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74';
wwv_flow_api.g_varchar2_table(1232) := '682D6368696C642834356E202B20333929202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20236432343233623B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333929202E752D636F6C6F722D62';
wwv_flow_api.g_varchar2_table(1233) := '642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333929202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236432343233623B0D0A20207374726F6B653A20236432343233623B';
wwv_flow_api.g_varchar2_table(1234) := '0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343029202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20236431343336663B0D0A202066696C6C3A20236431343336663B0D0A2020';
wwv_flow_api.g_varchar2_table(1235) := '636F6C6F723A20236666666666663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343029202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B2034302920';
wwv_flow_api.g_varchar2_table(1236) := '2E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236431343336663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343029202E752D636F6C6F722D7478';
wwv_flow_api.g_varchar2_table(1237) := '742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343029202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20236431343336663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834';
wwv_flow_api.g_varchar2_table(1238) := '356E202B20343029202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343029202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236431343336663B0D';
wwv_flow_api.g_varchar2_table(1239) := '0A20207374726F6B653A20236431343336663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343129202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20236261336438383B0D0A20';
wwv_flow_api.g_varchar2_table(1240) := '2066696C6C3A20236261336438383B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343129202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E';
wwv_flow_api.g_varchar2_table(1241) := '74682D6368696C642834356E202B20343129202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236261336438383B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C64283435';
wwv_flow_api.g_varchar2_table(1242) := '6E202B20343129202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343129202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20236261336438383B0D0A7D0D0A2E752D636F';
wwv_flow_api.g_varchar2_table(1243) := '6C6F7273203E203A6E74682D6368696C642834356E202B20343129202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343129202E752D636F6C6F722D626F72646572207B0D0A2020626F7264';
wwv_flow_api.g_varchar2_table(1244) := '65722D636F6C6F723A20236261336438383B0D0A20207374726F6B653A20236261336438383B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343229202E752D636F6C6F72207B0D0A20206261636B67726F756E64';
wwv_flow_api.g_varchar2_table(1245) := '2D636F6C6F723A20233737333339333B0D0A202066696C6C3A20233737333339333B0D0A2020636F6C6F723A20236636656666393B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343229202E752D636F6C6F722D';
wwv_flow_api.g_varchar2_table(1246) := '62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343229202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233737333339333B0D0A7D0D0A2E752D636F6C';
wwv_flow_api.g_varchar2_table(1247) := '6F7273203E203A6E74682D6368696C642834356E202B20343229202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343229202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A';
wwv_flow_api.g_varchar2_table(1248) := '20233737333339333B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343229202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343229202E752D636F6C';
wwv_flow_api.g_varchar2_table(1249) := '6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233737333339333B0D0A20207374726F6B653A20233737333339333B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343329202E752D636F';
wwv_flow_api.g_varchar2_table(1250) := '6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20233364346561333B0D0A202066696C6C3A20233364346561333B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C6428';
wwv_flow_api.g_varchar2_table(1251) := '34356E202B20343329202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343329202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20';
wwv_flow_api.g_varchar2_table(1252) := '233364346561333B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343329202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343329202E752D636F6C';
wwv_flow_api.g_varchar2_table(1253) := '6F722D74657874207B0D0A2020636F6C6F723A20233364346561333B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343329202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D636869';
wwv_flow_api.g_varchar2_table(1254) := '6C642834356E202B20343329202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233364346561333B0D0A20207374726F6B653A20233364346561333B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368';
wwv_flow_api.g_varchar2_table(1255) := '696C642834356E202B20343429202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20233863396562303B0D0A202066696C6C3A20233863396562303B0D0A2020636F6C6F723A20233238336134643B0D0A7D0D0A2E752D63';
wwv_flow_api.g_varchar2_table(1256) := '6F6C6F7273203E203A6E74682D6368696C642834356E202B20343429202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343429202E752D636F6C6F722D6261636B67726F756E64207B0D0A20';
wwv_flow_api.g_varchar2_table(1257) := '206261636B67726F756E642D636F6C6F723A20233863396562303B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343429202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D636869';
wwv_flow_api.g_varchar2_table(1258) := '6C642834356E202B20343429202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20233863396562303B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343429202E752D636F6C6F722D62642C0D0A2E';
wwv_flow_api.g_varchar2_table(1259) := '752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343429202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233863396562303B0D0A20207374726F6B653A20233863396562303B0D0A7D0D0A';
wwv_flow_api.g_varchar2_table(1260) := '2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343529202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20233465373339313B0D0A202066696C6C3A20233465373339313B0D0A2020636F6C6F72';
wwv_flow_api.g_varchar2_table(1261) := '3A20236666666666663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343529202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343529202E752D636F';
wwv_flow_api.g_varchar2_table(1262) := '6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233465373339313B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343529202E752D636F6C6F722D7478742C0D0A2E';
wwv_flow_api.g_varchar2_table(1263) := '752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343529202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20233465373339313B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20';
wwv_flow_api.g_varchar2_table(1264) := '343529202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343529202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233465373339313B0D0A20207374';
wwv_flow_api.g_varchar2_table(1265) := '726F6B653A20233465373339313B0D0A7D0D0A0D0A2E752D636F6C6F722D31207B0D0A20206261636B67726F756E642D636F6C6F723A20233330396664622021696D706F7274616E743B0D0A202066696C6C3A20233330396664622021696D706F727461';
wwv_flow_api.g_varchar2_table(1266) := '6E743B0D0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D312D62672C0D0A2E752D636F6C6F722D312D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(1267) := '3330396664622021696D706F7274616E743B0D0A202066696C6C3A20233330396664622021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D312D7478742C0D0A2E752D636F6C6F722D312D74657874207B0D0A2020636F6C6F723A20233330';
wwv_flow_api.g_varchar2_table(1268) := '396664622021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D312D62642C0D0A2E752D636F6C6F722D312D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233330396664622021696D706F7274616E743B0D0A2020737472';
wwv_flow_api.g_varchar2_table(1269) := '6F6B653A20233330396664622021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32207B0D0A20206261636B67726F756E642D636F6C6F723A20233133623663662021696D706F7274616E743B0D0A202066696C6C3A202331336236636620';
wwv_flow_api.g_varchar2_table(1270) := '21696D706F7274616E743B0D0A2020636F6C6F723A20236534663966642021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D322D62672C0D0A2E752D636F6C6F722D322D6261636B67726F756E64207B0D0A20206261636B67726F756E642D';
wwv_flow_api.g_varchar2_table(1271) := '636F6C6F723A20233133623663662021696D706F7274616E743B0D0A202066696C6C3A20233133623663662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D322D7478742C0D0A2E752D636F6C6F722D322D74657874207B0D0A2020636F';
wwv_flow_api.g_varchar2_table(1272) := '6C6F723A20233133623663662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D322D62642C0D0A2E752D636F6C6F722D322D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233133623663662021696D706F7274616E74';
wwv_flow_api.g_varchar2_table(1273) := '3B0D0A20207374726F6B653A20233133623663662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33207B0D0A20206261636B67726F756E642D636F6C6F723A20233265626662632021696D706F7274616E743B0D0A202066696C6C3A20';
wwv_flow_api.g_varchar2_table(1274) := '233265626662632021696D706F7274616E743B0D0A2020636F6C6F723A20236630666366622021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D332D62672C0D0A2E752D636F6C6F722D332D6261636B67726F756E64207B0D0A2020626163';
wwv_flow_api.g_varchar2_table(1275) := '6B67726F756E642D636F6C6F723A20233265626662632021696D706F7274616E743B0D0A202066696C6C3A20233265626662632021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D332D7478742C0D0A2E752D636F6C6F722D332D74657874';
wwv_flow_api.g_varchar2_table(1276) := '207B0D0A2020636F6C6F723A20233265626662632021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D332D62642C0D0A2E752D636F6C6F722D332D626F72646572207B0D0A2020626F726465722D636F6C6F723A2023326562666263202169';
wwv_flow_api.g_varchar2_table(1277) := '6D706F7274616E743B0D0A20207374726F6B653A20233265626662632021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D34207B0D0A20206261636B67726F756E642D636F6C6F723A20233363616638352021696D706F7274616E743B0D0A';
wwv_flow_api.g_varchar2_table(1278) := '202066696C6C3A20233363616638352021696D706F7274616E743B0D0A2020636F6C6F723A20236630666166362021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D342D62672C0D0A2E752D636F6C6F722D342D6261636B67726F756E6420';
wwv_flow_api.g_varchar2_table(1279) := '7B0D0A20206261636B67726F756E642D636F6C6F723A20233363616638352021696D706F7274616E743B0D0A202066696C6C3A20233363616638352021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D342D7478742C0D0A2E752D636F6C6F';
wwv_flow_api.g_varchar2_table(1280) := '722D342D74657874207B0D0A2020636F6C6F723A20233363616638352021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D342D62642C0D0A2E752D636F6C6F722D342D626F72646572207B0D0A2020626F726465722D636F6C6F723A202333';
wwv_flow_api.g_varchar2_table(1281) := '63616638352021696D706F7274616E743B0D0A20207374726F6B653A20233363616638352021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D35207B0D0A20206261636B67726F756E642D636F6C6F723A20233831626235662021696D706F';
wwv_flow_api.g_varchar2_table(1282) := '7274616E743B0D0A202066696C6C3A20233831626235662021696D706F7274616E743B0D0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D352D62672C0D0A2E752D636F6C6F722D352D626163';
wwv_flow_api.g_varchar2_table(1283) := '6B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233831626235662021696D706F7274616E743B0D0A202066696C6C3A20233831626235662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D352D7478742C0D';
wwv_flow_api.g_varchar2_table(1284) := '0A2E752D636F6C6F722D352D74657874207B0D0A2020636F6C6F723A20233831626235662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D352D62642C0D0A2E752D636F6C6F722D352D626F72646572207B0D0A2020626F726465722D63';
wwv_flow_api.g_varchar2_table(1285) := '6F6C6F723A20233831626235662021696D706F7274616E743B0D0A20207374726F6B653A20233831626235662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D36207B0D0A20206261636B67726F756E642D636F6C6F723A202364646465';
wwv_flow_api.g_varchar2_table(1286) := '35332021696D706F7274616E743B0D0A202066696C6C3A20236464646535332021696D706F7274616E743B0D0A2020636F6C6F723A20233261326130382021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D362D62672C0D0A2E752D636F6C';
wwv_flow_api.g_varchar2_table(1287) := '6F722D362D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236464646535332021696D706F7274616E743B0D0A202066696C6C3A20236464646535332021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F72';
wwv_flow_api.g_varchar2_table(1288) := '2D362D7478742C0D0A2E752D636F6C6F722D362D74657874207B0D0A2020636F6C6F723A20236464646535332021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D362D62642C0D0A2E752D636F6C6F722D362D626F72646572207B0D0A2020';
wwv_flow_api.g_varchar2_table(1289) := '626F726465722D636F6C6F723A20236464646535332021696D706F7274616E743B0D0A20207374726F6B653A20236464646535332021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D37207B0D0A20206261636B67726F756E642D636F6C6F';
wwv_flow_api.g_varchar2_table(1290) := '723A20236662636534612021696D706F7274616E743B0D0A202066696C6C3A20236662636534612021696D706F7274616E743B0D0A2020636F6C6F723A20233434333330322021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D372D62672C';
wwv_flow_api.g_varchar2_table(1291) := '0D0A2E752D636F6C6F722D372D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236662636534612021696D706F7274616E743B0D0A202066696C6C3A20236662636534612021696D706F7274616E743B0D0A7D0D0A';
wwv_flow_api.g_varchar2_table(1292) := '2E752D636F6C6F722D372D7478742C0D0A2E752D636F6C6F722D372D74657874207B0D0A2020636F6C6F723A20236662636534612021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D372D62642C0D0A2E752D636F6C6F722D372D626F7264';
wwv_flow_api.g_varchar2_table(1293) := '6572207B0D0A2020626F726465722D636F6C6F723A20236662636534612021696D706F7274616E743B0D0A20207374726F6B653A20236662636534612021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D38207B0D0A20206261636B67726F';
wwv_flow_api.g_varchar2_table(1294) := '756E642D636F6C6F723A20236564383133652021696D706F7274616E743B0D0A202066696C6C3A20236564383133652021696D706F7274616E743B0D0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C';
wwv_flow_api.g_varchar2_table(1295) := '6F722D382D62672C0D0A2E752D636F6C6F722D382D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236564383133652021696D706F7274616E743B0D0A202066696C6C3A20236564383133652021696D706F727461';
wwv_flow_api.g_varchar2_table(1296) := '6E743B0D0A7D0D0A2E752D636F6C6F722D382D7478742C0D0A2E752D636F6C6F722D382D74657874207B0D0A2020636F6C6F723A20236564383133652021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D382D62642C0D0A2E752D636F6C6F';
wwv_flow_api.g_varchar2_table(1297) := '722D382D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236564383133652021696D706F7274616E743B0D0A20207374726F6B653A20236564383133652021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D39207B0D0A20';
wwv_flow_api.g_varchar2_table(1298) := '206261636B67726F756E642D636F6C6F723A20236539356235342021696D706F7274616E743B0D0A202066696C6C3A20236539356235342021696D706F7274616E743B0D0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D';
wwv_flow_api.g_varchar2_table(1299) := '0D0A2E752D636F6C6F722D392D62672C0D0A2E752D636F6C6F722D392D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236539356235342021696D706F7274616E743B0D0A202066696C6C3A202365393562353420';
wwv_flow_api.g_varchar2_table(1300) := '21696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D392D7478742C0D0A2E752D636F6C6F722D392D74657874207B0D0A2020636F6C6F723A20236539356235342021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D392D62642C0D';
wwv_flow_api.g_varchar2_table(1301) := '0A2E752D636F6C6F722D392D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236539356235342021696D706F7274616E743B0D0A20207374726F6B653A20236539356235342021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F';
wwv_flow_api.g_varchar2_table(1302) := '722D3130207B0D0A20206261636B67726F756E642D636F6C6F723A20236538356438382021696D706F7274616E743B0D0A202066696C6C3A20236538356438382021696D706F7274616E743B0D0A2020636F6C6F723A20236666666666662021696D706F';
wwv_flow_api.g_varchar2_table(1303) := '7274616E743B0D0A7D0D0A2E752D636F6C6F722D31302D62672C0D0A2E752D636F6C6F722D31302D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236538356438382021696D706F7274616E743B0D0A202066696C';
wwv_flow_api.g_varchar2_table(1304) := '6C3A20236538356438382021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31302D7478742C0D0A2E752D636F6C6F722D31302D74657874207B0D0A2020636F6C6F723A20236538356438382021696D706F7274616E743B0D0A7D0D0A2E75';
wwv_flow_api.g_varchar2_table(1305) := '2D636F6C6F722D31302D62642C0D0A2E752D636F6C6F722D31302D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236538356438382021696D706F7274616E743B0D0A20207374726F6B653A20236538356438382021696D706F727461';
wwv_flow_api.g_varchar2_table(1306) := '6E743B0D0A7D0D0A2E752D636F6C6F722D3131207B0D0A20206261636B67726F756E642D636F6C6F723A20236361353839642021696D706F7274616E743B0D0A202066696C6C3A20236361353839642021696D706F7274616E743B0D0A2020636F6C6F72';
wwv_flow_api.g_varchar2_table(1307) := '3A20236666666666662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31312D62672C0D0A2E752D636F6C6F722D31312D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236361353839642021696D';
wwv_flow_api.g_varchar2_table(1308) := '706F7274616E743B0D0A202066696C6C3A20236361353839642021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31312D7478742C0D0A2E752D636F6C6F722D31312D74657874207B0D0A2020636F6C6F723A20236361353839642021696D';
wwv_flow_api.g_varchar2_table(1309) := '706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31312D62642C0D0A2E752D636F6C6F722D31312D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236361353839642021696D706F7274616E743B0D0A20207374726F6B653A2023';
wwv_flow_api.g_varchar2_table(1310) := '6361353839642021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3132207B0D0A20206261636B67726F756E642D636F6C6F723A20233835346539622021696D706F7274616E743B0D0A202066696C6C3A20233835346539622021696D706F';
wwv_flow_api.g_varchar2_table(1311) := '7274616E743B0D0A2020636F6C6F723A20236636663066382021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31322D62672C0D0A2E752D636F6C6F722D31322D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C';
wwv_flow_api.g_varchar2_table(1312) := '6F723A20233835346539622021696D706F7274616E743B0D0A202066696C6C3A20233835346539622021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31322D7478742C0D0A2E752D636F6C6F722D31322D74657874207B0D0A2020636F6C';
wwv_flow_api.g_varchar2_table(1313) := '6F723A20233835346539622021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31322D62642C0D0A2E752D636F6C6F722D31322D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233835346539622021696D706F7274616E';
wwv_flow_api.g_varchar2_table(1314) := '743B0D0A20207374726F6B653A20233835346539622021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3133207B0D0A20206261636B67726F756E642D636F6C6F723A20233561363861642021696D706F7274616E743B0D0A202066696C6C';
wwv_flow_api.g_varchar2_table(1315) := '3A20233561363861642021696D706F7274616E743B0D0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31332D62672C0D0A2E752D636F6C6F722D31332D6261636B67726F756E64207B0D0A20';
wwv_flow_api.g_varchar2_table(1316) := '206261636B67726F756E642D636F6C6F723A20233561363861642021696D706F7274616E743B0D0A202066696C6C3A20233561363861642021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31332D7478742C0D0A2E752D636F6C6F722D31';
wwv_flow_api.g_varchar2_table(1317) := '332D74657874207B0D0A2020636F6C6F723A20233561363861642021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31332D62642C0D0A2E752D636F6C6F722D31332D626F72646572207B0D0A2020626F726465722D636F6C6F723A202335';
wwv_flow_api.g_varchar2_table(1318) := '61363861642021696D706F7274616E743B0D0A20207374726F6B653A20233561363861642021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3134207B0D0A20206261636B67726F756E642D636F6C6F723A20236166626163352021696D70';
wwv_flow_api.g_varchar2_table(1319) := '6F7274616E743B0D0A202066696C6C3A20236166626163352021696D706F7274616E743B0D0A2020636F6C6F723A20233331336134342021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31342D62672C0D0A2E752D636F6C6F722D31342D';
wwv_flow_api.g_varchar2_table(1320) := '6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236166626163352021696D706F7274616E743B0D0A202066696C6C3A20236166626163352021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31342D74';
wwv_flow_api.g_varchar2_table(1321) := '78742C0D0A2E752D636F6C6F722D31342D74657874207B0D0A2020636F6C6F723A20236166626163352021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31342D62642C0D0A2E752D636F6C6F722D31342D626F72646572207B0D0A202062';
wwv_flow_api.g_varchar2_table(1322) := '6F726465722D636F6C6F723A20236166626163352021696D706F7274616E743B0D0A20207374726F6B653A20236166626163352021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3135207B0D0A20206261636B67726F756E642D636F6C6F';
wwv_flow_api.g_varchar2_table(1323) := '723A20233665383539382021696D706F7274616E743B0D0A202066696C6C3A20233665383539382021696D706F7274616E743B0D0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31352D6267';
wwv_flow_api.g_varchar2_table(1324) := '2C0D0A2E752D636F6C6F722D31352D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233665383539382021696D706F7274616E743B0D0A202066696C6C3A20233665383539382021696D706F7274616E743B0D0A7D';
wwv_flow_api.g_varchar2_table(1325) := '0D0A2E752D636F6C6F722D31352D7478742C0D0A2E752D636F6C6F722D31352D74657874207B0D0A2020636F6C6F723A20233665383539382021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31352D62642C0D0A2E752D636F6C6F722D31';
wwv_flow_api.g_varchar2_table(1326) := '352D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233665383539382021696D706F7274616E743B0D0A20207374726F6B653A20233665383539382021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3136207B0D0A2020';
wwv_flow_api.g_varchar2_table(1327) := '6261636B67726F756E642D636F6C6F723A20233539623265322021696D706F7274616E743B0D0A202066696C6C3A20233539623265322021696D706F7274616E743B0D0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D0D';
wwv_flow_api.g_varchar2_table(1328) := '0A2E752D636F6C6F722D31362D62672C0D0A2E752D636F6C6F722D31362D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233539623265322021696D706F7274616E743B0D0A202066696C6C3A2023353962326532';
wwv_flow_api.g_varchar2_table(1329) := '2021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31362D7478742C0D0A2E752D636F6C6F722D31362D74657874207B0D0A2020636F6C6F723A20233539623265322021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31362D';
wwv_flow_api.g_varchar2_table(1330) := '62642C0D0A2E752D636F6C6F722D31362D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233539623265322021696D706F7274616E743B0D0A20207374726F6B653A20233539623265322021696D706F7274616E743B0D0A7D0D0A2E75';
wwv_flow_api.g_varchar2_table(1331) := '2D636F6C6F722D3137207B0D0A20206261636B67726F756E642D636F6C6F723A20233432633564392021696D706F7274616E743B0D0A202066696C6C3A20233432633564392021696D706F7274616E743B0D0A2020636F6C6F723A202330353135313720';
wwv_flow_api.g_varchar2_table(1332) := '21696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31372D62672C0D0A2E752D636F6C6F722D31372D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233432633564392021696D706F7274616E743B0D0A';
wwv_flow_api.g_varchar2_table(1333) := '202066696C6C3A20233432633564392021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31372D7478742C0D0A2E752D636F6C6F722D31372D74657874207B0D0A2020636F6C6F723A20233432633564392021696D706F7274616E743B0D0A';
wwv_flow_api.g_varchar2_table(1334) := '7D0D0A2E752D636F6C6F722D31372D62642C0D0A2E752D636F6C6F722D31372D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233432633564392021696D706F7274616E743B0D0A20207374726F6B653A20233432633564392021696D';
wwv_flow_api.g_varchar2_table(1335) := '706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3138207B0D0A20206261636B67726F756E642D636F6C6F723A20233538636363392021696D706F7274616E743B0D0A202066696C6C3A20233538636363392021696D706F7274616E743B0D0A2020';
wwv_flow_api.g_varchar2_table(1336) := '636F6C6F723A20233039316331632021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31382D62672C0D0A2E752D636F6C6F722D31382D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233538636363';
wwv_flow_api.g_varchar2_table(1337) := '392021696D706F7274616E743B0D0A202066696C6C3A20233538636363392021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31382D7478742C0D0A2E752D636F6C6F722D31382D74657874207B0D0A2020636F6C6F723A20233538636363';
wwv_flow_api.g_varchar2_table(1338) := '392021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31382D62642C0D0A2E752D636F6C6F722D31382D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233538636363392021696D706F7274616E743B0D0A20207374726F';
wwv_flow_api.g_varchar2_table(1339) := '6B653A20233538636363392021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3139207B0D0A20206261636B67726F756E642D636F6C6F723A20233633626639642021696D706F7274616E743B0D0A202066696C6C3A202336336266396420';
wwv_flow_api.g_varchar2_table(1340) := '21696D706F7274616E743B0D0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31392D62672C0D0A2E752D636F6C6F722D31392D6261636B67726F756E64207B0D0A20206261636B67726F756E';
wwv_flow_api.g_varchar2_table(1341) := '642D636F6C6F723A20233633626639642021696D706F7274616E743B0D0A202066696C6C3A20233633626639642021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31392D7478742C0D0A2E752D636F6C6F722D31392D74657874207B0D0A';
wwv_flow_api.g_varchar2_table(1342) := '2020636F6C6F723A20233633626639642021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31392D62642C0D0A2E752D636F6C6F722D31392D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233633626639642021696D70';
wwv_flow_api.g_varchar2_table(1343) := '6F7274616E743B0D0A20207374726F6B653A20233633626639642021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3230207B0D0A20206261636B67726F756E642D636F6C6F723A20233961633937662021696D706F7274616E743B0D0A20';
wwv_flow_api.g_varchar2_table(1344) := '2066696C6C3A20233961633937662021696D706F7274616E743B0D0A2020636F6C6F723A20233230333331362021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32302D62672C0D0A2E752D636F6C6F722D32302D6261636B67726F756E64';
wwv_flow_api.g_varchar2_table(1345) := '207B0D0A20206261636B67726F756E642D636F6C6F723A20233961633937662021696D706F7274616E743B0D0A202066696C6C3A20233961633937662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32302D7478742C0D0A2E752D636F';
wwv_flow_api.g_varchar2_table(1346) := '6C6F722D32302D74657874207B0D0A2020636F6C6F723A20233961633937662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32302D62642C0D0A2E752D636F6C6F722D32302D626F72646572207B0D0A2020626F726465722D636F6C6F';
wwv_flow_api.g_varchar2_table(1347) := '723A20233961633937662021696D706F7274616E743B0D0A20207374726F6B653A20233961633937662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3231207B0D0A20206261636B67726F756E642D636F6C6F723A2023653465353735';
wwv_flow_api.g_varchar2_table(1348) := '2021696D706F7274616E743B0D0A202066696C6C3A20236534653537352021696D706F7274616E743B0D0A2020636F6C6F723A20233463346330662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32312D62672C0D0A2E752D636F6C6F';
wwv_flow_api.g_varchar2_table(1349) := '722D32312D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236534653537352021696D706F7274616E743B0D0A202066696C6C3A20236534653537352021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F72';
wwv_flow_api.g_varchar2_table(1350) := '2D32312D7478742C0D0A2E752D636F6C6F722D32312D74657874207B0D0A2020636F6C6F723A20236534653537352021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32312D62642C0D0A2E752D636F6C6F722D32312D626F72646572207B';
wwv_flow_api.g_varchar2_table(1351) := '0D0A2020626F726465722D636F6C6F723A20236534653537352021696D706F7274616E743B0D0A20207374726F6B653A20236534653537352021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3232207B0D0A20206261636B67726F756E64';
wwv_flow_api.g_varchar2_table(1352) := '2D636F6C6F723A20236663643836652021696D706F7274616E743B0D0A202066696C6C3A20236663643836652021696D706F7274616E743B0D0A2020636F6C6F723A20233639346630322021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D';
wwv_flow_api.g_varchar2_table(1353) := '32322D62672C0D0A2E752D636F6C6F722D32322D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236663643836652021696D706F7274616E743B0D0A202066696C6C3A20236663643836652021696D706F7274616E';
wwv_flow_api.g_varchar2_table(1354) := '743B0D0A7D0D0A2E752D636F6C6F722D32322D7478742C0D0A2E752D636F6C6F722D32322D74657874207B0D0A2020636F6C6F723A20236663643836652021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32322D62642C0D0A2E752D636F';
wwv_flow_api.g_varchar2_table(1355) := '6C6F722D32322D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236663643836652021696D706F7274616E743B0D0A20207374726F6B653A20236663643836652021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D323320';
wwv_flow_api.g_varchar2_table(1356) := '7B0D0A20206261636B67726F756E642D636F6C6F723A20236631396136352021696D706F7274616E743B0D0A202066696C6C3A20236631396136352021696D706F7274616E743B0D0A2020636F6C6F723A20236666666666662021696D706F7274616E74';
wwv_flow_api.g_varchar2_table(1357) := '3B0D0A7D0D0A2E752D636F6C6F722D32332D62672C0D0A2E752D636F6C6F722D32332D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236631396136352021696D706F7274616E743B0D0A202066696C6C3A202366';
wwv_flow_api.g_varchar2_table(1358) := '31396136352021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32332D7478742C0D0A2E752D636F6C6F722D32332D74657874207B0D0A2020636F6C6F723A20236631396136352021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F';
wwv_flow_api.g_varchar2_table(1359) := '722D32332D62642C0D0A2E752D636F6C6F722D32332D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236631396136352021696D706F7274616E743B0D0A20207374726F6B653A20236631396136352021696D706F7274616E743B0D0A';
wwv_flow_api.g_varchar2_table(1360) := '7D0D0A2E752D636F6C6F722D3234207B0D0A20206261636B67726F756E642D636F6C6F723A20236564376337362021696D706F7274616E743B0D0A202066696C6C3A20236564376337362021696D706F7274616E743B0D0A2020636F6C6F723A20236666';
wwv_flow_api.g_varchar2_table(1361) := '666666662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32342D62672C0D0A2E752D636F6C6F722D32342D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236564376337362021696D706F727461';
wwv_flow_api.g_varchar2_table(1362) := '6E743B0D0A202066696C6C3A20236564376337362021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32342D7478742C0D0A2E752D636F6C6F722D32342D74657874207B0D0A2020636F6C6F723A20236564376337362021696D706F727461';
wwv_flow_api.g_varchar2_table(1363) := '6E743B0D0A7D0D0A2E752D636F6C6F722D32342D62642C0D0A2E752D636F6C6F722D32342D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236564376337362021696D706F7274616E743B0D0A20207374726F6B653A20236564376337';
wwv_flow_api.g_varchar2_table(1364) := '362021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3235207B0D0A20206261636B67726F756E642D636F6C6F723A20236564376461302021696D706F7274616E743B0D0A202066696C6C3A20236564376461302021696D706F7274616E74';
wwv_flow_api.g_varchar2_table(1365) := '3B0D0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32352D62672C0D0A2E752D636F6C6F722D32352D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(1366) := '6564376461302021696D706F7274616E743B0D0A202066696C6C3A20236564376461302021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32352D7478742C0D0A2E752D636F6C6F722D32352D74657874207B0D0A2020636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(1367) := '6564376461302021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32352D62642C0D0A2E752D636F6C6F722D32352D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236564376461302021696D706F7274616E743B0D0A20';
wwv_flow_api.g_varchar2_table(1368) := '207374726F6B653A20236564376461302021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3236207B0D0A20206261636B67726F756E642D636F6C6F723A20236435373962312021696D706F7274616E743B0D0A202066696C6C3A20236435';
wwv_flow_api.g_varchar2_table(1369) := '373962312021696D706F7274616E743B0D0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32362D62672C0D0A2E752D636F6C6F722D32362D6261636B67726F756E64207B0D0A20206261636B';
wwv_flow_api.g_varchar2_table(1370) := '67726F756E642D636F6C6F723A20236435373962312021696D706F7274616E743B0D0A202066696C6C3A20236435373962312021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32362D7478742C0D0A2E752D636F6C6F722D32362D746578';
wwv_flow_api.g_varchar2_table(1371) := '74207B0D0A2020636F6C6F723A20236435373962312021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32362D62642C0D0A2E752D636F6C6F722D32362D626F72646572207B0D0A2020626F726465722D636F6C6F723A2023643537396231';
wwv_flow_api.g_varchar2_table(1372) := '2021696D706F7274616E743B0D0A20207374726F6B653A20236435373962312021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3237207B0D0A20206261636B67726F756E642D636F6C6F723A20233964373161662021696D706F7274616E';
wwv_flow_api.g_varchar2_table(1373) := '743B0D0A202066696C6C3A20233964373161662021696D706F7274616E743B0D0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32372D62672C0D0A2E752D636F6C6F722D32372D6261636B67';
wwv_flow_api.g_varchar2_table(1374) := '726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233964373161662021696D706F7274616E743B0D0A202066696C6C3A20233964373161662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32372D7478742C0D0A';
wwv_flow_api.g_varchar2_table(1375) := '2E752D636F6C6F722D32372D74657874207B0D0A2020636F6C6F723A20233964373161662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32372D62642C0D0A2E752D636F6C6F722D32372D626F72646572207B0D0A2020626F72646572';
wwv_flow_api.g_varchar2_table(1376) := '2D636F6C6F723A20233964373161662021696D706F7274616E743B0D0A20207374726F6B653A20233964373161662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3238207B0D0A20206261636B67726F756E642D636F6C6F723A202337';
wwv_flow_api.g_varchar2_table(1377) := '62383662642021696D706F7274616E743B0D0A202066696C6C3A20233762383662642021696D706F7274616E743B0D0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32382D62672C0D0A2E75';
wwv_flow_api.g_varchar2_table(1378) := '2D636F6C6F722D32382D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233762383662642021696D706F7274616E743B0D0A202066696C6C3A20233762383662642021696D706F7274616E743B0D0A7D0D0A2E752D';
wwv_flow_api.g_varchar2_table(1379) := '636F6C6F722D32382D7478742C0D0A2E752D636F6C6F722D32382D74657874207B0D0A2020636F6C6F723A20233762383662642021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32382D62642C0D0A2E752D636F6C6F722D32382D626F72';
wwv_flow_api.g_varchar2_table(1380) := '646572207B0D0A2020626F726465722D636F6C6F723A20233762383662642021696D706F7274616E743B0D0A20207374726F6B653A20233762383662642021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3239207B0D0A20206261636B67';
wwv_flow_api.g_varchar2_table(1381) := '726F756E642D636F6C6F723A20236266633864312021696D706F7274616E743B0D0A202066696C6C3A20236266633864312021696D706F7274616E743B0D0A2020636F6C6F723A20233364343835342021696D706F7274616E743B0D0A7D0D0A2E752D63';
wwv_flow_api.g_varchar2_table(1382) := '6F6C6F722D32392D62672C0D0A2E752D636F6C6F722D32392D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236266633864312021696D706F7274616E743B0D0A202066696C6C3A20236266633864312021696D70';
wwv_flow_api.g_varchar2_table(1383) := '6F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32392D7478742C0D0A2E752D636F6C6F722D32392D74657874207B0D0A2020636F6C6F723A20236266633864312021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32392D62642C0D0A';
wwv_flow_api.g_varchar2_table(1384) := '2E752D636F6C6F722D32392D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236266633864312021696D706F7274616E743B0D0A20207374726F6B653A20236266633864312021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F';
wwv_flow_api.g_varchar2_table(1385) := '722D3330207B0D0A20206261636B67726F756E642D636F6C6F723A20233862396461642021696D706F7274616E743B0D0A202066696C6C3A20233862396461642021696D706F7274616E743B0D0A2020636F6C6F723A20236666666666662021696D706F';
wwv_flow_api.g_varchar2_table(1386) := '7274616E743B0D0A7D0D0A2E752D636F6C6F722D33302D62672C0D0A2E752D636F6C6F722D33302D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233862396461642021696D706F7274616E743B0D0A202066696C';
wwv_flow_api.g_varchar2_table(1387) := '6C3A20233862396461642021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33302D7478742C0D0A2E752D636F6C6F722D33302D74657874207B0D0A2020636F6C6F723A20233862396461642021696D706F7274616E743B0D0A7D0D0A2E75';
wwv_flow_api.g_varchar2_table(1388) := '2D636F6C6F722D33302D62642C0D0A2E752D636F6C6F722D33302D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233862396461642021696D706F7274616E743B0D0A20207374726F6B653A20233862396461642021696D706F727461';
wwv_flow_api.g_varchar2_table(1389) := '6E743B0D0A7D0D0A2E752D636F6C6F722D3331207B0D0A20206261636B67726F756E642D636F6C6F723A20233139386363612021696D706F7274616E743B0D0A202066696C6C3A20233139386363612021696D706F7274616E743B0D0A2020636F6C6F72';
wwv_flow_api.g_varchar2_table(1390) := '3A20236666666666662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33312D62672C0D0A2E752D636F6C6F722D33312D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233139386363612021696D';
wwv_flow_api.g_varchar2_table(1391) := '706F7274616E743B0D0A202066696C6C3A20233139386363612021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33312D7478742C0D0A2E752D636F6C6F722D33312D74657874207B0D0A2020636F6C6F723A20233139386363612021696D';
wwv_flow_api.g_varchar2_table(1392) := '706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33312D62642C0D0A2E752D636F6C6F722D33312D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233139386363612021696D706F7274616E743B0D0A20207374726F6B653A2023';
wwv_flow_api.g_varchar2_table(1393) := '3139386363612021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3332207B0D0A20206261636B67726F756E642D636F6C6F723A20233032613562652021696D706F7274616E743B0D0A202066696C6C3A20233032613562652021696D706F';
wwv_flow_api.g_varchar2_table(1394) := '7274616E743B0D0A2020636F6C6F723A20233030303030302021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33322D62672C0D0A2E752D636F6C6F722D33322D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C';
wwv_flow_api.g_varchar2_table(1395) := '6F723A20233032613562652021696D706F7274616E743B0D0A202066696C6C3A20233032613562652021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33322D7478742C0D0A2E752D636F6C6F722D33322D74657874207B0D0A2020636F6C';
wwv_flow_api.g_varchar2_table(1396) := '6F723A20233032613562652021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33322D62642C0D0A2E752D636F6C6F722D33322D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233032613562652021696D706F7274616E';
wwv_flow_api.g_varchar2_table(1397) := '743B0D0A20207374726F6B653A20233032613562652021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3333207B0D0A20206261636B67726F756E642D636F6C6F723A20233138623161652021696D706F7274616E743B0D0A202066696C6C';
wwv_flow_api.g_varchar2_table(1398) := '3A20233138623161652021696D706F7274616E743B0D0A2020636F6C6F723A20233030303030302021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33332D62672C0D0A2E752D636F6C6F722D33332D6261636B67726F756E64207B0D0A20';
wwv_flow_api.g_varchar2_table(1399) := '206261636B67726F756E642D636F6C6F723A20233138623161652021696D706F7274616E743B0D0A202066696C6C3A20233138623161652021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33332D7478742C0D0A2E752D636F6C6F722D33';
wwv_flow_api.g_varchar2_table(1400) := '332D74657874207B0D0A2020636F6C6F723A20233138623161652021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33332D62642C0D0A2E752D636F6C6F722D33332D626F72646572207B0D0A2020626F726465722D636F6C6F723A202331';
wwv_flow_api.g_varchar2_table(1401) := '38623161652021696D706F7274616E743B0D0A20207374726F6B653A20233138623161652021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3334207B0D0A20206261636B67726F756E642D636F6C6F723A20233234613437352021696D70';
wwv_flow_api.g_varchar2_table(1402) := '6F7274616E743B0D0A202066696C6C3A20233234613437352021696D706F7274616E743B0D0A2020636F6C6F723A20236566666266372021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33342D62672C0D0A2E752D636F6C6F722D33342D';
wwv_flow_api.g_varchar2_table(1403) := '6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233234613437352021696D706F7274616E743B0D0A202066696C6C3A20233234613437352021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33342D74';
wwv_flow_api.g_varchar2_table(1404) := '78742C0D0A2E752D636F6C6F722D33342D74657874207B0D0A2020636F6C6F723A20233234613437352021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33342D62642C0D0A2E752D636F6C6F722D33342D626F72646572207B0D0A202062';
wwv_flow_api.g_varchar2_table(1405) := '6F726465722D636F6C6F723A20233234613437352021696D706F7274616E743B0D0A20207374726F6B653A20233234613437352021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3335207B0D0A20206261636B67726F756E642D636F6C6F';
wwv_flow_api.g_varchar2_table(1406) := '723A20233661616434322021696D706F7274616E743B0D0A202066696C6C3A20233661616434322021696D706F7274616E743B0D0A2020636F6C6F723A20233063313530362021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33352D6267';
wwv_flow_api.g_varchar2_table(1407) := '2C0D0A2E752D636F6C6F722D33352D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233661616434322021696D706F7274616E743B0D0A202066696C6C3A20233661616434322021696D706F7274616E743B0D0A7D';
wwv_flow_api.g_varchar2_table(1408) := '0D0A2E752D636F6C6F722D33352D7478742C0D0A2E752D636F6C6F722D33352D74657874207B0D0A2020636F6C6F723A20233661616434322021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33352D62642C0D0A2E752D636F6C6F722D33';
wwv_flow_api.g_varchar2_table(1409) := '352D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233661616434322021696D706F7274616E743B0D0A20207374726F6B653A20233661616434322021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3336207B0D0A2020';
wwv_flow_api.g_varchar2_table(1410) := '6261636B67726F756E642D636F6C6F723A20236339636133392021696D706F7274616E743B0D0A202066696C6C3A20236339636133392021696D706F7274616E743B0D0A2020636F6C6F723A20233264326530342021696D706F7274616E743B0D0A7D0D';
wwv_flow_api.g_varchar2_table(1411) := '0A2E752D636F6C6F722D33362D62672C0D0A2E752D636F6C6F722D33362D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236339636133392021696D706F7274616E743B0D0A202066696C6C3A2023633963613339';
wwv_flow_api.g_varchar2_table(1412) := '2021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33362D7478742C0D0A2E752D636F6C6F722D33362D74657874207B0D0A2020636F6C6F723A20236339636133392021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33362D';
wwv_flow_api.g_varchar2_table(1413) := '62642C0D0A2E752D636F6C6F722D33362D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236339636133392021696D706F7274616E743B0D0A20207374726F6B653A20236339636133392021696D706F7274616E743B0D0A7D0D0A2E75';
wwv_flow_api.g_varchar2_table(1414) := '2D636F6C6F722D3337207B0D0A20206261636B67726F756E642D636F6C6F723A20236439623133622021696D706F7274616E743B0D0A202066696C6C3A20236439623133622021696D706F7274616E743B0D0A2020636F6C6F723A202334363334303020';
wwv_flow_api.g_varchar2_table(1415) := '21696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33372D62672C0D0A2E752D636F6C6F722D33372D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236439623133622021696D706F7274616E743B0D0A';
wwv_flow_api.g_varchar2_table(1416) := '202066696C6C3A20236439623133622021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33372D7478742C0D0A2E752D636F6C6F722D33372D74657874207B0D0A2020636F6C6F723A20236439623133622021696D706F7274616E743B0D0A';
wwv_flow_api.g_varchar2_table(1417) := '7D0D0A2E752D636F6C6F722D33372D62642C0D0A2E752D636F6C6F722D33372D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236439623133622021696D706F7274616E743B0D0A20207374726F6B653A20236439623133622021696D';
wwv_flow_api.g_varchar2_table(1418) := '706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3338207B0D0A20206261636B67726F756E642D636F6C6F723A20236437366132372021696D706F7274616E743B0D0A202066696C6C3A20236437366132372021696D706F7274616E743B0D0A2020';
wwv_flow_api.g_varchar2_table(1419) := '636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33382D62672C0D0A2E752D636F6C6F722D33382D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236437366132';
wwv_flow_api.g_varchar2_table(1420) := '372021696D706F7274616E743B0D0A202066696C6C3A20236437366132372021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33382D7478742C0D0A2E752D636F6C6F722D33382D74657874207B0D0A2020636F6C6F723A20236437366132';
wwv_flow_api.g_varchar2_table(1421) := '372021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33382D62642C0D0A2E752D636F6C6F722D33382D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236437366132372021696D706F7274616E743B0D0A20207374726F';
wwv_flow_api.g_varchar2_table(1422) := '6B653A20236437366132372021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3339207B0D0A20206261636B67726F756E642D636F6C6F723A20236432343233622021696D706F7274616E743B0D0A202066696C6C3A202364323432336220';
wwv_flow_api.g_varchar2_table(1423) := '21696D706F7274616E743B0D0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33392D62672C0D0A2E752D636F6C6F722D33392D6261636B67726F756E64207B0D0A20206261636B67726F756E';
wwv_flow_api.g_varchar2_table(1424) := '642D636F6C6F723A20236432343233622021696D706F7274616E743B0D0A202066696C6C3A20236432343233622021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33392D7478742C0D0A2E752D636F6C6F722D33392D74657874207B0D0A';
wwv_flow_api.g_varchar2_table(1425) := '2020636F6C6F723A20236432343233622021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33392D62642C0D0A2E752D636F6C6F722D33392D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236432343233622021696D70';
wwv_flow_api.g_varchar2_table(1426) := '6F7274616E743B0D0A20207374726F6B653A20236432343233622021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3430207B0D0A20206261636B67726F756E642D636F6C6F723A20236431343336662021696D706F7274616E743B0D0A20';
wwv_flow_api.g_varchar2_table(1427) := '2066696C6C3A20236431343336662021696D706F7274616E743B0D0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D34302D62672C0D0A2E752D636F6C6F722D34302D6261636B67726F756E64';
wwv_flow_api.g_varchar2_table(1428) := '207B0D0A20206261636B67726F756E642D636F6C6F723A20236431343336662021696D706F7274616E743B0D0A202066696C6C3A20236431343336662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D34302D7478742C0D0A2E752D636F';
wwv_flow_api.g_varchar2_table(1429) := '6C6F722D34302D74657874207B0D0A2020636F6C6F723A20236431343336662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D34302D62642C0D0A2E752D636F6C6F722D34302D626F72646572207B0D0A2020626F726465722D636F6C6F';
wwv_flow_api.g_varchar2_table(1430) := '723A20236431343336662021696D706F7274616E743B0D0A20207374726F6B653A20236431343336662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3431207B0D0A20206261636B67726F756E642D636F6C6F723A2023626133643838';
wwv_flow_api.g_varchar2_table(1431) := '2021696D706F7274616E743B0D0A202066696C6C3A20236261336438382021696D706F7274616E743B0D0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D34312D62672C0D0A2E752D636F6C6F';
wwv_flow_api.g_varchar2_table(1432) := '722D34312D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236261336438382021696D706F7274616E743B0D0A202066696C6C3A20236261336438382021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F72';
wwv_flow_api.g_varchar2_table(1433) := '2D34312D7478742C0D0A2E752D636F6C6F722D34312D74657874207B0D0A2020636F6C6F723A20236261336438382021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D34312D62642C0D0A2E752D636F6C6F722D34312D626F72646572207B';
wwv_flow_api.g_varchar2_table(1434) := '0D0A2020626F726465722D636F6C6F723A20236261336438382021696D706F7274616E743B0D0A20207374726F6B653A20236261336438382021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3432207B0D0A20206261636B67726F756E64';
wwv_flow_api.g_varchar2_table(1435) := '2D636F6C6F723A20233737333339332021696D706F7274616E743B0D0A202066696C6C3A20233737333339332021696D706F7274616E743B0D0A2020636F6C6F723A20236636656666392021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D';
wwv_flow_api.g_varchar2_table(1436) := '34322D62672C0D0A2E752D636F6C6F722D34322D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233737333339332021696D706F7274616E743B0D0A202066696C6C3A20233737333339332021696D706F7274616E';
wwv_flow_api.g_varchar2_table(1437) := '743B0D0A7D0D0A2E752D636F6C6F722D34322D7478742C0D0A2E752D636F6C6F722D34322D74657874207B0D0A2020636F6C6F723A20233737333339332021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D34322D62642C0D0A2E752D636F';
wwv_flow_api.g_varchar2_table(1438) := '6C6F722D34322D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233737333339332021696D706F7274616E743B0D0A20207374726F6B653A20233737333339332021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D343320';
wwv_flow_api.g_varchar2_table(1439) := '7B0D0A20206261636B67726F756E642D636F6C6F723A20233364346561332021696D706F7274616E743B0D0A202066696C6C3A20233364346561332021696D706F7274616E743B0D0A2020636F6C6F723A20236666666666662021696D706F7274616E74';
wwv_flow_api.g_varchar2_table(1440) := '3B0D0A7D0D0A2E752D636F6C6F722D34332D62672C0D0A2E752D636F6C6F722D34332D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233364346561332021696D706F7274616E743B0D0A202066696C6C3A202333';
wwv_flow_api.g_varchar2_table(1441) := '64346561332021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D34332D7478742C0D0A2E752D636F6C6F722D34332D74657874207B0D0A2020636F6C6F723A20233364346561332021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F';
wwv_flow_api.g_varchar2_table(1442) := '722D34332D62642C0D0A2E752D636F6C6F722D34332D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233364346561332021696D706F7274616E743B0D0A20207374726F6B653A20233364346561332021696D706F7274616E743B0D0A';
wwv_flow_api.g_varchar2_table(1443) := '7D0D0A2E752D636F6C6F722D3434207B0D0A20206261636B67726F756E642D636F6C6F723A20233863396562302021696D706F7274616E743B0D0A202066696C6C3A20233863396562302021696D706F7274616E743B0D0A2020636F6C6F723A20233238';
wwv_flow_api.g_varchar2_table(1444) := '336134642021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D34342D62672C0D0A2E752D636F6C6F722D34342D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233863396562302021696D706F727461';
wwv_flow_api.g_varchar2_table(1445) := '6E743B0D0A202066696C6C3A20233863396562302021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D34342D7478742C0D0A2E752D636F6C6F722D34342D74657874207B0D0A2020636F6C6F723A20233863396562302021696D706F727461';
wwv_flow_api.g_varchar2_table(1446) := '6E743B0D0A7D0D0A2E752D636F6C6F722D34342D62642C0D0A2E752D636F6C6F722D34342D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233863396562302021696D706F7274616E743B0D0A20207374726F6B653A20233863396562';
wwv_flow_api.g_varchar2_table(1447) := '302021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3435207B0D0A20206261636B67726F756E642D636F6C6F723A20233465373339312021696D706F7274616E743B0D0A202066696C6C3A20233465373339312021696D706F7274616E74';
wwv_flow_api.g_varchar2_table(1448) := '3B0D0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D34352D62672C0D0A2E752D636F6C6F722D34352D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(1449) := '3465373339312021696D706F7274616E743B0D0A202066696C6C3A20233465373339312021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D34352D7478742C0D0A2E752D636F6C6F722D34352D74657874207B0D0A2020636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(1450) := '3465373339312021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D34352D62642C0D0A2E752D636F6C6F722D34352D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233465373339312021696D706F7274616E743B0D0A20';
wwv_flow_api.g_varchar2_table(1451) := '207374726F6B653A20233465373339312021696D706F7274616E743B0D0A7D0D0A0D0A2E752D636F6C6F722D7472616E73706172656E74207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E742021696D706F7274616E';
wwv_flow_api.g_varchar2_table(1452) := '743B0D0A2020636F6C6F723A207472616E73706172656E742021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D7472616E73706172656E742D6267207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E7420';
wwv_flow_api.g_varchar2_table(1453) := '21696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D7472616E73706172656E742D7478742C0D0A2E752D636F6C6F722D7472616E73706172656E742D74657874207B0D0A2020636F6C6F723A207472616E73706172656E742021696D706F7274';
wwv_flow_api.g_varchar2_table(1454) := '616E743B0D0A7D0D0A2E752D636F6C6F722D7472616E73706172656E742D62642C0D0A2E752D636F6C6F722D7472616E73706172656E742D626F72646572207B0D0A2020626F726465722D636F6C6F723A207472616E73706172656E742021696D706F72';
wwv_flow_api.g_varchar2_table(1455) := '74616E743B0D0A7D0D0A0D0A2F2A200D0A202A204F7261636C65204170706C69636174696F6E204578707265737320352E30205468656D6520526F6C6C657220437573746F6D20435353200D0A202A0D0A202A2F0D0A0D0A68746D6C207B20200D0A2020';
wwv_flow_api.g_varchar2_table(1456) := '666F6E742D73697A653A203832252021696D706F7274616E743B20200D0A7D2020';
null;
end;
/
begin
wwv_flow_api.create_theme_file(
 p_id=>wwv_flow_api.id(19396469788830872)
,p_theme_id=>42
,p_file_name=>'19396030541830856.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
null;
end;
/
prompt --application/shared_components/user_interface/theme_display_points
begin
null;
end;
/
prompt --application/shared_components/user_interface/template_opt_groups
begin
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19128974637620441)
,p_theme_id=>42
,p_name=>'ALERT_TYPE'
,p_display_name=>'Alert Type'
,p_display_sequence=>3
,p_template_types=>'REGION'
,p_help_text=>'Sets the type of alert which can be used to determine the icon, icon color, and the background color.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19129372437620442)
,p_theme_id=>42
,p_name=>'ALERT_TITLE'
,p_display_name=>'Alert Title'
,p_display_sequence=>40
,p_template_types=>'REGION'
,p_help_text=>'Determines how the title of the alert is displayed.'
,p_null_text=>'Visible - Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19129956663620442)
,p_theme_id=>42
,p_name=>'ALERT_ICONS'
,p_display_name=>'Alert Icons'
,p_display_sequence=>2
,p_template_types=>'REGION'
,p_help_text=>'Sets how icons are handled for the Alert Region.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19130344352620442)
,p_theme_id=>42
,p_name=>'ALERT_DISPLAY'
,p_display_name=>'Alert Display'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the layout of the Alert Region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19133714007620444)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>40
,p_template_types=>'REGION'
,p_help_text=>'Determines how the region is styled. Use the "Remove Borders" template option to remove the region''s borders and shadows.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19134180055620444)
,p_theme_id=>42
,p_name=>'BODY_PADDING'
,p_display_name=>'Body Padding'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the Region Body padding for the region.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19135955069620446)
,p_theme_id=>42
,p_name=>'TIMER'
,p_display_name=>'Timer'
,p_display_sequence=>2
,p_template_types=>'REGION'
,p_help_text=>'Sets the timer for when to automatically navigate to the next region within the Carousel Region.'
,p_null_text=>'No Timer'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19136701998620446)
,p_theme_id=>42
,p_name=>'BODY_HEIGHT'
,p_display_name=>'Body Height'
,p_display_sequence=>10
,p_template_types=>'REGION'
,p_help_text=>'Sets the Region Body height. You can also specify a custom height by modifying the Region''s CSS Classes and using the height helper classes "i-hXXX" where XXX is any increment of 10 from 100 to 800.'
,p_null_text=>'Auto - Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19137922530620447)
,p_theme_id=>42
,p_name=>'ACCENT'
,p_display_name=>'Accent'
,p_display_sequence=>30
,p_template_types=>'REGION'
,p_help_text=>'Set the Region''s accent. This accent corresponds to a Theme-Rollable color and sets the background of the Region''s Header.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19139144322620447)
,p_theme_id=>42
,p_name=>'HEADER'
,p_display_name=>'Header'
,p_display_sequence=>20
,p_template_types=>'REGION'
,p_help_text=>'Determines the display of the Region Header which also contains the Region Title.'
,p_null_text=>'Visible - Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19139545657620447)
,p_theme_id=>42
,p_name=>'BODY_OVERFLOW'
,p_display_name=>'Body Overflow'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Determines the scroll behavior when the region contents are larger than their container.'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19141584409620448)
,p_theme_id=>42
,p_name=>'ANIMATION'
,p_display_name=>'Animation'
,p_display_sequence=>10
,p_template_types=>'REGION'
,p_help_text=>'Sets the animation when navigating within the Carousel Region.'
,p_null_text=>'Fade'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19144938381620450)
,p_theme_id=>42
,p_name=>'DEFAULT_STATE'
,p_display_name=>'Default State'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the default state of the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19145329782620450)
,p_theme_id=>42
,p_name=>'COLLAPSIBLE_ICON_POSITION'
,p_display_name=>'Collapsible Icon Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Determines the position of the expand and collapse toggle for the region.'
,p_null_text=>'Start'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19146173881620450)
,p_theme_id=>42
,p_name=>'COLLAPSIBLE_BUTTON_ICONS'
,p_display_name=>'Collapsible Button Icons'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Determines which arrows to use to represent the icons for the collapse and expand button.'
,p_null_text=>'Arrows'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19148141760620451)
,p_theme_id=>42
,p_name=>'REGION_TITLE'
,p_display_name=>'Region Title'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the source of the Title Bar region''s title.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19148941178620452)
,p_theme_id=>42
,p_name=>'BODY_STYLE'
,p_display_name=>'Body Style'
,p_display_sequence=>20
,p_template_types=>'REGION'
,p_help_text=>'Controls the display of the region''s body container.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19150237383620453)
,p_theme_id=>42
,p_name=>'DISPLAY_ICON'
,p_display_name=>'Display Icon'
,p_display_sequence=>50
,p_template_types=>'REGION'
,p_help_text=>'Display the Hero Region icon.'
,p_null_text=>'Yes (Default)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19150806737620453)
,p_theme_id=>42
,p_name=>'ICON_SHAPE'
,p_display_name=>'Icon Shape'
,p_display_sequence=>60
,p_template_types=>'REGION'
,p_help_text=>'Determines the shape of the icon.'
,p_null_text=>'Rounded Corners'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19152739695620454)
,p_theme_id=>42
,p_name=>'DIALOG_SIZE'
,p_display_name=>'Dialog Size'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19164700024620459)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19165113637620459)
,p_theme_id=>42
,p_name=>'TAB_STYLE'
,p_display_name=>'Tab Style'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19165901245620460)
,p_theme_id=>42
,p_name=>'TABS_SIZE'
,p_display_name=>'Tabs Size'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19168003783620461)
,p_theme_id=>42
,p_name=>'HIDE_STEPS_FOR'
,p_display_name=>'Hide Steps For'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19169207686620463)
,p_theme_id=>42
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19169609697620463)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>30
,p_template_types=>'REPORT'
,p_help_text=>'Determines the layout of Cards in the report.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19171672087620464)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Determines the overall style for the component.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19173264407620465)
,p_theme_id=>42
,p_name=>'COMMENTS_STYLE'
,p_display_name=>'Comments Style'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Determines the style in which comments are displayed.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19173600047620465)
,p_theme_id=>42
,p_name=>'ICON_SHAPE'
,p_display_name=>'Icon Shape'
,p_display_sequence=>60
,p_template_types=>'REPORT'
,p_help_text=>'Determines the shape of the icon.'
,p_null_text=>'Circle'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19176031161620467)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>35
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19177604188620468)
,p_theme_id=>42
,p_name=>'ALTERNATING_ROWS'
,p_display_name=>'Alternating Rows'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Shades alternate rows in the report with slightly different background colors.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19178206633620469)
,p_theme_id=>42
,p_name=>'ROW_HIGHLIGHTING'
,p_display_name=>'Row Highlighting'
,p_display_sequence=>20
,p_template_types=>'REPORT'
,p_help_text=>'Determines whether you want the row to be highlighted on hover.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19178620489620469)
,p_theme_id=>42
,p_name=>'REPORT_BORDER'
,p_display_name=>'Report Border'
,p_display_sequence=>30
,p_template_types=>'REPORT'
,p_help_text=>'Controls the display of the Report''s borders.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19180220539620470)
,p_theme_id=>42
,p_name=>'LABEL_WIDTH'
,p_display_name=>'Label Width'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19184614120620472)
,p_theme_id=>42
,p_name=>'BODY_TEXT'
,p_display_name=>'Body Text'
,p_display_sequence=>40
,p_template_types=>'REPORT'
,p_help_text=>'Determines the height of the card body.'
,p_null_text=>'Auto'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19186436028620473)
,p_theme_id=>42
,p_name=>'ANIMATION'
,p_display_name=>'Animation'
,p_display_sequence=>70
,p_template_types=>'REPORT'
,p_help_text=>'Sets the hover and focus animation.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19187296570620473)
,p_theme_id=>42
,p_name=>'ICONS'
,p_display_name=>'Icons'
,p_display_sequence=>20
,p_template_types=>'REPORT'
,p_help_text=>'Controls how to handle icons in the report.'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19189852048620479)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>30
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19191035724620480)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>10
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19192228273620481)
,p_theme_id=>42
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>70
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19194083133620481)
,p_theme_id=>42
,p_name=>'BODY_TEXT'
,p_display_name=>'Body Text'
,p_display_sequence=>40
,p_template_types=>'LIST'
,p_help_text=>'Determines the height of the card body.'
,p_null_text=>'Auto'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19196043137620482)
,p_theme_id=>42
,p_name=>'ANIMATION'
,p_display_name=>'Animation'
,p_display_sequence=>80
,p_template_types=>'LIST'
,p_help_text=>'Sets the hover and focus animation.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19196606876620483)
,p_theme_id=>42
,p_name=>'ICONS'
,p_display_name=>'Icons'
,p_display_sequence=>20
,p_template_types=>'LIST'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19198073098620483)
,p_theme_id=>42
,p_name=>'ICON_SHAPE'
,p_display_name=>'Icon Shape'
,p_display_sequence=>60
,p_template_types=>'LIST'
,p_help_text=>'Determines the shape of the icon.'
,p_null_text=>'Circle'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19200828119620484)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19205267862620488)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>30
,p_template_types=>'LIST'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19207028234620488)
,p_theme_id=>42
,p_name=>'MOBILE'
,p_display_name=>'Mobile'
,p_display_sequence=>100
,p_template_types=>'LIST'
,p_help_text=>'Determines the display for a mobile-sized screen'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19207635399620489)
,p_theme_id=>42
,p_name=>'DESKTOP'
,p_display_name=>'Desktop'
,p_display_sequence=>90
,p_template_types=>'LIST'
,p_help_text=>'Determines the display for a desktop-sized screen'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19208602587620489)
,p_theme_id=>42
,p_name=>'LABEL_DISPLAY'
,p_display_name=>'Label Display'
,p_display_sequence=>50
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19212690568620497)
,p_theme_id=>42
,p_name=>'ICON_HOVER_ANIMATION'
,p_display_name=>'Icon Hover Animation'
,p_display_sequence=>55
,p_template_types=>'BUTTON'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19213688992620498)
,p_theme_id=>42
,p_name=>'ICON_POSITION'
,p_display_name=>'Icon Position'
,p_display_sequence=>50
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the position of the icon relative to the label.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19216102535620538)
,p_theme_id=>42
,p_name=>'BOTTOM_MARGIN'
,p_display_name=>'Bottom Margin'
,p_display_sequence=>220
,p_template_types=>'FIELD'
,p_help_text=>'Set the bottom margin for this field.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19216508926620538)
,p_theme_id=>42
,p_name=>'REGION_BOTTOM_MARGIN'
,p_display_name=>'Bottom Margin'
,p_display_sequence=>210
,p_template_types=>'REGION'
,p_help_text=>'Set the bottom margin for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19218143505620539)
,p_theme_id=>42
,p_name=>'LEFT_MARGIN'
,p_display_name=>'Left Margin'
,p_display_sequence=>220
,p_template_types=>'FIELD'
,p_help_text=>'Set the left margin for this field.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19218534625620539)
,p_theme_id=>42
,p_name=>'REGION_LEFT_MARGIN'
,p_display_name=>'Left Margin'
,p_display_sequence=>220
,p_template_types=>'REGION'
,p_help_text=>'Set the left margin for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19220153938620540)
,p_theme_id=>42
,p_name=>'RIGHT_MARGIN'
,p_display_name=>'Right Margin'
,p_display_sequence=>230
,p_template_types=>'FIELD'
,p_help_text=>'Set the right margin for this field.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19220507566620540)
,p_theme_id=>42
,p_name=>'REGION_RIGHT_MARGIN'
,p_display_name=>'Right Margin'
,p_display_sequence=>230
,p_template_types=>'REGION'
,p_help_text=>'Set the right margin for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19222106338620541)
,p_theme_id=>42
,p_name=>'TOP_MARGIN'
,p_display_name=>'Top Margin'
,p_display_sequence=>200
,p_template_types=>'FIELD'
,p_help_text=>'Set the top margin for this field.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19222500965620541)
,p_theme_id=>42
,p_name=>'REGION_TOP_MARGIN'
,p_display_name=>'Top Margin'
,p_display_sequence=>200
,p_template_types=>'REGION'
,p_help_text=>'Set the top margin for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19224101441620542)
,p_theme_id=>42
,p_name=>'TYPE'
,p_display_name=>'Type'
,p_display_sequence=>20
,p_template_types=>'BUTTON'
,p_null_text=>'Normal'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19224521240620542)
,p_theme_id=>42
,p_name=>'SPACING_BOTTOM'
,p_display_name=>'Spacing Bottom'
,p_display_sequence=>100
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the bottom of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19224913046620542)
,p_theme_id=>42
,p_name=>'SPACING_LEFT'
,p_display_name=>'Spacing Left'
,p_display_sequence=>70
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the left of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19225350902620542)
,p_theme_id=>42
,p_name=>'SPACING_RIGHT'
,p_display_name=>'Spacing Right'
,p_display_sequence=>80
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the right of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19225733983620542)
,p_theme_id=>42
,p_name=>'SPACING_TOP'
,p_display_name=>'Spacing Top'
,p_display_sequence=>90
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the top of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19226135789620543)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>10
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the size of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19226589327620543)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>30
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the style of the button. Use the "Simple" option for secondary actions or sets of buttons. Use the "Remove UI Decoration" option to make the button appear as text.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19227953483620543)
,p_theme_id=>42
,p_name=>'BUTTON_SET'
,p_display_name=>'Button Set'
,p_display_sequence=>40
,p_template_types=>'BUTTON'
,p_help_text=>'Enables you to group many buttons together into a pill. You can use this option to specify where the button is within this set. Set the option to Default if this button is not part of a button set.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19229343091620544)
,p_theme_id=>42
,p_name=>'WIDTH'
,p_display_name=>'Width'
,p_display_sequence=>60
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the width of the button.'
,p_null_text=>'Auto - Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19230324904620544)
,p_theme_id=>42
,p_name=>'LABEL_POSITION'
,p_display_name=>'Label Position'
,p_display_sequence=>140
,p_template_types=>'REGION'
,p_help_text=>'Sets the position of the label relative to the form item.'
,p_null_text=>'Inline - Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19230770948620545)
,p_theme_id=>42
,p_name=>'ITEM_SIZE'
,p_display_name=>'Item Size'
,p_display_sequence=>110
,p_template_types=>'REGION'
,p_help_text=>'Sets the size of the form items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19231137941620545)
,p_theme_id=>42
,p_name=>'LABEL_ALIGNMENT'
,p_display_name=>'Label Alignment'
,p_display_sequence=>130
,p_template_types=>'REGION'
,p_help_text=>'Set the label text alignment for items within this region.'
,p_null_text=>'Right'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19231570381620545)
,p_theme_id=>42
,p_name=>'ITEM_PADDING'
,p_display_name=>'Item Padding'
,p_display_sequence=>100
,p_template_types=>'REGION'
,p_help_text=>'Sets the padding around items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19232110531620545)
,p_theme_id=>42
,p_name=>'ITEM_WIDTH'
,p_display_name=>'Item Width'
,p_display_sequence=>120
,p_template_types=>'REGION'
,p_help_text=>'Sets the width of the form items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19232780040620546)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>10
,p_template_types=>'FIELD'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19233147408620546)
,p_theme_id=>42
,p_name=>'ITEM_POST_TEXT'
,p_display_name=>'Item Post Text'
,p_display_sequence=>30
,p_template_types=>'FIELD'
,p_help_text=>'Adjust the display of the Item Post Text'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19233511971620546)
,p_theme_id=>42
,p_name=>'ITEM_PRE_TEXT'
,p_display_name=>'Item Pre Text'
,p_display_sequence=>20
,p_template_types=>'FIELD'
,p_help_text=>'Adjust the display of the Item Pre Text'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19233959427620546)
,p_theme_id=>42
,p_name=>'RADIO_GROUP_DISPLAY'
,p_display_name=>'Item Group Display'
,p_display_sequence=>300
,p_template_types=>'FIELD'
,p_help_text=>'Determines the display style for radio and check box items.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(19234736396620547)
,p_theme_id=>42
,p_name=>'PAGINATION_DISPLAY'
,p_display_name=>'Pagination Display'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Controls the display of pagination for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
end;
/
prompt --application/shared_components/user_interface/template_options
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19110273456620421)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(19107591783620406)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19113307280620422)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(19110341888620421)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19117249620620425)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(19114276887620423)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19120087390620426)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(19117309870620425)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19121309367620427)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>20
,p_page_template_id=>wwv_flow_api.id(19120123963620426)
,p_css_classes=>'t-Dialog--noPadding'
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19121576527620427)
,p_theme_id=>42
,p_name=>'STRETCH_TO_FIT_WINDOW'
,p_display_name=>'Stretch to Fit Window'
,p_display_sequence=>10
,p_page_template_id=>wwv_flow_api.id(19120123963620426)
,p_css_classes=>'ui-dialog--stretch'
,p_template_types=>'PAGE'
,p_help_text=>'Stretch the dialog to fit the browser window.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19122803434620427)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>20
,p_page_template_id=>wwv_flow_api.id(19121669008620427)
,p_css_classes=>'t-Dialog--noPadding'
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19123090280620427)
,p_theme_id=>42
,p_name=>'STRETCH_TO_FIT_WINDOW'
,p_display_name=>'Stretch to Fit Window'
,p_display_sequence=>1
,p_page_template_id=>wwv_flow_api.id(19121669008620427)
,p_css_classes=>'ui-dialog--stretch'
,p_template_types=>'PAGE'
,p_help_text=>'Stretch the dialog to fit the browser window.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19125537896620429)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(19123173280620428)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19128040708620430)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(19125694513620429)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19128753051620440)
,p_theme_id=>42
,p_name=>'COLOREDBACKGROUND'
,p_display_name=>'Highlight Background'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(19128129091620433)
,p_css_classes=>'t-Alert--colorBG'
,p_template_types=>'REGION'
,p_help_text=>'Set alert background color to that of the alert type (warning, success, etc.)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19129186122620441)
,p_theme_id=>42
,p_name=>'DANGER'
,p_display_name=>'Danger'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(19128129091620433)
,p_css_classes=>'t-Alert--danger'
,p_group_id=>wwv_flow_api.id(19128974637620441)
,p_template_types=>'REGION'
,p_help_text=>'Show an error or danger alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19129571827620442)
,p_theme_id=>42
,p_name=>'HIDDENHEADER'
,p_display_name=>'Hidden but Accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(19128129091620433)
,p_css_classes=>'t-Alert--accessibleHeading'
,p_group_id=>wwv_flow_api.id(19129372437620442)
,p_template_types=>'REGION'
,p_help_text=>'Visually hides the alert title, but assistive technologies can still read it.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19129774471620442)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(19128129091620433)
,p_css_classes=>'t-Alert--removeHeading'
,p_group_id=>wwv_flow_api.id(19129372437620442)
,p_template_types=>'REGION'
,p_help_text=>'Hides the Alert Title from being displayed.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19130154661620442)
,p_theme_id=>42
,p_name=>'HIDE_ICONS'
,p_display_name=>'Hide Icons'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(19128129091620433)
,p_css_classes=>'t-Alert--noIcon'
,p_group_id=>wwv_flow_api.id(19129956663620442)
,p_template_types=>'REGION'
,p_help_text=>'Hides alert icons'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19130586441620442)
,p_theme_id=>42
,p_name=>'HORIZONTAL'
,p_display_name=>'Horizontal'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(19128129091620433)
,p_css_classes=>'t-Alert--horizontal'
,p_group_id=>wwv_flow_api.id(19130344352620442)
,p_template_types=>'REGION'
,p_help_text=>'Show horizontal alert with buttons to the right.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19130712997620442)
,p_theme_id=>42
,p_name=>'INFORMATION'
,p_display_name=>'Information'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(19128129091620433)
,p_css_classes=>'t-Alert--info'
,p_group_id=>wwv_flow_api.id(19128974637620441)
,p_template_types=>'REGION'
,p_help_text=>'Show informational alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19130961926620442)
,p_theme_id=>42
,p_name=>'SHOW_CUSTOM_ICONS'
,p_display_name=>'Show Custom Icons'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(19128129091620433)
,p_css_classes=>'t-Alert--customIcons'
,p_group_id=>wwv_flow_api.id(19129956663620442)
,p_template_types=>'REGION'
,p_help_text=>'Set custom icons by modifying the Alert Region''s Icon CSS Classes property.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19131113909620442)
,p_theme_id=>42
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(19128129091620433)
,p_css_classes=>'t-Alert--success'
,p_group_id=>wwv_flow_api.id(19128974637620441)
,p_template_types=>'REGION'
,p_help_text=>'Show success alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19131302484620443)
,p_theme_id=>42
,p_name=>'USEDEFAULTICONS'
,p_display_name=>'Show Default Icons'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(19128129091620433)
,p_css_classes=>'t-Alert--defaultIcons'
,p_group_id=>wwv_flow_api.id(19129956663620442)
,p_template_types=>'REGION'
,p_help_text=>'Uses default icons for alert types.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19131558637620443)
,p_theme_id=>42
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(19128129091620433)
,p_css_classes=>'t-Alert--warning'
,p_group_id=>wwv_flow_api.id(19128974637620441)
,p_template_types=>'REGION'
,p_help_text=>'Show a warning alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19131750321620443)
,p_theme_id=>42
,p_name=>'WIZARD'
,p_display_name=>'Wizard'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(19128129091620433)
,p_css_classes=>'t-Alert--wizard'
,p_group_id=>wwv_flow_api.id(19130344352620442)
,p_template_types=>'REGION'
,p_help_text=>'Show the alert in a wizard style region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19133949736620444)
,p_theme_id=>42
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(19132834427620444)
,p_css_classes=>'t-ButtonRegion--noBorder'
,p_group_id=>wwv_flow_api.id(19133714007620444)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19134330849620445)
,p_theme_id=>42
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>3
,p_region_template_id=>wwv_flow_api.id(19132834427620444)
,p_css_classes=>'t-ButtonRegion--noPadding'
,p_group_id=>wwv_flow_api.id(19134180055620444)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19134581090620445)
,p_theme_id=>42
,p_name=>'REMOVEUIDECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>4
,p_region_template_id=>wwv_flow_api.id(19132834427620444)
,p_css_classes=>'t-ButtonRegion--noUI'
,p_group_id=>wwv_flow_api.id(19133714007620444)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19134769900620445)
,p_theme_id=>42
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>5
,p_region_template_id=>wwv_flow_api.id(19132834427620444)
,p_css_classes=>'t-ButtonRegion--slimPadding'
,p_group_id=>wwv_flow_api.id(19134180055620444)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19134917746620445)
,p_theme_id=>42
,p_name=>'STICK_TO_BOTTOM'
,p_display_name=>'Stick to Bottom for Mobile'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(19132834427620444)
,p_css_classes=>'t-ButtonRegion--stickToBottom'
,p_template_types=>'REGION'
,p_help_text=>'This will position the button container region to the bottom of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19136187155620446)
,p_theme_id=>42
,p_name=>'10_SECONDS'
,p_display_name=>'10 Seconds'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(19135013278620445)
,p_css_classes=>'js-cycle10s'
,p_group_id=>wwv_flow_api.id(19135955069620446)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19136369619620446)
,p_theme_id=>42
,p_name=>'15_SECONDS'
,p_display_name=>'15 Seconds'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(19135013278620445)
,p_css_classes=>'js-cycle15s'
,p_group_id=>wwv_flow_api.id(19135955069620446)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19136592808620446)
,p_theme_id=>42
,p_name=>'20_SECONDS'
,p_display_name=>'20 Seconds'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(19135013278620445)
,p_css_classes=>'js-cycle20s'
,p_group_id=>wwv_flow_api.id(19135955069620446)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19136938239620446)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(19135013278620445)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_api.id(19136701998620446)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19137107063620446)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(19135013278620445)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_api.id(19136701998620446)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19137308575620447)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(19135013278620445)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_api.id(19136701998620446)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19137537472620447)
,p_theme_id=>42
,p_name=>'5_SECONDS'
,p_display_name=>'5 Seconds'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(19135013278620445)
,p_css_classes=>'js-cycle5s'
,p_group_id=>wwv_flow_api.id(19135955069620446)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19137702819620447)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(19135013278620445)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_api.id(19136701998620446)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19138128289620447)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(19135013278620445)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_api.id(19137922530620447)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19138341883620447)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(19135013278620445)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_api.id(19137922530620447)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19138561272620447)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(19135013278620445)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_api.id(19137922530620447)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19138752350620447)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(19135013278620445)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_api.id(19137922530620447)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19138972354620447)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(19135013278620445)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_api.id(19137922530620447)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19139312201620447)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(19135013278620445)
,p_css_classes=>'t-Region--removeHeader'
,p_group_id=>wwv_flow_api.id(19139144322620447)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19139710680620448)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(19135013278620445)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_api.id(19139545657620447)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19139934044620448)
,p_theme_id=>42
,p_name=>'HIDEREGIONHEADER'
,p_display_name=>'Hidden but accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(19135013278620445)
,p_css_classes=>'t-Region--hideHeader'
,p_group_id=>wwv_flow_api.id(19139144322620447)
,p_template_types=>'REGION'
,p_help_text=>'This option will hide the region header.  Note that the region title will still be audible for Screen Readers. Buttons placed in the region header will be hidden and inaccessible.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19140130648620448)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(19135013278620445)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19140339909620448)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(19135013278620445)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Region Header to maximize the region. Clicking this button will toggle the maximize state and stretch the region to fill the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19140505685620448)
,p_theme_id=>42
,p_name=>'SHOW_NEXT_AND_PREVIOUS_BUTTONS'
,p_display_name=>'Show Next and Previous Buttons'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(19135013278620445)
,p_css_classes=>'t-Region--showCarouselControls'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19140721847620448)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(19135013278620445)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_api.id(19133714007620444)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19140927900620448)
,p_theme_id=>42
,p_name=>'REMEMBER_CAROUSEL_SLIDE'
,p_display_name=>'Remember Carousel Slide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(19135013278620445)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19141159207620448)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(19135013278620445)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_api.id(19139545657620447)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19141373522620448)
,p_theme_id=>42
,p_name=>'SHOW_REGION_ICON'
,p_display_name=>'Show Region Icon'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(19135013278620445)
,p_css_classes=>'t-Region--showIcon'
,p_template_types=>'REGION'
,p_help_text=>'Displays the region icon in the region header beside the region title'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19141708190620449)
,p_theme_id=>42
,p_name=>'SLIDE'
,p_display_name=>'Slide'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(19135013278620445)
,p_css_classes=>'t-Region--carouselSlide'
,p_group_id=>wwv_flow_api.id(19141584409620448)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19141987236620449)
,p_theme_id=>42
,p_name=>'SPIN'
,p_display_name=>'Spin'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(19135013278620445)
,p_css_classes=>'t-Region--carouselSpin'
,p_group_id=>wwv_flow_api.id(19141584409620448)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19142186749620449)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(19135013278620445)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_api.id(19133714007620444)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19143191521620449)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(19142249258620449)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_api.id(19136701998620446)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19143390795620449)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(19142249258620449)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_api.id(19136701998620446)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19143576584620449)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(19142249258620449)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_api.id(19136701998620446)
,p_template_types=>'REGION'
,p_help_text=>'Sets body height to 480px.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19143768808620449)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(19142249258620449)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_api.id(19136701998620446)
,p_template_types=>'REGION'
,p_help_text=>'Sets body height to 640px.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19143977300620450)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(19142249258620449)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_api.id(19137922530620447)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19144132286620450)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(19142249258620449)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_api.id(19137922530620447)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19144329726620450)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(19142249258620449)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_api.id(19137922530620447)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19144583117620450)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(19142249258620449)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_api.id(19137922530620447)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19144725689620450)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(19142249258620449)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_api.id(19137922530620447)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19145160384620450)
,p_theme_id=>42
,p_name=>'COLLAPSED'
,p_display_name=>'Collapsed'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(19142249258620449)
,p_css_classes=>'is-collapsed'
,p_group_id=>wwv_flow_api.id(19144938381620450)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19145578642620450)
,p_theme_id=>42
,p_name=>'CONRTOLS_POSITION_END'
,p_display_name=>'End'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(19142249258620449)
,p_css_classes=>'t-Region--controlsPosEnd'
,p_group_id=>wwv_flow_api.id(19145329782620450)
,p_template_types=>'REGION'
,p_help_text=>'Position the expand / collapse button to the end of the region header.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19145723413620450)
,p_theme_id=>42
,p_name=>'EXPANDED'
,p_display_name=>'Expanded'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(19142249258620449)
,p_css_classes=>'is-expanded'
,p_group_id=>wwv_flow_api.id(19144938381620450)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19145972296620450)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(19142249258620449)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_api.id(19139545657620447)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19146340859620450)
,p_theme_id=>42
,p_name=>'ICONS_PLUS_OR_MINUS'
,p_display_name=>'Plus or Minus'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(19142249258620449)
,p_css_classes=>'t-Region--hideShowIconsMath'
,p_group_id=>wwv_flow_api.id(19146173881620450)
,p_template_types=>'REGION'
,p_help_text=>'Use the plus and minus icons for the expand and collapse button.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19146566365620451)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(19142249258620449)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19146721449620451)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(19142249258620449)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_api.id(19133714007620444)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19146953200620451)
,p_theme_id=>42
,p_name=>'REMEMBER_COLLAPSIBLE_STATE'
,p_display_name=>'Remember Collapsible State'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(19142249258620449)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
,p_help_text=>'This option saves the current state of the collapsible region for the duration of the session.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19147175334620451)
,p_theme_id=>42
,p_name=>'REMOVE_UI_DECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(19142249258620449)
,p_css_classes=>'t-Region--noUI'
,p_group_id=>wwv_flow_api.id(19133714007620444)
,p_template_types=>'REGION'
,p_help_text=>'Removes UI decoration (borders, backgrounds, shadows, etc) from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19147329697620451)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll - Default'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(19142249258620449)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_api.id(19139545657620447)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19147561049620451)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(19142249258620449)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_api.id(19133714007620444)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19147963409620451)
,p_theme_id=>42
,p_name=>'ADD_BODY_PADDING'
,p_display_name=>'Add Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(19147675423620451)
,p_css_classes=>'t-ContentBlock--padded'
,p_template_types=>'REGION'
,p_help_text=>'Adds padding to the region''s body container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19148357258620451)
,p_theme_id=>42
,p_name=>'CONTENT_TITLE_H1'
,p_display_name=>'Heading Level 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(19147675423620451)
,p_css_classes=>'t-ContentBlock--h1'
,p_group_id=>wwv_flow_api.id(19148141760620451)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19148575456620451)
,p_theme_id=>42
,p_name=>'CONTENT_TITLE_H2'
,p_display_name=>'Heading Level 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(19147675423620451)
,p_css_classes=>'t-ContentBlock--h2'
,p_group_id=>wwv_flow_api.id(19148141760620451)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19148720912620452)
,p_theme_id=>42
,p_name=>'CONTENT_TITLE_H3'
,p_display_name=>'Heading Level 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(19147675423620451)
,p_css_classes=>'t-ContentBlock--h3'
,p_group_id=>wwv_flow_api.id(19148141760620451)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19149138195620452)
,p_theme_id=>42
,p_name=>'LIGHT_BACKGROUND'
,p_display_name=>'Light Background'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(19147675423620451)
,p_css_classes=>'t-ContentBlock--lightBG'
,p_group_id=>wwv_flow_api.id(19148941178620452)
,p_template_types=>'REGION'
,p_help_text=>'Gives the region body a slightly lighter background.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19149300897620452)
,p_theme_id=>42
,p_name=>'SHADOW_BACKGROUND'
,p_display_name=>'Shadow Background'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(19147675423620451)
,p_css_classes=>'t-ContentBlock--shadowBG'
,p_group_id=>wwv_flow_api.id(19148941178620452)
,p_template_types=>'REGION'
,p_help_text=>'Gives the region body a slightly darker background.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19149592192620452)
,p_theme_id=>42
,p_name=>'SHOW_REGION_ICON'
,p_display_name=>'Show Region Icon'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(19147675423620451)
,p_css_classes=>'t-ContentBlock--showIcon'
,p_template_types=>'REGION'
,p_help_text=>'Displays the region icon in the region header beside the region title'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19150460403620453)
,p_theme_id=>42
,p_name=>'DISPLAY_ICON_NO'
,p_display_name=>'No'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(19149613375620452)
,p_css_classes=>'t-HeroRegion--hideIcon'
,p_group_id=>wwv_flow_api.id(19150237383620453)
,p_template_types=>'REGION'
,p_help_text=>'Hide the Hero Region icon.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19150631430620453)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(19149613375620452)
,p_css_classes=>'t-HeroRegion--featured'
,p_group_id=>wwv_flow_api.id(19133714007620444)
,p_template_types=>'REGION'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19151094483620453)
,p_theme_id=>42
,p_name=>'ICONS_CIRCULAR'
,p_display_name=>'Circle'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(19149613375620452)
,p_css_classes=>'t-HeroRegion--iconsCircle'
,p_group_id=>wwv_flow_api.id(19150806737620453)
,p_template_types=>'REGION'
,p_help_text=>'The icons are displayed within a circle.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19151223306620453)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(19149613375620452)
,p_css_classes=>'t-HeroRegion--iconsSquare'
,p_group_id=>wwv_flow_api.id(19150806737620453)
,p_template_types=>'REGION'
,p_help_text=>'The icons are displayed within a square.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19151447993620453)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(19149613375620452)
,p_css_classes=>'t-HeroRegion--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes the padding around the hero region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19151674017620453)
,p_theme_id=>42
,p_name=>'STACKED_FEATURED'
,p_display_name=>'Stacked Featured'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(19149613375620452)
,p_css_classes=>'t-HeroRegion--featured t-HeroRegion--centered'
,p_group_id=>wwv_flow_api.id(19133714007620444)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19152323187620454)
,p_theme_id=>42
,p_name=>'AUTO_HEIGHT_INLINE_DIALOG'
,p_display_name=>'Auto Height'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(19151727036620453)
,p_css_classes=>'js-dialog-autoheight'
,p_template_types=>'REGION'
,p_help_text=>'This option will set the height of the dialog to fit its contents.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19152557302620454)
,p_theme_id=>42
,p_name=>'DRAGGABLE'
,p_display_name=>'Draggable'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(19151727036620453)
,p_css_classes=>'js-draggable'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19152907827620454)
,p_theme_id=>42
,p_name=>'LARGE_720X480'
,p_display_name=>'Large (720x480)'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(19151727036620453)
,p_css_classes=>'js-dialog-size720x480'
,p_group_id=>wwv_flow_api.id(19152739695620454)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19153177629620454)
,p_theme_id=>42
,p_name=>'MEDIUM_600X400'
,p_display_name=>'Medium (600x400)'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(19151727036620453)
,p_css_classes=>'js-dialog-size600x400'
,p_group_id=>wwv_flow_api.id(19152739695620454)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19153313346620454)
,p_theme_id=>42
,p_name=>'MODAL'
,p_display_name=>'Modal'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(19151727036620453)
,p_css_classes=>'js-modal'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19153557994620454)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>5
,p_region_template_id=>wwv_flow_api.id(19151727036620453)
,p_css_classes=>'t-DialogRegion--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes the padding around the region body.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19153729809620454)
,p_theme_id=>42
,p_name=>'RESIZABLE'
,p_display_name=>'Resizable'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(19151727036620453)
,p_css_classes=>'js-resizable'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19153900137620454)
,p_theme_id=>42
,p_name=>'SMALL_480X320'
,p_display_name=>'Small (480x320)'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(19151727036620453)
,p_css_classes=>'js-dialog-size480x320'
,p_group_id=>wwv_flow_api.id(19152739695620454)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19154610649620455)
,p_theme_id=>42
,p_name=>'AUTO_HEIGHT_INLINE_DIALOG'
,p_display_name=>'Auto Height'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(19154053425620454)
,p_css_classes=>'js-dialog-autoheight'
,p_template_types=>'REGION'
,p_help_text=>'This option will set the height of the dialog to fit its contents.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19154886380620455)
,p_theme_id=>42
,p_name=>'LARGE_720X480'
,p_display_name=>'Large (720x480)'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(19154053425620454)
,p_css_classes=>'js-dialog-size720x480'
,p_group_id=>wwv_flow_api.id(19152739695620454)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19155095279620455)
,p_theme_id=>42
,p_name=>'MEDIUM_600X400'
,p_display_name=>'Medium (600x400)'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(19154053425620454)
,p_css_classes=>'js-dialog-size600x400'
,p_group_id=>wwv_flow_api.id(19152739695620454)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19155228952620455)
,p_theme_id=>42
,p_name=>'NONE'
,p_display_name=>'None'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(19154053425620454)
,p_css_classes=>'js-dialog-nosize'
,p_group_id=>wwv_flow_api.id(19152739695620454)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19155406599620455)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(19154053425620454)
,p_css_classes=>'t-DialogRegion--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes the padding around the region body.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19155691962620455)
,p_theme_id=>42
,p_name=>'REMOVE_PAGE_OVERLAY'
,p_display_name=>'Remove Page Overlay'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(19154053425620454)
,p_css_classes=>'js-popup-noOverlay'
,p_template_types=>'REGION'
,p_help_text=>'This option will display the inline dialog without an overlay on the background.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19155889568620455)
,p_theme_id=>42
,p_name=>'SMALL_480X320'
,p_display_name=>'Small (480x320)'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(19154053425620454)
,p_css_classes=>'js-dialog-size480x320'
,p_group_id=>wwv_flow_api.id(19152739695620454)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19156290266620455)
,p_theme_id=>42
,p_name=>'REMOVEBORDERS'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(19155944385620455)
,p_css_classes=>'t-IRR-region--noBorders'
,p_template_types=>'REGION'
,p_help_text=>'Removes borders around the Interactive Report'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19156440800620455)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(19155944385620455)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Interactive Reports toolbar to maximize the report. Clicking this button will toggle the maximize state and stretch the report to fill the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19157982208620456)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(19157096164620456)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_api.id(19136701998620446)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19158124168620456)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(19157096164620456)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_api.id(19136701998620446)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19158334674620456)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(19157096164620456)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_api.id(19136701998620446)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19158503809620456)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(19157096164620456)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_api.id(19136701998620446)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19158720955620456)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(19157096164620456)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_api.id(19137922530620447)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19158983093620456)
,p_theme_id=>42
,p_name=>'ACCENT_10'
,p_display_name=>'Accent 10'
,p_display_sequence=>100
,p_region_template_id=>wwv_flow_api.id(19157096164620456)
,p_css_classes=>'t-Region--accent10'
,p_group_id=>wwv_flow_api.id(19137922530620447)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19159133352620457)
,p_theme_id=>42
,p_name=>'ACCENT_11'
,p_display_name=>'Accent 11'
,p_display_sequence=>110
,p_region_template_id=>wwv_flow_api.id(19157096164620456)
,p_css_classes=>'t-Region--accent11'
,p_group_id=>wwv_flow_api.id(19137922530620447)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19159369757620457)
,p_theme_id=>42
,p_name=>'ACCENT_12'
,p_display_name=>'Accent 12'
,p_display_sequence=>120
,p_region_template_id=>wwv_flow_api.id(19157096164620456)
,p_css_classes=>'t-Region--accent12'
,p_group_id=>wwv_flow_api.id(19137922530620447)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19159560508620457)
,p_theme_id=>42
,p_name=>'ACCENT_13'
,p_display_name=>'Accent 13'
,p_display_sequence=>130
,p_region_template_id=>wwv_flow_api.id(19157096164620456)
,p_css_classes=>'t-Region--accent13'
,p_group_id=>wwv_flow_api.id(19137922530620447)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19159733656620457)
,p_theme_id=>42
,p_name=>'ACCENT_14'
,p_display_name=>'Accent 14'
,p_display_sequence=>140
,p_region_template_id=>wwv_flow_api.id(19157096164620456)
,p_css_classes=>'t-Region--accent14'
,p_group_id=>wwv_flow_api.id(19137922530620447)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19159921228620457)
,p_theme_id=>42
,p_name=>'ACCENT_15'
,p_display_name=>'Accent 15'
,p_display_sequence=>150
,p_region_template_id=>wwv_flow_api.id(19157096164620456)
,p_css_classes=>'t-Region--accent15'
,p_group_id=>wwv_flow_api.id(19137922530620447)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19160125324620457)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(19157096164620456)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_api.id(19137922530620447)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19160310583620457)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(19157096164620456)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_api.id(19137922530620447)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19160549952620457)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(19157096164620456)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_api.id(19137922530620447)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19160718012620457)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(19157096164620456)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_api.id(19137922530620447)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19160940214620458)
,p_theme_id=>42
,p_name=>'ACCENT_6'
,p_display_name=>'Accent 6'
,p_display_sequence=>60
,p_region_template_id=>wwv_flow_api.id(19157096164620456)
,p_css_classes=>'t-Region--accent6'
,p_group_id=>wwv_flow_api.id(19137922530620447)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19161165362620458)
,p_theme_id=>42
,p_name=>'ACCENT_7'
,p_display_name=>'Accent 7'
,p_display_sequence=>70
,p_region_template_id=>wwv_flow_api.id(19157096164620456)
,p_css_classes=>'t-Region--accent7'
,p_group_id=>wwv_flow_api.id(19137922530620447)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19161394219620458)
,p_theme_id=>42
,p_name=>'ACCENT_8'
,p_display_name=>'Accent 8'
,p_display_sequence=>80
,p_region_template_id=>wwv_flow_api.id(19157096164620456)
,p_css_classes=>'t-Region--accent8'
,p_group_id=>wwv_flow_api.id(19137922530620447)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19161530645620458)
,p_theme_id=>42
,p_name=>'ACCENT_9'
,p_display_name=>'Accent 9'
,p_display_sequence=>90
,p_region_template_id=>wwv_flow_api.id(19157096164620456)
,p_css_classes=>'t-Region--accent9'
,p_group_id=>wwv_flow_api.id(19137922530620447)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19161749612620458)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(19157096164620456)
,p_css_classes=>'t-Region--removeHeader'
,p_group_id=>wwv_flow_api.id(19139144322620447)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19161900353620458)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(19157096164620456)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_api.id(19139545657620447)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19162115290620458)
,p_theme_id=>42
,p_name=>'HIDEREGIONHEADER'
,p_display_name=>'Hidden but accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(19157096164620456)
,p_css_classes=>'t-Region--hideHeader'
,p_group_id=>wwv_flow_api.id(19139144322620447)
,p_template_types=>'REGION'
,p_help_text=>'This option will hide the region header.  Note that the region title will still be audible for Screen Readers. Buttons placed in the region header will be hidden and inaccessible.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19162398073620458)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(19157096164620456)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19162553633620458)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(19157096164620456)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_api.id(19133714007620444)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19162793729620458)
,p_theme_id=>42
,p_name=>'REMOVE_UI_DECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(19157096164620456)
,p_css_classes=>'t-Region--noUI'
,p_group_id=>wwv_flow_api.id(19133714007620444)
,p_template_types=>'REGION'
,p_help_text=>'Removes UI decoration (borders, backgrounds, shadows, etc) from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19162985710620459)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll - Default'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(19157096164620456)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_api.id(19139545657620447)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19163157877620459)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(19157096164620456)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Region Header to maximize the region. Clicking this button will toggle the maximize state and stretch the region to fill the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19163372656620459)
,p_theme_id=>42
,p_name=>'SHOW_REGION_ICON'
,p_display_name=>'Show Region Icon'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(19157096164620456)
,p_css_classes=>'t-Region--showIcon'
,p_template_types=>'REGION'
,p_help_text=>'Displays the region icon in the region header beside the region title'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19163517201620459)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(19157096164620456)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_api.id(19133714007620444)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19163750485620459)
,p_theme_id=>42
,p_name=>'TEXT_CONTENT'
,p_display_name=>'Text Content'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(19157096164620456)
,p_css_classes=>'t-Region--textContent'
,p_group_id=>wwv_flow_api.id(19133714007620444)
,p_template_types=>'REGION'
,p_help_text=>'Useful for displaying primarily text-based content, such as FAQs and more.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19164932880620459)
,p_theme_id=>42
,p_name=>'FILL_TAB_LABELS'
,p_display_name=>'Fill Tab Labels'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(19163838539620459)
,p_css_classes=>'t-TabsRegion-mod--fillLabels'
,p_group_id=>wwv_flow_api.id(19164700024620459)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19165347596620460)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Pill'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(19163838539620459)
,p_css_classes=>'t-TabsRegion-mod--pill'
,p_group_id=>wwv_flow_api.id(19165113637620459)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19165550848620460)
,p_theme_id=>42
,p_name=>'REMEMBER_ACTIVE_TAB'
,p_display_name=>'Remember Active Tab'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(19163838539620459)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19165755338620460)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(19163838539620459)
,p_css_classes=>'t-TabsRegion-mod--simple'
,p_group_id=>wwv_flow_api.id(19165113637620459)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19166144266620460)
,p_theme_id=>42
,p_name=>'TABSLARGE'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(19163838539620459)
,p_css_classes=>'t-TabsRegion-mod--large'
,p_group_id=>wwv_flow_api.id(19165901245620460)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19166301651620460)
,p_theme_id=>42
,p_name=>'TABS_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(19163838539620459)
,p_css_classes=>'t-TabsRegion-mod--small'
,p_group_id=>wwv_flow_api.id(19165901245620460)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19166766076620460)
,p_theme_id=>42
,p_name=>'GET_TITLE_FROM_BREADCRUMB'
,p_display_name=>'Use Current Breadcrumb Entry'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(19166411098620460)
,p_css_classes=>'t-BreadcrumbRegion--useBreadcrumbTitle'
,p_group_id=>wwv_flow_api.id(19148141760620451)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19166990221620460)
,p_theme_id=>42
,p_name=>'HIDE_BREADCRUMB'
,p_display_name=>'Show Breadcrumbs'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(19166411098620460)
,p_css_classes=>'t-BreadcrumbRegion--showBreadcrumb'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19167102120620460)
,p_theme_id=>42
,p_name=>'REGION_HEADER_VISIBLE'
,p_display_name=>'Use Region Title'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(19166411098620460)
,p_css_classes=>'t-BreadcrumbRegion--useRegionTitle'
,p_group_id=>wwv_flow_api.id(19148141760620451)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19167301895620460)
,p_theme_id=>42
,p_name=>'USE_COMPACT_STYLE'
,p_display_name=>'Use Compact Style'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(19166411098620460)
,p_css_classes=>'t-BreadcrumbRegion--compactTitle'
,p_template_types=>'REGION'
,p_help_text=>'Uses a compact style for the breadcrumbs.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19168213682620461)
,p_theme_id=>42
,p_name=>'HIDESMALLSCREENS'
,p_display_name=>'Small Screens (Tablet)'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(19167489375620460)
,p_css_classes=>'t-Wizard--hideStepsSmall'
,p_group_id=>wwv_flow_api.id(19168003783620461)
,p_template_types=>'REGION'
,p_help_text=>'Hides the wizard progress steps for screens that are smaller than 768px wide.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19168448346620461)
,p_theme_id=>42
,p_name=>'HIDEXSMALLSCREENS'
,p_display_name=>'X Small Screens (Mobile)'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(19167489375620460)
,p_css_classes=>'t-Wizard--hideStepsXSmall'
,p_group_id=>wwv_flow_api.id(19168003783620461)
,p_template_types=>'REGION'
,p_help_text=>'Hides the wizard progress steps for screens that are smaller than 768px wide.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19168655999620461)
,p_theme_id=>42
,p_name=>'SHOW_TITLE'
,p_display_name=>'Show Title'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(19167489375620460)
,p_css_classes=>'t-Wizard--showTitle'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19169440098620463)
,p_theme_id=>42
,p_name=>'128PX'
,p_display_name=>'128px'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(19168911631620463)
,p_css_classes=>'t-BadgeList--xxlarge'
,p_group_id=>wwv_flow_api.id(19169207686620463)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19169876288620463)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(19168911631620463)
,p_css_classes=>'t-BadgeList--cols'
,p_group_id=>wwv_flow_api.id(19169609697620463)
,p_template_types=>'REPORT'
,p_help_text=>'Arrange badges in a two column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19170046736620464)
,p_theme_id=>42
,p_name=>'32PX'
,p_display_name=>'32px'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(19168911631620463)
,p_css_classes=>'t-BadgeList--small'
,p_group_id=>wwv_flow_api.id(19169207686620463)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19170239526620464)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(19168911631620463)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--3cols'
,p_group_id=>wwv_flow_api.id(19169609697620463)
,p_template_types=>'REPORT'
,p_help_text=>'Arrange badges in a 3 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19170406985620464)
,p_theme_id=>42
,p_name=>'48PX'
,p_display_name=>'48px'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(19168911631620463)
,p_css_classes=>'t-BadgeList--medium'
,p_group_id=>wwv_flow_api.id(19169207686620463)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19170650693620464)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(19168911631620463)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--4cols'
,p_group_id=>wwv_flow_api.id(19169609697620463)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19170810552620464)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(19168911631620463)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--5cols'
,p_group_id=>wwv_flow_api.id(19169609697620463)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19171063163620464)
,p_theme_id=>42
,p_name=>'64PX'
,p_display_name=>'64px'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(19168911631620463)
,p_css_classes=>'t-BadgeList--large'
,p_group_id=>wwv_flow_api.id(19169207686620463)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19171228670620464)
,p_theme_id=>42
,p_name=>'96PX'
,p_display_name=>'96px'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(19168911631620463)
,p_css_classes=>'t-BadgeList--xlarge'
,p_group_id=>wwv_flow_api.id(19169207686620463)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19171424285620464)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(19168911631620463)
,p_css_classes=>'u-colors'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19171816313620464)
,p_theme_id=>42
,p_name=>'CIRCULAR'
,p_display_name=>'Circular'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(19168911631620463)
,p_css_classes=>'t-BadgeList--circular'
,p_group_id=>wwv_flow_api.id(19171672087620464)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19172009777620464)
,p_theme_id=>42
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(19168911631620463)
,p_css_classes=>'t-BadgeList--fixed'
,p_group_id=>wwv_flow_api.id(19169609697620463)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19172227141620465)
,p_theme_id=>42
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>80
,p_report_template_id=>wwv_flow_api.id(19168911631620463)
,p_css_classes=>'t-BadgeList--flex'
,p_group_id=>wwv_flow_api.id(19169609697620463)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19172439500620465)
,p_theme_id=>42
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>70
,p_report_template_id=>wwv_flow_api.id(19168911631620463)
,p_css_classes=>'t-BadgeList--float'
,p_group_id=>wwv_flow_api.id(19169609697620463)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19172660009620465)
,p_theme_id=>42
,p_name=>'GRID'
,p_display_name=>'Grid'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(19168911631620463)
,p_css_classes=>'t-BadgeList--dash'
,p_group_id=>wwv_flow_api.id(19171672087620464)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19172847501620465)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(19168911631620463)
,p_css_classes=>'t-BadgeList--stacked'
,p_group_id=>wwv_flow_api.id(19169609697620463)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19173479118620465)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(19172979369620465)
,p_css_classes=>'t-Comments--basic'
,p_group_id=>wwv_flow_api.id(19173264407620465)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19173853987620466)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(19172979369620465)
,p_css_classes=>'t-Comments--iconsRounded'
,p_group_id=>wwv_flow_api.id(19173600047620465)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19174031658620466)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(19172979369620465)
,p_css_classes=>'t-Comments--iconsSquare'
,p_group_id=>wwv_flow_api.id(19173600047620465)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19174293874620466)
,p_theme_id=>42
,p_name=>'SPEECH_BUBBLES'
,p_display_name=>'Speech Bubbles'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(19172979369620465)
,p_css_classes=>'t-Comments--chat'
,p_group_id=>wwv_flow_api.id(19173264407620465)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19174609807620467)
,p_theme_id=>42
,p_name=>'2_COLUMN_GRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(19174322939620466)
,p_css_classes=>'t-MediaList--cols t-MediaList--2cols'
,p_group_id=>wwv_flow_api.id(19169609697620463)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19174829404620467)
,p_theme_id=>42
,p_name=>'3_COLUMN_GRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(19174322939620466)
,p_css_classes=>'t-MediaList--cols t-MediaList--3cols'
,p_group_id=>wwv_flow_api.id(19169609697620463)
,p_template_types=>'REPORT'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19175051773620467)
,p_theme_id=>42
,p_name=>'4_COLUMN_GRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(19174322939620466)
,p_css_classes=>'t-MediaList--cols t-MediaList--4cols'
,p_group_id=>wwv_flow_api.id(19169609697620463)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19175271314620467)
,p_theme_id=>42
,p_name=>'5_COLUMN_GRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(19174322939620466)
,p_css_classes=>'t-MediaList--cols t-MediaList--5cols'
,p_group_id=>wwv_flow_api.id(19169609697620463)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19175441981620467)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(19174322939620466)
,p_css_classes=>'u-colors'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19175689571620467)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(19174322939620466)
,p_css_classes=>'t-MediaList--iconsRounded'
,p_group_id=>wwv_flow_api.id(19173600047620465)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19175831715620467)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(19174322939620466)
,p_css_classes=>'t-MediaList--iconsSquare'
,p_group_id=>wwv_flow_api.id(19173600047620465)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19176205618620467)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(19174322939620466)
,p_css_classes=>'t-MediaList--large force-fa-lg'
,p_group_id=>wwv_flow_api.id(19176031161620467)
,p_template_types=>'REPORT'
,p_help_text=>'Increases the size of the text and icons in the list.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19176434136620467)
,p_theme_id=>42
,p_name=>'SHOW_BADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(19174322939620466)
,p_css_classes=>'t-MediaList--showBadges'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19176631046620468)
,p_theme_id=>42
,p_name=>'SHOW_DESCRIPTION'
,p_display_name=>'Show Description'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(19174322939620466)
,p_css_classes=>'t-MediaList--showDesc'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19176825059620468)
,p_theme_id=>42
,p_name=>'SHOW_ICONS'
,p_display_name=>'Show Icons'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(19174322939620466)
,p_css_classes=>'t-MediaList--showIcons'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19177056115620468)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTAL'
,p_display_name=>'Span Horizontal'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(19174322939620466)
,p_css_classes=>'t-MediaList--horizontal'
,p_group_id=>wwv_flow_api.id(19169609697620463)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19177201294620468)
,p_theme_id=>42
,p_name=>'STACK'
,p_display_name=>'Stack'
,p_display_sequence=>5
,p_report_template_id=>wwv_flow_api.id(19174322939620466)
,p_css_classes=>'t-MediaList--stack'
,p_group_id=>wwv_flow_api.id(19169609697620463)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19177817466620469)
,p_theme_id=>42
,p_name=>'ALTROWCOLORSDISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(19177373070620468)
,p_css_classes=>'t-Report--staticRowColors'
,p_group_id=>wwv_flow_api.id(19177604188620468)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19178011151620469)
,p_theme_id=>42
,p_name=>'ALTROWCOLORSENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(19177373070620468)
,p_css_classes=>'t-Report--altRowsDefault'
,p_group_id=>wwv_flow_api.id(19177604188620468)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19178457937620469)
,p_theme_id=>42
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(19177373070620468)
,p_css_classes=>'t-Report--rowHighlight'
,p_group_id=>wwv_flow_api.id(19178206633620469)
,p_template_types=>'REPORT'
,p_help_text=>'Enable row highlighting on mouse over'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19178888929620469)
,p_theme_id=>42
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Only'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(19177373070620468)
,p_css_classes=>'t-Report--horizontalBorders'
,p_group_id=>wwv_flow_api.id(19178620489620469)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19179064281620469)
,p_theme_id=>42
,p_name=>'REMOVEALLBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(19177373070620468)
,p_css_classes=>'t-Report--noBorders'
,p_group_id=>wwv_flow_api.id(19178620489620469)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19179220682620469)
,p_theme_id=>42
,p_name=>'REMOVEOUTERBORDERS'
,p_display_name=>'No Outer Borders'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(19177373070620468)
,p_css_classes=>'t-Report--inline'
,p_group_id=>wwv_flow_api.id(19178620489620469)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19179415866620469)
,p_theme_id=>42
,p_name=>'ROWHIGHLIGHTDISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(19177373070620468)
,p_css_classes=>'t-Report--rowHighlightOff'
,p_group_id=>wwv_flow_api.id(19178206633620469)
,p_template_types=>'REPORT'
,p_help_text=>'Disable row highlighting on mouse over'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19179694913620469)
,p_theme_id=>42
,p_name=>'STRETCHREPORT'
,p_display_name=>'Stretch Report'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(19177373070620468)
,p_css_classes=>'t-Report--stretch'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19179856900620469)
,p_theme_id=>42
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Only'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(19177373070620468)
,p_css_classes=>'t-Report--verticalBorders'
,p_group_id=>wwv_flow_api.id(19178620489620469)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19180472539620470)
,p_theme_id=>42
,p_name=>'FIXED_LARGE'
,p_display_name=>'Fixed - Large'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(19179953888620469)
,p_css_classes=>'t-AVPList--fixedLabelLarge'
,p_group_id=>wwv_flow_api.id(19180220539620470)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19180618809620470)
,p_theme_id=>42
,p_name=>'FIXED_MEDIUM'
,p_display_name=>'Fixed - Medium'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(19179953888620469)
,p_css_classes=>'t-AVPList--fixedLabelMedium'
,p_group_id=>wwv_flow_api.id(19180220539620470)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19180890880620470)
,p_theme_id=>42
,p_name=>'FIXED_SMALL'
,p_display_name=>'Fixed - Small'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(19179953888620469)
,p_css_classes=>'t-AVPList--fixedLabelSmall'
,p_group_id=>wwv_flow_api.id(19180220539620470)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19181065030620470)
,p_theme_id=>42
,p_name=>'LEFT_ALIGNED_DETAILS'
,p_display_name=>'Left Aligned Details'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(19179953888620469)
,p_css_classes=>'t-AVPList--leftAligned'
,p_group_id=>wwv_flow_api.id(19169609697620463)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19181214950620470)
,p_theme_id=>42
,p_name=>'RIGHT_ALIGNED_DETAILS'
,p_display_name=>'Right Aligned Details'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(19179953888620469)
,p_css_classes=>'t-AVPList--rightAligned'
,p_group_id=>wwv_flow_api.id(19169609697620463)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19181480494620470)
,p_theme_id=>42
,p_name=>'VARIABLE_LARGE'
,p_display_name=>'Variable - Large'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(19179953888620469)
,p_css_classes=>'t-AVPList--variableLabelLarge'
,p_group_id=>wwv_flow_api.id(19180220539620470)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19181694564620470)
,p_theme_id=>42
,p_name=>'VARIABLE_MEDIUM'
,p_display_name=>'Variable - Medium'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(19179953888620469)
,p_css_classes=>'t-AVPList--variableLabelMedium'
,p_group_id=>wwv_flow_api.id(19180220539620470)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19181847132620470)
,p_theme_id=>42
,p_name=>'VARIABLE_SMALL'
,p_display_name=>'Variable - Small'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(19179953888620469)
,p_css_classes=>'t-AVPList--variableLabelSmall'
,p_group_id=>wwv_flow_api.id(19180220539620470)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19182216468620471)
,p_theme_id=>42
,p_name=>'FIXED_LARGE'
,p_display_name=>'Fixed - Large'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(19181987399620470)
,p_css_classes=>'t-AVPList--fixedLabelLarge'
,p_group_id=>wwv_flow_api.id(19180220539620470)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19182480429620471)
,p_theme_id=>42
,p_name=>'FIXED_MEDIUM'
,p_display_name=>'Fixed - Medium'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(19181987399620470)
,p_css_classes=>'t-AVPList--fixedLabelMedium'
,p_group_id=>wwv_flow_api.id(19180220539620470)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19182683963620471)
,p_theme_id=>42
,p_name=>'FIXED_SMALL'
,p_display_name=>'Fixed - Small'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(19181987399620470)
,p_css_classes=>'t-AVPList--fixedLabelSmall'
,p_group_id=>wwv_flow_api.id(19180220539620470)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19182896941620471)
,p_theme_id=>42
,p_name=>'LEFT_ALIGNED_DETAILS'
,p_display_name=>'Left Aligned Details'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(19181987399620470)
,p_css_classes=>'t-AVPList--leftAligned'
,p_group_id=>wwv_flow_api.id(19169609697620463)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19183089451620471)
,p_theme_id=>42
,p_name=>'RIGHT_ALIGNED_DETAILS'
,p_display_name=>'Right Aligned Details'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(19181987399620470)
,p_css_classes=>'t-AVPList--rightAligned'
,p_group_id=>wwv_flow_api.id(19169609697620463)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19183255577620471)
,p_theme_id=>42
,p_name=>'VARIABLE_LARGE'
,p_display_name=>'Variable - Large'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(19181987399620470)
,p_css_classes=>'t-AVPList--variableLabelLarge'
,p_group_id=>wwv_flow_api.id(19180220539620470)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19183423987620471)
,p_theme_id=>42
,p_name=>'VARIABLE_MEDIUM'
,p_display_name=>'Variable - Medium'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(19181987399620470)
,p_css_classes=>'t-AVPList--variableLabelMedium'
,p_group_id=>wwv_flow_api.id(19180220539620470)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19183672438620471)
,p_theme_id=>42
,p_name=>'VARIABLE_SMALL'
,p_display_name=>'Variable - Small'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(19181987399620470)
,p_css_classes=>'t-AVPList--variableLabelSmall'
,p_group_id=>wwv_flow_api.id(19180220539620470)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19184032432620472)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(19183700977620471)
,p_css_classes=>'t-Timeline--compact'
,p_group_id=>wwv_flow_api.id(19171672087620464)
,p_template_types=>'REPORT'
,p_help_text=>'Displays a compact version of timeline with smaller text and fewer columns.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19184424827620472)
,p_theme_id=>42
,p_name=>'2_COLUMNS'
,p_display_name=>'2 Columns'
,p_display_sequence=>15
,p_report_template_id=>wwv_flow_api.id(19184166399620472)
,p_css_classes=>'t-Cards--cols'
,p_group_id=>wwv_flow_api.id(19169609697620463)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19184876851620472)
,p_theme_id=>42
,p_name=>'2_LINES'
,p_display_name=>'2 Lines'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(19184166399620472)
,p_css_classes=>'t-Cards--desc-2ln'
,p_group_id=>wwv_flow_api.id(19184614120620472)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19185088388620472)
,p_theme_id=>42
,p_name=>'3_COLUMNS'
,p_display_name=>'3 Columns'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(19184166399620472)
,p_css_classes=>'t-Cards--3cols'
,p_group_id=>wwv_flow_api.id(19169609697620463)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19185206580620472)
,p_theme_id=>42
,p_name=>'3_LINES'
,p_display_name=>'3 Lines'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(19184166399620472)
,p_css_classes=>'t-Cards--desc-3ln'
,p_group_id=>wwv_flow_api.id(19184614120620472)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19185446670620472)
,p_theme_id=>42
,p_name=>'4_COLUMNS'
,p_display_name=>'4 Columns'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(19184166399620472)
,p_css_classes=>'t-Cards--4cols'
,p_group_id=>wwv_flow_api.id(19169609697620463)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19185659218620473)
,p_theme_id=>42
,p_name=>'4_LINES'
,p_display_name=>'4 Lines'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(19184166399620472)
,p_css_classes=>'t-Cards--desc-4ln'
,p_group_id=>wwv_flow_api.id(19184614120620472)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19185840079620473)
,p_theme_id=>42
,p_name=>'5_COLUMNS'
,p_display_name=>'5 Columns'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(19184166399620472)
,p_css_classes=>'t-Cards--5cols'
,p_group_id=>wwv_flow_api.id(19169609697620463)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19186033353620473)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(19184166399620472)
,p_css_classes=>'t-Cards--basic'
,p_group_id=>wwv_flow_api.id(19171672087620464)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19186246797620473)
,p_theme_id=>42
,p_name=>'BLOCK'
,p_display_name=>'Block'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(19184166399620472)
,p_css_classes=>'t-Cards--featured t-Cards--block force-fa-lg'
,p_group_id=>wwv_flow_api.id(19171672087620464)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19186622674620473)
,p_theme_id=>42
,p_name=>'CARDS_COLOR_FILL'
,p_display_name=>'Color Fill'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(19184166399620472)
,p_css_classes=>'t-Cards--animColorFill'
,p_group_id=>wwv_flow_api.id(19186436028620473)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19186887636620473)
,p_theme_id=>42
,p_name=>'CARD_RAISE_CARD'
,p_display_name=>'Raise Card'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(19184166399620472)
,p_css_classes=>'t-Cards--animRaiseCard'
,p_group_id=>wwv_flow_api.id(19186436028620473)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19187003244620473)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(19184166399620472)
,p_css_classes=>'t-Cards--compact'
,p_group_id=>wwv_flow_api.id(19171672087620464)
,p_template_types=>'REPORT'
,p_help_text=>'Use this option when you want to show smaller cards.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19187425670620473)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(19184166399620472)
,p_css_classes=>'t-Cards--displayIcons'
,p_group_id=>wwv_flow_api.id(19187296570620473)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19187603981620473)
,p_theme_id=>42
,p_name=>'DISPLAY_INITIALS'
,p_display_name=>'Display Initials'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(19184166399620472)
,p_css_classes=>'t-Cards--displayInitials'
,p_group_id=>wwv_flow_api.id(19187296570620473)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19187838468620473)
,p_theme_id=>42
,p_name=>'DISPLAY_SUBTITLE'
,p_display_name=>'Display Subtitle'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(19184166399620472)
,p_css_classes=>'t-Cards--displaySubtitle'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19188037654620474)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(19184166399620472)
,p_css_classes=>'t-Cards--featured force-fa-lg'
,p_group_id=>wwv_flow_api.id(19171672087620464)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19188209047620474)
,p_theme_id=>42
,p_name=>'FLOAT'
,p_display_name=>'Float'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(19184166399620472)
,p_css_classes=>'t-Cards--float'
,p_group_id=>wwv_flow_api.id(19169609697620463)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19188410894620474)
,p_theme_id=>42
,p_name=>'HIDDEN_BODY_TEXT'
,p_display_name=>'Hidden'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(19184166399620472)
,p_css_classes=>'t-Cards--hideBody'
,p_group_id=>wwv_flow_api.id(19184614120620472)
,p_template_types=>'REPORT'
,p_help_text=>'This option hides the card body which contains description and subtext.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19188695508620474)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(19184166399620472)
,p_css_classes=>'t-Cards--iconsRounded'
,p_group_id=>wwv_flow_api.id(19173600047620465)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19188853960620474)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(19184166399620472)
,p_css_classes=>'t-Cards--iconsSquare'
,p_group_id=>wwv_flow_api.id(19173600047620465)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19189071866620474)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>70
,p_report_template_id=>wwv_flow_api.id(19184166399620472)
,p_css_classes=>'t-Cards--spanHorizontally'
,p_group_id=>wwv_flow_api.id(19169609697620463)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19189234876620474)
,p_theme_id=>42
,p_name=>'USE_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(19184166399620472)
,p_css_classes=>'u-colors'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19190082717620479)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(19189554049620475)
,p_css_classes=>'t-BadgeList--cols'
,p_group_id=>wwv_flow_api.id(19189852048620479)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a two column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19190285792620480)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(19189554049620475)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--3cols'
,p_group_id=>wwv_flow_api.id(19189852048620479)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a 3 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19190408702620480)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(19189554049620475)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--4cols'
,p_group_id=>wwv_flow_api.id(19189852048620479)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in 4 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19190668410620480)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(19189554049620475)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--5cols'
,p_group_id=>wwv_flow_api.id(19189852048620479)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a 5 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19190883672620480)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(19189554049620475)
,p_css_classes=>'u-colors'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19191228821620480)
,p_theme_id=>42
,p_name=>'CIRCULAR'
,p_display_name=>'Circular'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(19189554049620475)
,p_css_classes=>'t-BadgeList--circular'
,p_group_id=>wwv_flow_api.id(19191035724620480)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19191414379620480)
,p_theme_id=>42
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_api.id(19189554049620475)
,p_css_classes=>'t-BadgeList--fixed'
,p_group_id=>wwv_flow_api.id(19189852048620479)
,p_template_types=>'LIST'
,p_help_text=>'Span badges horizontally'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19191674548620480)
,p_theme_id=>42
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>80
,p_list_template_id=>wwv_flow_api.id(19189554049620475)
,p_css_classes=>'t-BadgeList--flex'
,p_group_id=>wwv_flow_api.id(19189852048620479)
,p_template_types=>'LIST'
,p_help_text=>'Use flexbox to arrange items'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19191834917620480)
,p_theme_id=>42
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>70
,p_list_template_id=>wwv_flow_api.id(19189554049620475)
,p_css_classes=>'t-BadgeList--float'
,p_group_id=>wwv_flow_api.id(19189852048620479)
,p_template_types=>'LIST'
,p_help_text=>'Float badges to left'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19192080749620481)
,p_theme_id=>42
,p_name=>'GRID'
,p_display_name=>'Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(19189554049620475)
,p_css_classes=>'t-BadgeList--dash'
,p_group_id=>wwv_flow_api.id(19191035724620480)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19192483451620481)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'64px'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(19189554049620475)
,p_css_classes=>'t-BadgeList--large'
,p_group_id=>wwv_flow_api.id(19192228273620481)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19192631464620481)
,p_theme_id=>42
,p_name=>'MEDIUM'
,p_display_name=>'48px'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(19189554049620475)
,p_css_classes=>'t-BadgeList--medium'
,p_group_id=>wwv_flow_api.id(19192228273620481)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19192842228620481)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'32px'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(19189554049620475)
,p_css_classes=>'t-BadgeList--small'
,p_group_id=>wwv_flow_api.id(19192228273620481)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19193050138620481)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(19189554049620475)
,p_css_classes=>'t-BadgeList--stacked'
,p_group_id=>wwv_flow_api.id(19189852048620479)
,p_template_types=>'LIST'
,p_help_text=>'Stack badges on top of each other'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19193271645620481)
,p_theme_id=>42
,p_name=>'XLARGE'
,p_display_name=>'96px'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(19189554049620475)
,p_css_classes=>'t-BadgeList--xlarge'
,p_group_id=>wwv_flow_api.id(19192228273620481)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19193424803620481)
,p_theme_id=>42
,p_name=>'XXLARGE'
,p_display_name=>'128px'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(19189554049620475)
,p_css_classes=>'t-BadgeList--xxlarge'
,p_group_id=>wwv_flow_api.id(19192228273620481)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19193899256620481)
,p_theme_id=>42
,p_name=>'2_COLUMNS'
,p_display_name=>'2 Columns'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(19193581854620481)
,p_css_classes=>'t-Cards--cols'
,p_group_id=>wwv_flow_api.id(19189852048620479)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19194263086620482)
,p_theme_id=>42
,p_name=>'2_LINES'
,p_display_name=>'2 Lines'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(19193581854620481)
,p_css_classes=>'t-Cards--desc-2ln'
,p_group_id=>wwv_flow_api.id(19194083133620481)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19194468023620482)
,p_theme_id=>42
,p_name=>'3_COLUMNS'
,p_display_name=>'3 Columns'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(19193581854620481)
,p_css_classes=>'t-Cards--3cols'
,p_group_id=>wwv_flow_api.id(19189852048620479)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19194608522620482)
,p_theme_id=>42
,p_name=>'3_LINES'
,p_display_name=>'3 Lines'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(19193581854620481)
,p_css_classes=>'t-Cards--desc-3ln'
,p_group_id=>wwv_flow_api.id(19194083133620481)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19194845261620482)
,p_theme_id=>42
,p_name=>'4_COLUMNS'
,p_display_name=>'4 Columns'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(19193581854620481)
,p_css_classes=>'t-Cards--4cols'
,p_group_id=>wwv_flow_api.id(19189852048620479)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19195076546620482)
,p_theme_id=>42
,p_name=>'4_LINES'
,p_display_name=>'4 Lines'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(19193581854620481)
,p_css_classes=>'t-Cards--desc-4ln'
,p_group_id=>wwv_flow_api.id(19194083133620481)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19195205365620482)
,p_theme_id=>42
,p_name=>'5_COLUMNS'
,p_display_name=>'5 Columns'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(19193581854620481)
,p_css_classes=>'t-Cards--5cols'
,p_group_id=>wwv_flow_api.id(19189852048620479)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19195442689620482)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(19193581854620481)
,p_css_classes=>'t-Cards--basic'
,p_group_id=>wwv_flow_api.id(19191035724620480)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19195625355620482)
,p_theme_id=>42
,p_name=>'BLOCK'
,p_display_name=>'Block'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(19193581854620481)
,p_css_classes=>'t-Cards--featured t-Cards--block force-fa-lg'
,p_group_id=>wwv_flow_api.id(19191035724620480)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19195896667620482)
,p_theme_id=>42
,p_name=>'CARDS_STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>5
,p_list_template_id=>wwv_flow_api.id(19193581854620481)
,p_css_classes=>'t-Cards--stacked'
,p_group_id=>wwv_flow_api.id(19189852048620479)
,p_template_types=>'LIST'
,p_help_text=>'Stacks the cards on top of each other.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19196267975620482)
,p_theme_id=>42
,p_name=>'COLOR_FILL'
,p_display_name=>'Color Fill'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(19193581854620481)
,p_css_classes=>'t-Cards--animColorFill'
,p_group_id=>wwv_flow_api.id(19196043137620482)
,p_template_types=>'LIST'
,p_help_text=>'Fills the card background with the color of the icon or default link style.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19196490908620482)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(19193581854620481)
,p_css_classes=>'t-Cards--compact'
,p_group_id=>wwv_flow_api.id(19191035724620480)
,p_template_types=>'LIST'
,p_help_text=>'Use this option when you want to show smaller cards.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19196863527620483)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(19193581854620481)
,p_css_classes=>'t-Cards--displayIcons'
,p_group_id=>wwv_flow_api.id(19196606876620483)
,p_template_types=>'LIST'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19197070601620483)
,p_theme_id=>42
,p_name=>'DISPLAY_INITIALS'
,p_display_name=>'Display Initials'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(19193581854620481)
,p_css_classes=>'t-Cards--displayInitials'
,p_group_id=>wwv_flow_api.id(19196606876620483)
,p_template_types=>'LIST'
,p_help_text=>'Initials come from List Attribute 3'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19197268980620483)
,p_theme_id=>42
,p_name=>'DISPLAY_SUBTITLE'
,p_display_name=>'Display Subtitle'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(19193581854620481)
,p_css_classes=>'t-Cards--displaySubtitle'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19197423061620483)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(19193581854620481)
,p_css_classes=>'t-Cards--featured force-fa-lg'
,p_group_id=>wwv_flow_api.id(19191035724620480)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19197635788620483)
,p_theme_id=>42
,p_name=>'FLOAT'
,p_display_name=>'Float'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_api.id(19193581854620481)
,p_css_classes=>'t-Cards--float'
,p_group_id=>wwv_flow_api.id(19189852048620479)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19197872379620483)
,p_theme_id=>42
,p_name=>'HIDDEN_BODY_TEXT'
,p_display_name=>'Hidden'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(19193581854620481)
,p_css_classes=>'t-Cards--hideBody'
,p_group_id=>wwv_flow_api.id(19194083133620481)
,p_template_types=>'LIST'
,p_help_text=>'This option hides the card body which contains description and subtext.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19198201589620483)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(19193581854620481)
,p_css_classes=>'t-Cards--iconsRounded'
,p_group_id=>wwv_flow_api.id(19198073098620483)
,p_template_types=>'LIST'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19198486855620483)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(19193581854620481)
,p_css_classes=>'t-Cards--iconsSquare'
,p_group_id=>wwv_flow_api.id(19198073098620483)
,p_template_types=>'LIST'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19198603924620483)
,p_theme_id=>42
,p_name=>'RAISE_CARD'
,p_display_name=>'Raise Card'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(19193581854620481)
,p_css_classes=>'t-Cards--animRaiseCard'
,p_group_id=>wwv_flow_api.id(19196043137620482)
,p_template_types=>'LIST'
,p_help_text=>'Raises the card so it pops up.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19198806312620483)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>70
,p_list_template_id=>wwv_flow_api.id(19193581854620481)
,p_css_classes=>'t-Cards--spanHorizontally'
,p_group_id=>wwv_flow_api.id(19189852048620479)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19199082748620484)
,p_theme_id=>42
,p_name=>'USE_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(19193581854620481)
,p_css_classes=>'u-colors'
,p_template_types=>'LIST'
,p_help_text=>'Applies the colors from the theme''s color palette to the icons or initials within cards.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19199425214620484)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(19199145658620484)
,p_css_classes=>'t-MediaList--cols t-MediaList--2cols'
,p_group_id=>wwv_flow_api.id(19189852048620479)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19199611468620484)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(19199145658620484)
,p_css_classes=>'t-MediaList--cols t-MediaList--3cols'
,p_group_id=>wwv_flow_api.id(19189852048620479)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19199845348620484)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(19199145658620484)
,p_css_classes=>'t-MediaList--cols t-MediaList--4cols'
,p_group_id=>wwv_flow_api.id(19189852048620479)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19200061994620484)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(19199145658620484)
,p_css_classes=>'t-MediaList--cols t-MediaList--5cols'
,p_group_id=>wwv_flow_api.id(19189852048620479)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19200209680620484)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(19199145658620484)
,p_css_classes=>'u-colors'
,p_template_types=>'LIST'
,p_help_text=>'Applies colors from the Theme''s color palette to icons in the list.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19200429429620484)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(19199145658620484)
,p_css_classes=>'t-MediaList--iconsRounded'
,p_group_id=>wwv_flow_api.id(19198073098620483)
,p_template_types=>'LIST'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19200654802620484)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(19199145658620484)
,p_css_classes=>'t-MediaList--iconsSquare'
,p_group_id=>wwv_flow_api.id(19198073098620483)
,p_template_types=>'LIST'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19201023177620484)
,p_theme_id=>42
,p_name=>'LIST_SIZE_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(19199145658620484)
,p_css_classes=>'t-MediaList--large force-fa-lg'
,p_group_id=>wwv_flow_api.id(19200828119620484)
,p_template_types=>'LIST'
,p_help_text=>'Increases the size of the text and icons in the list.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19201276530620485)
,p_theme_id=>42
,p_name=>'SHOW_BADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(19199145658620484)
,p_css_classes=>'t-MediaList--showBadges'
,p_template_types=>'LIST'
,p_help_text=>'Show a badge (Attribute 2) to the right of the list item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19201413309620485)
,p_theme_id=>42
,p_name=>'SHOW_DESCRIPTION'
,p_display_name=>'Show Description'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(19199145658620484)
,p_css_classes=>'t-MediaList--showDesc'
,p_template_types=>'LIST'
,p_help_text=>'Shows the description (Attribute 1) for each list item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19201618573620485)
,p_theme_id=>42
,p_name=>'SHOW_ICONS'
,p_display_name=>'Show Icons'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(19199145658620484)
,p_css_classes=>'t-MediaList--showIcons'
,p_template_types=>'LIST'
,p_help_text=>'Display an icon next to the list item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19201846176620485)
,p_theme_id=>42
,p_name=>'SPANHORIZONTAL'
,p_display_name=>'Span Horizontal'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(19199145658620484)
,p_css_classes=>'t-MediaList--horizontal'
,p_group_id=>wwv_flow_api.id(19189852048620479)
,p_template_types=>'LIST'
,p_help_text=>'Show all list items in one horizontal row.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19202415474620486)
,p_theme_id=>42
,p_name=>'COLLAPSED_DEFAULT'
,p_display_name=>'Collapsed by Default'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(19202181926620485)
,p_css_classes=>'js-defaultCollapsed'
,p_template_types=>'LIST'
,p_help_text=>'This option will load the side navigation menu in a collapsed state by default.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19202681082620486)
,p_theme_id=>42
,p_name=>'STYLE_A'
,p_display_name=>'Style A'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(19202181926620485)
,p_css_classes=>'t-TreeNav--styleA'
,p_group_id=>wwv_flow_api.id(19191035724620480)
,p_template_types=>'LIST'
,p_help_text=>'Style Variation A'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19202835448620486)
,p_theme_id=>42
,p_name=>'STYLE_B'
,p_display_name=>'Style B'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(19202181926620485)
,p_css_classes=>'t-TreeNav--styleB'
,p_group_id=>wwv_flow_api.id(19191035724620480)
,p_template_types=>'LIST'
,p_help_text=>'Style Variation B'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19203042811620486)
,p_theme_id=>42
,p_name=>'STYLE_C'
,p_display_name=>'Classic'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(19202181926620485)
,p_css_classes=>'t-TreeNav--classic'
,p_group_id=>wwv_flow_api.id(19191035724620480)
,p_template_types=>'LIST'
,p_help_text=>'Classic Style'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19203458986620487)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(19203162589620486)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19203634131620487)
,p_theme_id=>42
,p_name=>'BEHAVE_LIKE_TABS'
,p_display_name=>'Behave Like Tabs'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(19203162589620486)
,p_css_classes=>'js-tabLike'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19203832431620487)
,p_theme_id=>42
,p_name=>'ENABLE_SLIDE_ANIMATION'
,p_display_name=>'Enable Slide Animation'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(19203162589620486)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19204082009620487)
,p_theme_id=>42
,p_name=>'SHOW_SUB_MENU_ICONS'
,p_display_name=>'Show Sub Menu Icons'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(19203162589620486)
,p_css_classes=>'js-showSubMenuIcons'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19204407131620487)
,p_theme_id=>42
,p_name=>'ACTIONS'
,p_display_name=>'Actions'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(19204179606620487)
,p_css_classes=>'t-LinksList--actions'
,p_group_id=>wwv_flow_api.id(19191035724620480)
,p_template_types=>'LIST'
,p_help_text=>'Render as actions to be placed on the right side column.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19204610309620487)
,p_theme_id=>42
,p_name=>'DISABLETEXTWRAPPING'
,p_display_name=>'Disable Text Wrapping'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(19204179606620487)
,p_css_classes=>'t-LinksList--nowrap'
,p_template_types=>'LIST'
,p_help_text=>'Do not allow link text to wrap to new lines. Truncate with ellipsis.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19204874146620487)
,p_theme_id=>42
,p_name=>'SHOWBADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(19204179606620487)
,p_css_classes=>'t-LinksList--showBadge'
,p_template_types=>'LIST'
,p_help_text=>'Show badge to right of link (requires Attribute 1 to be populated)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19205013224620487)
,p_theme_id=>42
,p_name=>'SHOWGOTOARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(19204179606620487)
,p_css_classes=>'t-LinksList--showArrow'
,p_template_types=>'LIST'
,p_help_text=>'Show arrow to the right of link'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19205413688620488)
,p_theme_id=>42
,p_name=>'SHOWICONS'
,p_display_name=>'For All Items'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(19204179606620487)
,p_css_classes=>'t-LinksList--showIcons'
,p_group_id=>wwv_flow_api.id(19205267862620488)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19205671575620488)
,p_theme_id=>42
,p_name=>'SHOWTOPICONS'
,p_display_name=>'For Top Level Items Only'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(19204179606620487)
,p_css_classes=>'t-LinksList--showTopIcons'
,p_group_id=>wwv_flow_api.id(19205267862620488)
,p_template_types=>'LIST'
,p_help_text=>'This will show icons for top level items of the list only. It will not show icons for sub lists.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19206016623620488)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(19205782590620488)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19206226056620488)
,p_theme_id=>42
,p_name=>'BEHAVE_LIKE_TABS'
,p_display_name=>'Behave Like Tabs'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(19205782590620488)
,p_css_classes=>'js-tabLike'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19206422826620488)
,p_theme_id=>42
,p_name=>'ENABLE_SLIDE_ANIMATION'
,p_display_name=>'Enable Slide Animation'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(19205782590620488)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19206634333620488)
,p_theme_id=>42
,p_name=>'SHOW_SUB_MENU_ICONS'
,p_display_name=>'Show Sub Menu Icons'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(19205782590620488)
,p_css_classes=>'js-showSubMenuIcons'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19207261321620488)
,p_theme_id=>42
,p_name=>'DISPLAY_LABELS_SM'
,p_display_name=>'Display labels'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(19206767867620488)
,p_css_classes=>'t-NavTabs--displayLabels-sm'
,p_group_id=>wwv_flow_api.id(19207028234620488)
,p_template_types=>'LIST'
,p_help_text=>'Displays the label for the list items below the icon'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19207420946620489)
,p_theme_id=>42
,p_name=>'HIDE_LABELS_SM'
,p_display_name=>'Do not display labels'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(19206767867620488)
,p_css_classes=>'t-NavTabs--hiddenLabels-sm'
,p_group_id=>wwv_flow_api.id(19207028234620488)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19207810369620489)
,p_theme_id=>42
,p_name=>'LABEL_ABOVE_LG'
,p_display_name=>'Display labels above'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(19206767867620488)
,p_css_classes=>'t-NavTabs--stacked'
,p_group_id=>wwv_flow_api.id(19207635399620489)
,p_template_types=>'LIST'
,p_help_text=>'Display the label stacked above the icon and badge'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19208067417620489)
,p_theme_id=>42
,p_name=>'LABEL_INLINE_LG'
,p_display_name=>'Display labels inline'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(19206767867620488)
,p_css_classes=>'t-NavTabs--inlineLabels-lg'
,p_group_id=>wwv_flow_api.id(19207635399620489)
,p_template_types=>'LIST'
,p_help_text=>'Display the label inline with the icon and badge'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19208267953620489)
,p_theme_id=>42
,p_name=>'NO_LABEL_LG'
,p_display_name=>'Do not display labels'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(19206767867620488)
,p_css_classes=>'t-NavTabs--hiddenLabels-lg'
,p_group_id=>wwv_flow_api.id(19207635399620489)
,p_template_types=>'LIST'
,p_help_text=>'Hides the label for the list item'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19208899843620489)
,p_theme_id=>42
,p_name=>'ALLSTEPS'
,p_display_name=>'All Steps'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(19208347519620489)
,p_css_classes=>'t-WizardSteps--displayLabels'
,p_group_id=>wwv_flow_api.id(19208602587620489)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19209068670620489)
,p_theme_id=>42
,p_name=>'CURRENTSTEPONLY'
,p_display_name=>'Current Step Only'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(19208347519620489)
,p_css_classes=>'t-WizardSteps--displayCurrentLabelOnly'
,p_group_id=>wwv_flow_api.id(19208602587620489)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19209258623620489)
,p_theme_id=>42
,p_name=>'HIDELABELS'
,p_display_name=>'Hide Labels'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(19208347519620489)
,p_css_classes=>'t-WizardSteps--hideLabels'
,p_group_id=>wwv_flow_api.id(19208602587620489)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19209486159620489)
,p_theme_id=>42
,p_name=>'VERTICAL_LIST'
,p_display_name=>'Vertical Orientation'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(19208347519620489)
,p_css_classes=>'t-WizardSteps--vertical'
,p_template_types=>'LIST'
,p_help_text=>'Displays the wizard progress list in a vertical orientation and is suitable for displaying within a side column of a page.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19209670013620489)
,p_theme_id=>42
,p_name=>'WIZARD_PROGRESS_LINKS'
,p_display_name=>'Make Wizard Steps Clickable'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(19208347519620489)
,p_css_classes=>'js-wizardProgressLinks'
,p_template_types=>'LIST'
,p_help_text=>'This option will make the wizard steps clickable links.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19210085981620490)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(19209742502620489)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Enables you to define a keyboard shortcut to activate the menu item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19210446371620490)
,p_theme_id=>42
,p_name=>'ABOVE_LABEL'
,p_display_name=>'Above Label'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(19210189397620490)
,p_css_classes=>'t-Tabs--iconsAbove'
,p_group_id=>wwv_flow_api.id(19196606876620483)
,p_template_types=>'LIST'
,p_help_text=>'Places icons above tab label.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19210694373620490)
,p_theme_id=>42
,p_name=>'FILL_LABELS'
,p_display_name=>'Fill Labels'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(19210189397620490)
,p_css_classes=>'t-Tabs--fillLabels'
,p_group_id=>wwv_flow_api.id(19189852048620479)
,p_template_types=>'LIST'
,p_help_text=>'Stretch tabs to fill to the width of the tabs container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19210847350620490)
,p_theme_id=>42
,p_name=>'INLINE_WITH_LABEL'
,p_display_name=>'Inline with Label'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(19210189397620490)
,p_css_classes=>'t-Tabs--inlineIcons'
,p_group_id=>wwv_flow_api.id(19196606876620483)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19211035132620490)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(19210189397620490)
,p_css_classes=>'t-Tabs--large'
,p_group_id=>wwv_flow_api.id(19200828119620484)
,p_template_types=>'LIST'
,p_help_text=>'Increases font size and white space around tab items.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19211212169620490)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Pill'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(19210189397620490)
,p_css_classes=>'t-Tabs--pill'
,p_group_id=>wwv_flow_api.id(19191035724620480)
,p_template_types=>'LIST'
,p_help_text=>'Displays tabs in a pill container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19211434955620490)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(19210189397620490)
,p_css_classes=>'t-Tabs--simple'
,p_group_id=>wwv_flow_api.id(19191035724620480)
,p_template_types=>'LIST'
,p_help_text=>'A very simplistic tab UI.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19211665133620490)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>5
,p_list_template_id=>wwv_flow_api.id(19210189397620490)
,p_css_classes=>'t-Tabs--small'
,p_group_id=>wwv_flow_api.id(19200828119620484)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19212804718620497)
,p_theme_id=>42
,p_name=>'PUSH'
,p_display_name=>'Push'
,p_display_sequence=>20
,p_button_template_id=>wwv_flow_api.id(19212414192620495)
,p_css_classes=>'t-Button--hoverIconPush'
,p_group_id=>wwv_flow_api.id(19212690568620497)
,p_template_types=>'BUTTON'
,p_help_text=>'The icon will animate to the right or left on button hover or focus.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19213005290620497)
,p_theme_id=>42
,p_name=>'SPIN'
,p_display_name=>'Spin'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_api.id(19212414192620495)
,p_css_classes=>'t-Button--hoverIconSpin'
,p_group_id=>wwv_flow_api.id(19212690568620497)
,p_template_types=>'BUTTON'
,p_help_text=>'The icon will spin on button hover or focus.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19213491841620498)
,p_theme_id=>42
,p_name=>'HIDE_LABEL_ON_MOBILE'
,p_display_name=>'Hide Label on Mobile'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_api.id(19213236022620498)
,p_css_classes=>'t-Button--mobileHideLabel'
,p_template_types=>'BUTTON'
,p_help_text=>'This template options hides the button label on small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19213889121620498)
,p_theme_id=>42
,p_name=>'LEFTICON'
,p_display_name=>'Left'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_api.id(19213236022620498)
,p_css_classes=>'t-Button--iconLeft'
,p_group_id=>wwv_flow_api.id(19213688992620498)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19214093185620498)
,p_theme_id=>42
,p_name=>'PUSH'
,p_display_name=>'Push'
,p_display_sequence=>20
,p_button_template_id=>wwv_flow_api.id(19213236022620498)
,p_css_classes=>'t-Button--hoverIconPush'
,p_group_id=>wwv_flow_api.id(19212690568620497)
,p_template_types=>'BUTTON'
,p_help_text=>'The icon will animate to the right or left on button hover or focus.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19214207235620498)
,p_theme_id=>42
,p_name=>'RIGHTICON'
,p_display_name=>'Right'
,p_display_sequence=>20
,p_button_template_id=>wwv_flow_api.id(19213236022620498)
,p_css_classes=>'t-Button--iconRight'
,p_group_id=>wwv_flow_api.id(19213688992620498)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19214413486620498)
,p_theme_id=>42
,p_name=>'SPIN'
,p_display_name=>'Spin'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_api.id(19213236022620498)
,p_css_classes=>'t-Button--hoverIconSpin'
,p_group_id=>wwv_flow_api.id(19212690568620497)
,p_template_types=>'BUTTON'
,p_help_text=>'The icon will spin on button hover or focus.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19216388710620538)
,p_theme_id=>42
,p_name=>'FBM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-bottom-lg'
,p_group_id=>wwv_flow_api.id(19216102535620538)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large bottom margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19216722227620538)
,p_theme_id=>42
,p_name=>'RBM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-bottom-lg'
,p_group_id=>wwv_flow_api.id(19216508926620538)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large bottom margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19216947416620538)
,p_theme_id=>42
,p_name=>'FBM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-bottom-md'
,p_group_id=>wwv_flow_api.id(19216102535620538)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium bottom margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19217136127620539)
,p_theme_id=>42
,p_name=>'RBM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-bottom-md'
,p_group_id=>wwv_flow_api.id(19216508926620538)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium bottom margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19217380006620539)
,p_theme_id=>42
,p_name=>'FBM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-bottom-none'
,p_group_id=>wwv_flow_api.id(19216102535620538)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the bottom margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19217506763620539)
,p_theme_id=>42
,p_name=>'RBM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-bottom-none'
,p_group_id=>wwv_flow_api.id(19216508926620538)
,p_template_types=>'REGION'
,p_help_text=>'Removes the bottom margin for this region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19217745966620539)
,p_theme_id=>42
,p_name=>'FBM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-bottom-sm'
,p_group_id=>wwv_flow_api.id(19216102535620538)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small bottom margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19217907241620539)
,p_theme_id=>42
,p_name=>'RBM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-bottom-sm'
,p_group_id=>wwv_flow_api.id(19216508926620538)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small bottom margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19218317436620539)
,p_theme_id=>42
,p_name=>'FLM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-left-lg'
,p_group_id=>wwv_flow_api.id(19218143505620539)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large left margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19218736572620539)
,p_theme_id=>42
,p_name=>'RLM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-left-lg'
,p_group_id=>wwv_flow_api.id(19218534625620539)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large right margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19218967253620539)
,p_theme_id=>42
,p_name=>'FLM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-left-md'
,p_group_id=>wwv_flow_api.id(19218143505620539)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium left margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19219157106620539)
,p_theme_id=>42
,p_name=>'RLM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-left-md'
,p_group_id=>wwv_flow_api.id(19218534625620539)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium right margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19219384612620540)
,p_theme_id=>42
,p_name=>'FLM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-left-none'
,p_group_id=>wwv_flow_api.id(19218143505620539)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the left margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19219591121620540)
,p_theme_id=>42
,p_name=>'RLM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-left-none'
,p_group_id=>wwv_flow_api.id(19218534625620539)
,p_template_types=>'REGION'
,p_help_text=>'Removes the left margin from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19219777976620540)
,p_theme_id=>42
,p_name=>'FLM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-left-sm'
,p_group_id=>wwv_flow_api.id(19218143505620539)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small left margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19219903017620540)
,p_theme_id=>42
,p_name=>'RLM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-left-sm'
,p_group_id=>wwv_flow_api.id(19218534625620539)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small left margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19220379987620540)
,p_theme_id=>42
,p_name=>'FRM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-right-lg'
,p_group_id=>wwv_flow_api.id(19220153938620540)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large right margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19220738106620540)
,p_theme_id=>42
,p_name=>'RRM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-right-lg'
,p_group_id=>wwv_flow_api.id(19220507566620540)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large right margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19220945223620540)
,p_theme_id=>42
,p_name=>'FRM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-right-md'
,p_group_id=>wwv_flow_api.id(19220153938620540)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium right margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19221194787620540)
,p_theme_id=>42
,p_name=>'RRM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-right-md'
,p_group_id=>wwv_flow_api.id(19220507566620540)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium right margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19221309778620540)
,p_theme_id=>42
,p_name=>'FRM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-right-none'
,p_group_id=>wwv_flow_api.id(19220153938620540)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the right margin for this field.'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19221535037620540)
,p_theme_id=>42
,p_name=>'RRM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-right-none'
,p_group_id=>wwv_flow_api.id(19220507566620540)
,p_template_types=>'REGION'
,p_help_text=>'Removes the right margin from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19221730360620541)
,p_theme_id=>42
,p_name=>'FRM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-right-sm'
,p_group_id=>wwv_flow_api.id(19220153938620540)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small right margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19221974336620541)
,p_theme_id=>42
,p_name=>'RRM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-right-sm'
,p_group_id=>wwv_flow_api.id(19220507566620540)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small right margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19222309323620541)
,p_theme_id=>42
,p_name=>'FTM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-top-lg'
,p_group_id=>wwv_flow_api.id(19222106338620541)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large top margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19222703514620541)
,p_theme_id=>42
,p_name=>'RTM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-top-lg'
,p_group_id=>wwv_flow_api.id(19222500965620541)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large top margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19222907823620541)
,p_theme_id=>42
,p_name=>'FTM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-top-md'
,p_group_id=>wwv_flow_api.id(19222106338620541)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium top margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19223125270620541)
,p_theme_id=>42
,p_name=>'RTM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-top-md'
,p_group_id=>wwv_flow_api.id(19222500965620541)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium top margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19223345934620541)
,p_theme_id=>42
,p_name=>'FTM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-top-none'
,p_group_id=>wwv_flow_api.id(19222106338620541)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the top margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19223513265620541)
,p_theme_id=>42
,p_name=>'RTM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-top-none'
,p_group_id=>wwv_flow_api.id(19222500965620541)
,p_template_types=>'REGION'
,p_help_text=>'Removes the top margin for this region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19223714450620541)
,p_theme_id=>42
,p_name=>'FTM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-top-sm'
,p_group_id=>wwv_flow_api.id(19222106338620541)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small top margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19223984861620542)
,p_theme_id=>42
,p_name=>'RTM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-top-sm'
,p_group_id=>wwv_flow_api.id(19222500965620541)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small top margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19224382370620542)
,p_theme_id=>42
,p_name=>'DANGER'
,p_display_name=>'Danger'
,p_display_sequence=>30
,p_css_classes=>'t-Button--danger'
,p_group_id=>wwv_flow_api.id(19224101441620542)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19224778205620542)
,p_theme_id=>42
,p_name=>'LARGEBOTTOMMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapBottom'
,p_group_id=>wwv_flow_api.id(19224521240620542)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19225104265620542)
,p_theme_id=>42
,p_name=>'LARGELEFTMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapLeft'
,p_group_id=>wwv_flow_api.id(19224913046620542)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19225536741620542)
,p_theme_id=>42
,p_name=>'LARGERIGHTMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapRight'
,p_group_id=>wwv_flow_api.id(19225350902620542)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19225978021620542)
,p_theme_id=>42
,p_name=>'LARGETOPMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapTop'
,p_group_id=>wwv_flow_api.id(19225733983620542)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19226317248620543)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>30
,p_css_classes=>'t-Button--large'
,p_group_id=>wwv_flow_api.id(19226135789620543)
,p_template_types=>'BUTTON'
,p_help_text=>'A large button.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19226790550620543)
,p_theme_id=>42
,p_name=>'DISPLAY_AS_LINK'
,p_display_name=>'Display as Link'
,p_display_sequence=>30
,p_css_classes=>'t-Button--link'
,p_group_id=>wwv_flow_api.id(19226589327620543)
,p_template_types=>'BUTTON'
,p_help_text=>'This option makes the button appear as a text link.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19226988171620543)
,p_theme_id=>42
,p_name=>'NOUI'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>20
,p_css_classes=>'t-Button--noUI'
,p_group_id=>wwv_flow_api.id(19226589327620543)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19227149647620543)
,p_theme_id=>42
,p_name=>'SMALLBOTTOMMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padBottom'
,p_group_id=>wwv_flow_api.id(19224521240620542)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19227350326620543)
,p_theme_id=>42
,p_name=>'SMALLLEFTMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padLeft'
,p_group_id=>wwv_flow_api.id(19224913046620542)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19227543412620543)
,p_theme_id=>42
,p_name=>'SMALLRIGHTMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padRight'
,p_group_id=>wwv_flow_api.id(19225350902620542)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19227781928620543)
,p_theme_id=>42
,p_name=>'SMALLTOPMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padTop'
,p_group_id=>wwv_flow_api.id(19225733983620542)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19228187140620543)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Inner Button'
,p_display_sequence=>20
,p_css_classes=>'t-Button--pill'
,p_group_id=>wwv_flow_api.id(19227953483620543)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19228346613620544)
,p_theme_id=>42
,p_name=>'PILLEND'
,p_display_name=>'Last Button'
,p_display_sequence=>30
,p_css_classes=>'t-Button--pillEnd'
,p_group_id=>wwv_flow_api.id(19227953483620543)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19228571415620544)
,p_theme_id=>42
,p_name=>'PILLSTART'
,p_display_name=>'First Button'
,p_display_sequence=>10
,p_css_classes=>'t-Button--pillStart'
,p_group_id=>wwv_flow_api.id(19227953483620543)
,p_template_types=>'BUTTON'
,p_help_text=>'Use this for the start of a pill button.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19228788409620544)
,p_theme_id=>42
,p_name=>'PRIMARY'
,p_display_name=>'Primary'
,p_display_sequence=>10
,p_css_classes=>'t-Button--primary'
,p_group_id=>wwv_flow_api.id(19224101441620542)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19228958254620544)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_css_classes=>'t-Button--simple'
,p_group_id=>wwv_flow_api.id(19226589327620543)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19229177196620544)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'t-Button--small'
,p_group_id=>wwv_flow_api.id(19226135789620543)
,p_template_types=>'BUTTON'
,p_help_text=>'A small button.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19229517273620544)
,p_theme_id=>42
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>10
,p_css_classes=>'t-Button--stretch'
,p_group_id=>wwv_flow_api.id(19229343091620544)
,p_template_types=>'BUTTON'
,p_help_text=>'Stretches button to fill container'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19229796880620544)
,p_theme_id=>42
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>40
,p_css_classes=>'t-Button--success'
,p_group_id=>wwv_flow_api.id(19224101441620542)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19229944756620544)
,p_theme_id=>42
,p_name=>'TINY'
,p_display_name=>'Tiny'
,p_display_sequence=>10
,p_css_classes=>'t-Button--tiny'
,p_group_id=>wwv_flow_api.id(19226135789620543)
,p_template_types=>'BUTTON'
,p_help_text=>'A very small button.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19230108879620544)
,p_theme_id=>42
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>20
,p_css_classes=>'t-Button--warning'
,p_group_id=>wwv_flow_api.id(19224101441620542)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19230591221620545)
,p_theme_id=>42
,p_name=>'SHOWFORMLABELSABOVE'
,p_display_name=>'Show Form Labels Above'
,p_display_sequence=>10
,p_css_classes=>'t-Form--labelsAbove'
,p_group_id=>wwv_flow_api.id(19230324904620544)
,p_template_types=>'REGION'
,p_help_text=>'Show form labels above input fields.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19230919767620545)
,p_theme_id=>42
,p_name=>'FORMSIZELARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_css_classes=>'t-Form--large'
,p_group_id=>wwv_flow_api.id(19230770948620545)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19231328154620545)
,p_theme_id=>42
,p_name=>'FORMLEFTLABELS'
,p_display_name=>'Left'
,p_display_sequence=>20
,p_css_classes=>'t-Form--leftLabels'
,p_group_id=>wwv_flow_api.id(19231137941620545)
,p_template_types=>'REGION'
,p_help_text=>'Align form labels to left.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19231717063620545)
,p_theme_id=>42
,p_name=>'FORMREMOVEPADDING'
,p_display_name=>'Remove Padding'
,p_display_sequence=>20
,p_css_classes=>'t-Form--noPadding'
,p_group_id=>wwv_flow_api.id(19231570381620545)
,p_template_types=>'REGION'
,p_help_text=>'Removes padding between items.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19231987184620545)
,p_theme_id=>42
,p_name=>'FORMSLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>10
,p_css_classes=>'t-Form--slimPadding'
,p_group_id=>wwv_flow_api.id(19231570381620545)
,p_template_types=>'REGION'
,p_help_text=>'Reduces form item padding to 4px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19232363412620545)
,p_theme_id=>42
,p_name=>'STRETCH_FORM_FIELDS'
,p_display_name=>'Stretch Form Fields'
,p_display_sequence=>10
,p_css_classes=>'t-Form--stretchInputs'
,p_group_id=>wwv_flow_api.id(19232110531620545)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19232512312620545)
,p_theme_id=>42
,p_name=>'FORMSIZEXLARGE'
,p_display_name=>'X Large'
,p_display_sequence=>20
,p_css_classes=>'t-Form--xlarge'
,p_group_id=>wwv_flow_api.id(19230770948620545)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19232922009620546)
,p_theme_id=>42
,p_name=>'LARGE_FIELD'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--large'
,p_group_id=>wwv_flow_api.id(19232780040620546)
,p_template_types=>'FIELD'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19233372176620546)
,p_theme_id=>42
,p_name=>'POST_TEXT_BLOCK'
,p_display_name=>'Display as Block'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--postTextBlock'
,p_group_id=>wwv_flow_api.id(19233147408620546)
,p_template_types=>'FIELD'
,p_help_text=>'Displays the Item Post Text in a block style immediately after the item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19233739925620546)
,p_theme_id=>42
,p_name=>'PRE_TEXT_BLOCK'
,p_display_name=>'Display as Block'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--preTextBlock'
,p_group_id=>wwv_flow_api.id(19233511971620546)
,p_template_types=>'FIELD'
,p_help_text=>'Displays the Item Pre Text in a block style immediately before the item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19234153054620546)
,p_theme_id=>42
,p_name=>'DISPLAY_AS_PILL_BUTTON'
,p_display_name=>'Display as Pill Button'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--radioButtonGroup'
,p_group_id=>wwv_flow_api.id(19233959427620546)
,p_template_types=>'FIELD'
,p_help_text=>'Displays the radio buttons to look like a button set / pill button.  Note that the the radio buttons must all be in the same row for this option to work.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19234315060620547)
,p_theme_id=>42
,p_name=>'STRETCH_FORM_ITEM'
,p_display_name=>'Stretch Form Item'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--stretchInputs'
,p_template_types=>'FIELD'
,p_help_text=>'Stretches the form item to fill its container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19234521533620547)
,p_theme_id=>42
,p_name=>'X_LARGE_SIZE'
,p_display_name=>'X Large'
,p_display_sequence=>20
,p_css_classes=>'t-Form-fieldContainer--xlarge'
,p_group_id=>wwv_flow_api.id(19232780040620546)
,p_template_types=>'FIELD'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(19234991082620547)
,p_theme_id=>42
,p_name=>'HIDE_WHEN_ALL_ROWS_DISPLAYED'
,p_display_name=>'Hide when all rows displayed'
,p_display_sequence=>10
,p_css_classes=>'t-Report--hideNoPagination'
,p_group_id=>wwv_flow_api.id(19234736396620547)
,p_template_types=>'REPORT'
,p_help_text=>'This option will hide the pagination when all rows are displayed.'
);
end;
/
prompt --application/shared_components/logic/build_options
begin
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(19237283839620589)
,p_build_option_name=>'Feature: Feedback'
,p_build_option_status=>'INCLUDE'
,p_feature_identifier=>'APPLICATION_FEEDBACK'
,p_build_option_comment=>'Provide a mechanism for end users to post general comments back to the application administrators and developers.'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(19237708892620589)
,p_build_option_name=>'Feature: About Page'
,p_build_option_status=>'INCLUDE'
,p_feature_identifier=>'APPLICATION_ABOUT_PAGE'
,p_build_option_comment=>'About this application page.'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(19480732381208923)
,p_build_option_name=>'Feature: Activity Reporting'
,p_build_option_status=>'INCLUDE'
,p_feature_identifier=>'APPLICATION_ACTIVITY_REPORTING'
,p_build_option_comment=>'Include numerous reports and charts on end user activity.'
);
end;
/
prompt --application/shared_components/globalization/language
begin
null;
end;
/
prompt --application/shared_components/globalization/translations
begin
null;
end;
/
prompt --application/shared_components/globalization/messages
begin
null;
end;
/
prompt --application/shared_components/globalization/dyntranslations
begin
null;
end;
/
prompt --application/shared_components/user_interface/shortcuts/delete_confirm_msg
begin
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(19238916108620593)
,p_shortcut_name=>'DELETE_CONFIRM_MSG'
,p_shortcut_type=>'TEXT_ESCAPE_JS'
,p_shortcut=>'Would you like to perform this delete action?'
);
end;
/
prompt --application/shared_components/security/authentications/application_express_authentication
begin
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(19106480676620393)
,p_name=>'Application Express Authentication'
,p_scheme_type=>'NATIVE_APEX_ACCOUNTS'
,p_invalid_session_type=>'LOGIN'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
end;
/
prompt --application/shared_components/security/authentications/anonymous
begin
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(19391955568164611)
,p_name=>'Anonymous'
,p_scheme_type=>'NATIVE_DAD'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
end;
/
prompt --application/user_interfaces
begin
wwv_flow_api.create_user_interface(
 p_id=>wwv_flow_api.id(19235660911620554)
,p_ui_type_name=>'DESKTOP'
,p_display_name=>'Desktop'
,p_display_seq=>10
,p_use_auto_detect=>false
,p_is_default=>true
,p_theme_id=>42
,p_home_url=>'f?p=&APP_ID.:1:&SESSION.'
,p_login_url=>'f?p=&APP_ID.:LOGIN_DESKTOP:&SESSION.'
,p_theme_style_by_user_pref=>false
,p_built_with_love=>false
,p_global_page_id=>0
,p_navigation_list_id=>wwv_flow_api.id(19107274413620400)
,p_navigation_list_position=>'SIDE'
,p_navigation_list_template_id=>wwv_flow_api.id(19202181926620485)
,p_nav_list_template_options=>'#DEFAULT#:t-TreeNav--styleA'
,p_css_file_urls=>'#APP_IMAGES#app-icon.css?version=#APP_VERSION#'
,p_nav_bar_type=>'LIST'
,p_nav_bar_list_id=>wwv_flow_api.id(19235377548620553)
,p_nav_bar_list_template_id=>wwv_flow_api.id(19201987004620485)
,p_nav_bar_template_options=>'#DEFAULT#'
);
end;
/
prompt --application/user_interfaces/combined_files
begin
null;
end;
/
prompt --application/pages/page_00000
begin
wwv_flow_api.create_page(
 p_id=>0
,p_user_interface_id=>wwv_flow_api.id(19235660911620554)
,p_name=>'Global Page - Desktop'
,p_step_title=>'Global Page - Desktop'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'D'
,p_last_updated_by=>'DEMO'
,p_last_upd_yyyymmddhh24miss=>'20191022131629'
);
end;
/
prompt --application/pages/page_00001
begin
wwv_flow_api.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(19235660911620554)
,p_name=>'Home'
,p_alias=>'HOME'
,p_step_title=>'myDeezer'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This application gives ability to view and <b>export</b> playlist content from your own Deezer account.',
'<br>',
'In order to export, select first a large number of items by choosing in the limit select list.',
'<p>',
'Then, select Option menu, Download and choosed the required format, or click on Export upper right button.   ',
'</p>',
''))
,p_last_updated_by=>'DEMO'
,p_last_upd_yyyymmddhh24miss=>'20191023205805'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19247186143620641)
,p_plug_name=>'myDeezer'
,p_icon_css_classes=>'app-icon'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(19149613375620452)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
end;
/
prompt --application/pages/page_00002
begin
wwv_flow_api.create_page(
 p_id=>2
,p_user_interface_id=>wwv_flow_api.id(19235660911620554)
,p_name=>'Tracks'
,p_step_title=>'Tracks'
,p_error_notification_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'No data !',
'Connect before'))
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'DEMO'
,p_last_upd_yyyymmddhh24miss=>'20191025114533'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19306149591639214)
,p_plug_name=>'Tracks'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton'
,p_plug_template=>wwv_flow_api.id(19155944385620455)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_location=>'WEB_SOURCE'
,p_web_src_module_id=>wwv_flow_api.id(19303917643630071)
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'ROWNUM N,',
'ID,',
'       LINK,',
'       RANK,',
'       TYPE,',
'       ID2,',
'       TYPE2,',
'       COVER,',
'       TITLE,',
'       COVER_XL,',
'       COVER_BIG,',
'       TRACKLIST,',
'       COVER_SMALL,',
'       COVER_MEDIUM,',
'       TITLE2,',
'       ID3,',
'       LINK2,',
'       NAME,',
'       TYPE3,',
'       PICTURE,',
'       TRACKLIST2,',
'       PICTURE_XL,',
'       PICTURE_BIG,',
'       PICTURE_SMALL,',
'       PICTURE_MEDIUM,',
'       PREVIEW,',
'       to_char(to_date(DURATION,''sssss''),''mi:ss'') DURATION,',
'       READABLE,',
'       to_date(''1970'', ''YYYY'') + (((TIME_ADD/3600)/24)  - (273)) TIME_ADD,',
'       TITLE_SHORT,',
'       TITLE_VERSION,',
'       EXPLICIT_LYRICS,',
'       EXPLICIT_CONTENT_COVER,',
'       EXPLICIT_CONTENT_LYRICS',
'  from #APEX$SOURCE_DATA#'))
,p_source_post_processing=>'SQL'
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>210
,p_prn_height=>297
,p_prn_orientation=>'VERTICAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(19306203589639214)
,p_name=>'Tracks'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_show_finder_drop_down=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_filter=>'N'
,p_show_highlight=>'N'
,p_show_computation=>'N'
,p_show_aggregate=>'N'
,p_show_chart=>'N'
,p_show_group_by=>'N'
,p_show_pivot=>'N'
,p_show_flashback=>'N'
,p_show_reset=>'N'
,p_show_help=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_download_filename=>'tracks_&P2_TITLE.'
,p_csv_output_separator=>';'
,p_csv_output_enclosed_by=>'"'
,p_icon_view_enabled_yn=>'Y'
,p_icon_view_link_column=>'PREVIEW'
,p_icon_view_img_src_column=>'COVER_MEDIUM'
,p_icon_view_label_column=>'TITLE_SHORT'
,p_icon_view_columns_per_row=>8
,p_owner=>'DEMO'
,p_internal_uid=>19306203589639214
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19306608279639216)
,p_db_column_name=>'ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19307083026639216)
,p_db_column_name=>'LINK'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Link'
,p_column_link=>'#LINK#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-view.png" class="apex-edit-view" alt="">'
,p_column_link_attr=>'target="_LINK"'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19307464537639216)
,p_db_column_name=>'RANK'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Rank'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19307865776639217)
,p_db_column_name=>'TYPE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19308297260639217)
,p_db_column_name=>'ID2'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Id2'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19308666545639217)
,p_db_column_name=>'TYPE2'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Type2'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19309065140639217)
,p_db_column_name=>'COVER'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Cover'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19309477106639218)
,p_db_column_name=>'TITLE'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Album'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19309894655639218)
,p_db_column_name=>'COVER_XL'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Cover Xl'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19310268874639218)
,p_db_column_name=>'COVER_BIG'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Cover Big'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19310654141639218)
,p_db_column_name=>'TRACKLIST'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Tracklist'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19311011066639219)
,p_db_column_name=>'COVER_SMALL'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Cover Small'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19311492753639219)
,p_db_column_name=>'COVER_MEDIUM'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Cover Medium'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19311881796639219)
,p_db_column_name=>'TITLE2'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Titre'
,p_column_link=>'#LINK#'
,p_column_linktext=>'#TITLE2#'
,p_column_link_attr=>'target="_link"'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19312284038639219)
,p_db_column_name=>'ID3'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Id3'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19312683328639219)
,p_db_column_name=>'LINK2'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Link2'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19313027115639220)
,p_db_column_name=>'NAME'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Artist'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19313422842639220)
,p_db_column_name=>'TYPE3'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Type3'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19313886139639220)
,p_db_column_name=>'PICTURE'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Picture'
,p_column_html_expression=>'<a href="#PICTURE_BIG#" target="_picture"><img src="#PICTURE_SMALL#"></a>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19314212719639220)
,p_db_column_name=>'TRACKLIST2'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Tracklist2'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19314687533639221)
,p_db_column_name=>'PICTURE_XL'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Picture Xl'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19315038650639221)
,p_db_column_name=>'PICTURE_BIG'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Picture Big'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19315476387639221)
,p_db_column_name=>'PICTURE_SMALL'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Picture Small'
,p_column_html_expression=>'<img src="#PICTURE_SMALL#">'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19315845680639221)
,p_db_column_name=>'PICTURE_MEDIUM'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Picture Medium'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19316293427639222)
,p_db_column_name=>'PREVIEW'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Preview'
,p_column_link=>'#PREVIEW#'
,p_column_linktext=>'<span class="fa fa-play" aria-hidden="true"></span>'
,p_column_link_attr=>'target="_preview"'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19317086288639222)
,p_db_column_name=>'READABLE'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Readable'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19317820616639223)
,p_db_column_name=>'TITLE_SHORT'
,p_display_order=>29
,p_column_identifier=>'AC'
,p_column_label=>'Title Short'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19318279296639223)
,p_db_column_name=>'TITLE_VERSION'
,p_display_order=>30
,p_column_identifier=>'AD'
,p_column_label=>'Title Version'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19318614851639223)
,p_db_column_name=>'EXPLICIT_LYRICS'
,p_display_order=>31
,p_column_identifier=>'AE'
,p_column_label=>'Explicit Lyrics'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19319019871639223)
,p_db_column_name=>'EXPLICIT_CONTENT_COVER'
,p_display_order=>32
,p_column_identifier=>'AF'
,p_column_label=>'Explicit Content Cover'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19319406916639224)
,p_db_column_name=>'EXPLICIT_CONTENT_LYRICS'
,p_display_order=>33
,p_column_identifier=>'AG'
,p_column_label=>'Explicit Content Lyrics'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19385899510100830)
,p_db_column_name=>'DURATION'
,p_display_order=>43
,p_column_identifier=>'AI'
,p_column_label=>'Duration'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19385935802100831)
,p_db_column_name=>'TIME_ADD'
,p_display_order=>53
,p_column_identifier=>'AJ'
,p_column_label=>'Time Add'
,p_column_html_expression=>'<span style="display:block; width:100px">#TIME_ADD#</span>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-RR'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19386855131100840)
,p_db_column_name=>'N'
,p_display_order=>63
,p_column_identifier=>'AK'
,p_column_label=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(19321091875640485)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'REPORT'
,p_report_alias=>'193211'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_view_mode=>'REPORT'
,p_report_columns=>'TITLE2:NAME:TITLE:TIME_ADD:PREVIEW:'
,p_sort_column_1=>'TIME_ADD'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'0'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
,p_break_on=>'0:0:0:0:0'
,p_break_enabled_on=>'0:0:0:0:0'
);
wwv_flow_api.create_web_source_comp_param(
 p_id=>wwv_flow_api.id(19319951968639231)
,p_page_id=>2
,p_web_src_param_id=>wwv_flow_api.id(19304686577630083)
,p_page_plug_id=>wwv_flow_api.id(19306149591639214)
,p_value_type=>'ITEM'
,p_value=>'P2_ID'
);
wwv_flow_api.create_web_source_comp_param(
 p_id=>wwv_flow_api.id(19320452669639233)
,p_page_id=>2
,p_web_src_param_id=>wwv_flow_api.id(19305067326630084)
,p_page_plug_id=>wwv_flow_api.id(19306149591639214)
,p_value_type=>'ITEM'
,p_value=>'GTOKEN'
);
wwv_flow_api.create_web_source_comp_param(
 p_id=>wwv_flow_api.id(19322131547669207)
,p_page_id=>2
,p_web_src_param_id=>wwv_flow_api.id(19321820613669204)
,p_page_plug_id=>wwv_flow_api.id(19306149591639214)
,p_value_type=>'SQL_QUERY'
,p_value=>'select NVL(:P2_OFFSET,1) from dual'
);
wwv_flow_api.create_web_source_comp_param(
 p_id=>wwv_flow_api.id(19417213379954362)
,p_page_id=>2
,p_web_src_param_id=>wwv_flow_api.id(19416963909954361)
,p_page_plug_id=>wwv_flow_api.id(19306149591639214)
,p_value_type=>'ITEM'
,p_value=>'P2_LIMIT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(19385687113100828)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(19306149591639214)
,p_button_name=>'Export2'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(19213196014620497)
,p_button_image_alt=>'Export2'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'https://zwgpvlahytdg6cg-db201909271625.adb.eu-frankfurt-1.oraclecloudapps.com/ords/f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION_ID.:CSV:::P2_ID,ACCESS_TOKEN:1000,1999'
,p_button_condition_type=>'NEVER'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(19384902576100821)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(19306149591639214)
,p_button_name=>'Export'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(19213236022620498)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Export'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:2:&APP_SESSION.:CSV'
,p_icon_css_classes=>'fa-download'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(19384187018100813)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(19306149591639214)
,p_button_name=>'Previous'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(19213236022620498)
,p_button_image_alt=>'Previous'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-chevron-left'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(19384222378100814)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(19306149591639214)
,p_button_name=>'Next'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(19213236022620498)
,p_button_image_alt=>'Next'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-chevron-right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19383748974100809)
,p_name=>'P2_TITLE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(19306149591639214)
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(19211857718620493)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--xlarge:margin-left-sm'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19383885378100810)
,p_name=>'P2_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(19306149591639214)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19384025884100812)
,p_name=>'P2_LIMIT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(19306149591639214)
,p_item_default=>'200'
,p_prompt=>'# tracks to display: '
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:5;5,10;10,50;50,200;200,500;500,1000;1000'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(19211857718620493)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SUBMIT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19386108081100833)
,p_name=>'P2_OFFSET'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(19306149591639214)
,p_item_default=>'1'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(19384327262100815)
,p_name=>'New'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(19384187018100813)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19384453162100816)
,p_event_id=>wwv_flow_api.id(19384327262100815)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P2_OFFSET := (NVL(:P2_OFFSET,1) - :P2_LIMIT);',
'if :P2_OFFSET <0 then',
'   :P2_OFFSET := 1;',
'end if;'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19384514411100817)
,p_event_id=>wwv_flow_api.id(19384327262100815)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(19384664197100818)
,p_name=>'New_1'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(19384222378100814)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19384768354100819)
,p_event_id=>wwv_flow_api.id(19384664197100818)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P2_OFFSET := NVL(:P2_OFFSET,1) + :P2_LIMIT;',
'',
'',
''))
,p_attribute_02=>'P2_OFFSET'
,p_attribute_03=>'P2_OFFSET'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19384886587100820)
,p_event_id=>wwv_flow_api.id(19384664197100818)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
end;
/
prompt --application/pages/page_00003
begin
wwv_flow_api.create_page(
 p_id=>3
,p_user_interface_id=>wwv_flow_api.id(19235660911620554)
,p_name=>'Tracks Rep'
,p_step_title=>'Tracks Rep'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'DEMO'
,p_last_upd_yyyymmddhh24miss=>'20191023122526'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(19323634659740948)
,p_name=>'Report 1'
,p_template=>wwv_flow_api.id(19157096164620456)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_location=>'WEB_SOURCE'
,p_web_src_module_id=>wwv_flow_api.id(19303917643630071)
,p_query_type=>'SQL'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(19177373070620468)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Download'
,p_prn_output=>'N'
,p_prn_format=>'PDF'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(19324031620740950)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_column_heading=>'Id'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(19324439282740950)
,p_query_column_id=>2
,p_column_alias=>'LINK'
,p_column_display_sequence=>2
,p_column_heading=>'Link'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(19324836101740950)
,p_query_column_id=>3
,p_column_alias=>'RANK'
,p_column_display_sequence=>3
,p_column_heading=>'Rank'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(19325285668740950)
,p_query_column_id=>4
,p_column_alias=>'TYPE'
,p_column_display_sequence=>4
,p_column_heading=>'Type'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(19325657184740951)
,p_query_column_id=>5
,p_column_alias=>'ID2'
,p_column_display_sequence=>5
,p_column_heading=>'Id2'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(19326041668740951)
,p_query_column_id=>6
,p_column_alias=>'TYPE2'
,p_column_display_sequence=>6
,p_column_heading=>'Type2'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(19326467699740951)
,p_query_column_id=>7
,p_column_alias=>'COVER'
,p_column_display_sequence=>7
,p_column_heading=>'Cover'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(19326861140740951)
,p_query_column_id=>8
,p_column_alias=>'TITLE'
,p_column_display_sequence=>8
,p_column_heading=>'Title'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(19327293524740951)
,p_query_column_id=>9
,p_column_alias=>'COVER_XL'
,p_column_display_sequence=>9
,p_column_heading=>'Cover Xl'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(19327623210740952)
,p_query_column_id=>10
,p_column_alias=>'COVER_BIG'
,p_column_display_sequence=>10
,p_column_heading=>'Cover Big'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(19328023560740952)
,p_query_column_id=>11
,p_column_alias=>'TRACKLIST'
,p_column_display_sequence=>11
,p_column_heading=>'Tracklist'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(19328405064740952)
,p_query_column_id=>12
,p_column_alias=>'COVER_SMALL'
,p_column_display_sequence=>12
,p_column_heading=>'Cover Small'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(19328873486740952)
,p_query_column_id=>13
,p_column_alias=>'COVER_MEDIUM'
,p_column_display_sequence=>13
,p_column_heading=>'Cover Medium'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(19329256556740952)
,p_query_column_id=>14
,p_column_alias=>'TITLE2'
,p_column_display_sequence=>14
,p_column_heading=>'Title2'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(19329650888740953)
,p_query_column_id=>15
,p_column_alias=>'ID3'
,p_column_display_sequence=>15
,p_column_heading=>'Id3'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(19330037324740953)
,p_query_column_id=>16
,p_column_alias=>'LINK2'
,p_column_display_sequence=>16
,p_column_heading=>'Link2'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(19330426272740953)
,p_query_column_id=>17
,p_column_alias=>'NAME'
,p_column_display_sequence=>17
,p_column_heading=>'Name'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(19330834347740953)
,p_query_column_id=>18
,p_column_alias=>'TYPE3'
,p_column_display_sequence=>18
,p_column_heading=>'Type3'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(19331210876740954)
,p_query_column_id=>19
,p_column_alias=>'PICTURE'
,p_column_display_sequence=>19
,p_column_heading=>'Picture'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(19331617955740954)
,p_query_column_id=>20
,p_column_alias=>'TRACKLIST2'
,p_column_display_sequence=>20
,p_column_heading=>'Tracklist2'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(19332025773740954)
,p_query_column_id=>21
,p_column_alias=>'PICTURE_XL'
,p_column_display_sequence=>21
,p_column_heading=>'Picture Xl'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(19332495466740954)
,p_query_column_id=>22
,p_column_alias=>'PICTURE_BIG'
,p_column_display_sequence=>22
,p_column_heading=>'Picture Big'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(19332840320740954)
,p_query_column_id=>23
,p_column_alias=>'PICTURE_SMALL'
,p_column_display_sequence=>23
,p_column_heading=>'Picture Small'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(19333217495740955)
,p_query_column_id=>24
,p_column_alias=>'PICTURE_MEDIUM'
,p_column_display_sequence=>24
,p_column_heading=>'Picture Medium'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(19333608749740955)
,p_query_column_id=>25
,p_column_alias=>'PREVIEW'
,p_column_display_sequence=>25
,p_column_heading=>'Preview'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(19334024855740955)
,p_query_column_id=>26
,p_column_alias=>'DURATION'
,p_column_display_sequence=>26
,p_column_heading=>'Duration'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(19334472257740955)
,p_query_column_id=>27
,p_column_alias=>'READABLE'
,p_column_display_sequence=>27
,p_column_heading=>'Readable'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(19334800563740956)
,p_query_column_id=>28
,p_column_alias=>'TIME_ADD'
,p_column_display_sequence=>28
,p_column_heading=>'Time Add'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(19335211781740956)
,p_query_column_id=>29
,p_column_alias=>'TITLE_SHORT'
,p_column_display_sequence=>29
,p_column_heading=>'Title Short'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(19335621437740956)
,p_query_column_id=>30
,p_column_alias=>'TITLE_VERSION'
,p_column_display_sequence=>30
,p_column_heading=>'Title Version'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(19336078000740956)
,p_query_column_id=>31
,p_column_alias=>'EXPLICIT_LYRICS'
,p_column_display_sequence=>31
,p_column_heading=>'Explicit Lyrics'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(19336477816740956)
,p_query_column_id=>32
,p_column_alias=>'EXPLICIT_CONTENT_COVER'
,p_column_display_sequence=>32
,p_column_heading=>'Explicit Content Cover'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(19336832432740957)
,p_query_column_id=>33
,p_column_alias=>'EXPLICIT_CONTENT_LYRICS'
,p_column_display_sequence=>33
,p_column_heading=>'Explicit Content Lyrics'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_web_source_comp_param(
 p_id=>wwv_flow_api.id(19367374183740979)
,p_page_id=>3
,p_web_src_param_id=>wwv_flow_api.id(19304686577630083)
,p_page_plug_id=>wwv_flow_api.id(19323634659740948)
,p_value_type=>'STATIC'
,p_value=>'192541761'
);
wwv_flow_api.create_web_source_comp_param(
 p_id=>wwv_flow_api.id(19367816079740979)
,p_page_id=>3
,p_web_src_param_id=>wwv_flow_api.id(19305067326630084)
,p_page_plug_id=>wwv_flow_api.id(19323634659740948)
,p_value_type=>'STATIC'
,p_value=>'frjTt1FXtaFKSytZOiRVcHxaeFXftVL9JYyo6D7Nr2wlU07Pjpx'
);
wwv_flow_api.create_web_source_comp_param(
 p_id=>wwv_flow_api.id(19368330347740980)
,p_page_id=>3
,p_web_src_param_id=>wwv_flow_api.id(19321820613669204)
,p_page_plug_id=>wwv_flow_api.id(19323634659740948)
,p_value_type=>'STATIC'
,p_value=>'1'
);
wwv_flow_api.create_web_source_comp_param(
 p_id=>wwv_flow_api.id(19417766611954363)
,p_page_id=>3
,p_web_src_param_id=>wwv_flow_api.id(19416963909954361)
,p_page_plug_id=>wwv_flow_api.id(19323634659740948)
,p_value_type=>'STATIC'
,p_value=>'5'
);
end;
/
prompt --application/pages/page_00004
begin
wwv_flow_api.create_page(
 p_id=>4
,p_user_interface_id=>wwv_flow_api.id(19235660911620554)
,p_name=>'Login'
,p_step_title=>'Login'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'DEMO'
,p_last_upd_yyyymmddhh24miss=>'20191025112837'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19382926882100801)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(19157096164620456)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19383064928100802)
,p_name=>'P4_TOKEN'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(19382926882100801)
,p_prompt=>'Token'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(19212048692620493)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19383124717100803)
,p_name=>'P4_URL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(19382926882100801)
,p_prompt=>'Url'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(19212048692620493)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19385284816100824)
,p_name=>'P4_USER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(19382926882100801)
,p_prompt=>'User'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(19212048692620493)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(19383233204100804)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Deezer Login'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'tsid varchar2(50);',
'temp varchar2(1000);',
'tappid varchar2(100);',
'tqs varchar2(500);',
'tcode varchar2(100);',
'atoken varchar2(100);',
'tuser varchar2(2000);',
'tlovid varchar2(50);',
'tnblist NUMBER;',
'begin',
'',
'    begin',
'        select app_id into tappid',
'        from deezer_key',
'        where upper(app_name) =''MYPLAYLISTS2'';',
'    exception',
'        when others then null;',
'    end;',
'',
'tqs := owa_util.get_cgi_env(''QUERY_STRING'');',
'if instr(tqs,''code='') >0 then',
'  tcode := substr(tqs, instr(tqs, ''code='') + 5); ',
'  atoken := deezer_pkg.get_token(tcode);',
'  ',
'  APEX_UTIL.SET_SESSION_STATE(''GTOKEN'',atoken);',
'  :GTOKEN := atoken;                -- put access token in a global variable',
'  ',
'  ',
'  --:GUSER := deezer_pkg.get_name(atoken);    -- get username',
'  tuser := deezer_pkg.get_name(atoken);    -- get username',
'  tlovid := deezer_pkg.get_lovedtrack(atoken);  -- get loved tracks id',
'  tnblist := deezer_pkg.get_nblist(atoken);  -- get number of playlists',
'  :GLOVID := tlovid;',
'  :GUSER := tuser;',
'  APEX_UTIL.SET_SESSION_STATE(''GUSER'',tuser);',
'  APEX_UTIL.SET_SESSION_STATE(''GLOVID'',tlovid);  -- set global variables',
'  APEX_UTIL.SET_SESSION_STATE(''GNBLIST'',tnblist);',
'  ',
'  owa_util.redirect_url(''f?p=&APP_ID.:1:&APP_SESSION.'');  -- redirect to the home page',
'  apex_application.stop_apex_engine;',
'else',
'tsid := V(''APP_SESSION'');',
'temp := ''https://connect.deezer.com/oauth/auth.php?app_id=''||',
'     tappid ||',
'     ''&redirect_uri=''||',
'''https://zwgpvlahytdg6cg-db201909271625.adb.eu-frankfurt-1.oraclecloudapps.com/ords/f?'' ||',
'tqs ||',
'''&perms=basic_access'';',
':P4_URL := temp;',
'APEX_UTIL.REDIRECT_URL(:p4_url);',
'apex_application.stop_apex_engine;',
'end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
prompt --application/pages/page_00005
begin
wwv_flow_api.create_page(
 p_id=>5
,p_user_interface_id=>wwv_flow_api.id(19235660911620554)
,p_name=>'Infos'
,p_page_mode=>'MODAL'
,p_step_title=>'Infos'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'DEMO'
,p_last_upd_yyyymmddhh24miss=>'20191023150431'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19383338715100805)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(19157096164620456)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19383422301100806)
,p_name=>'P5_TOKEN'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(19383338715100805)
,p_item_default=>'GTOKEN'
,p_item_default_type=>'ITEM'
,p_prompt=>'Token'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(19212048692620493)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
end;
/
prompt --application/pages/page_00006
begin
wwv_flow_api.create_page(
 p_id=>6
,p_user_interface_id=>wwv_flow_api.id(19235660911620554)
,p_name=>'Playlists'
,p_step_title=>'Playlists'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ORDS_PUBLIC_USER'
,p_last_upd_yyyymmddhh24miss=>'20191025111717'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19419083047966255)
,p_plug_name=>'Playlists'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(19155944385620455)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_location=>'WEB_SOURCE'
,p_web_src_module_id=>wwv_flow_api.id(19415804362951757)
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWNUM NUM,',
'ID,',
'       FANS,',
'       LINK,',
'       TYPE,',
'       TITLE,',
'       PUBLIC_,',
'       ID2,',
'       NAME,',
'       TYPE2,',
'       TRACKLIST,',
'       PICTURE,',
'       CHECKSUM,',
'       TO_CHAR (TRUNC (SYSDATE) + NUMTODSINTERVAL (DURATION, ''second''),',
'                ''hh24:mi:ss''',
'               ) DUR,',
'       DURATION,',
'       TIME_ADD,',
'       TIME_MOD,',
'       NB_TRACKS,',
'       TRACKLIST2,',
'       PICTURE_XL,',
'       PICTURE_BIG,',
'       COLLABORATIVE,',
'       CREATION_DATE,',
'       PICTURE_SMALL,',
'       IS_LOVED_TRACK,',
'       PICTURE_MEDIUM',
'  from #APEX$SOURCE_DATA#'))
,p_source_post_processing=>'SQL'
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(19419172341966255)
,p_name=>'Playlists'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_report_saving=>'N'
,p_show_nulls_as=>'-'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_rows_per_page=>'N'
,p_show_computation=>'N'
,p_show_aggregate=>'N'
,p_show_chart=>'N'
,p_show_group_by=>'N'
,p_show_pivot=>'N'
,p_show_flashback=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF'
,p_download_filename=>'playlists'
,p_csv_output_separator=>';'
,p_csv_output_enclosed_by=>'"'
,p_icon_view_enabled_yn=>'Y'
,p_icon_view_link_column=>'LINK'
,p_icon_view_img_src_column=>'PICTURE_MEDIUM'
,p_icon_view_label_column=>'TITLE'
,p_icon_view_columns_per_row=>6
,p_owner=>'DEMO'
,p_internal_uid=>19419172341966255
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19419562027966259)
,p_db_column_name=>'ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19419971146966260)
,p_db_column_name=>'FANS'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Fans'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19420354285966261)
,p_db_column_name=>'LINK'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Link'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19420793143966261)
,p_db_column_name=>'TYPE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19421196338966261)
,p_db_column_name=>'TITLE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Title'
,p_column_link=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:RP,2:P2_ID,P2_TITLE,P2_OFFSET,P2_LIMIT:#ID#,#TITLE#,1,200'
,p_column_linktext=>'#TITLE#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19421599044966261)
,p_db_column_name=>'PUBLIC_'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Public '
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19421973449966262)
,p_db_column_name=>'ID2'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Id2'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19422318168966262)
,p_db_column_name=>'NAME'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Author'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19422730516966262)
,p_db_column_name=>'TYPE2'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Type2'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19423107582966262)
,p_db_column_name=>'TRACKLIST'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Tracklist'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19423561388966263)
,p_db_column_name=>'PICTURE'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Picture'
,p_column_html_expression=>'<a HREF="#LINK#"><img src="#PICTURE_SMALL#"></a>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19423908355966263)
,p_db_column_name=>'CHECKSUM'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Checksum'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19424714672966263)
,p_db_column_name=>'TIME_ADD'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Time Add'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19425110029966264)
,p_db_column_name=>'TIME_MOD'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Time Mod'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19425590976966264)
,p_db_column_name=>'NB_TRACKS'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Nb Tracks'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19425947272966264)
,p_db_column_name=>'TRACKLIST2'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Tracklist2'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19426301523966265)
,p_db_column_name=>'PICTURE_XL'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Picture Xl'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19426676752966265)
,p_db_column_name=>'PICTURE_BIG'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Picture Big'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19427097563966265)
,p_db_column_name=>'COLLABORATIVE'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Collaborative'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19427430213966265)
,p_db_column_name=>'CREATION_DATE'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Creation Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19427824856966266)
,p_db_column_name=>'PICTURE_SMALL'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Picture Small'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19428269716966266)
,p_db_column_name=>'IS_LOVED_TRACK'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Is Loved Track'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19428602906966266)
,p_db_column_name=>'PICTURE_MEDIUM'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Picture Medium'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19387582260100847)
,p_db_column_name=>'DURATION'
,p_display_order=>34
,p_column_identifier=>'Z'
,p_column_label=>'Duration'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19387785671100849)
,p_db_column_name=>'DUR'
,p_display_order=>44
,p_column_identifier=>'AB'
,p_column_label=>'Duration h'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19387828864100850)
,p_db_column_name=>'NUM'
,p_display_order=>54
,p_column_identifier=>'AC'
,p_column_label=>'#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(19439866100253134)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'REPORT'
,p_report_alias=>'194399'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100
,p_view_mode=>'REPORT'
,p_report_columns=>'NUM:TITLE:NB_TRACKS:NAME:CREATION_DATE:DUR:PICTURE:'
);
wwv_flow_api.create_web_source_comp_param(
 p_id=>wwv_flow_api.id(19429171632966269)
,p_page_id=>6
,p_web_src_param_id=>wwv_flow_api.id(19416541849951759)
,p_page_plug_id=>wwv_flow_api.id(19419083047966255)
,p_value_type=>'ITEM'
,p_value=>'GTOKEN'
);
end;
/
prompt --application/pages/page_09999
begin
wwv_flow_api.create_page(
 p_id=>9999
,p_user_interface_id=>wwv_flow_api.id(19235660911620554)
,p_name=>'Login Page'
,p_alias=>'LOGIN_DESKTOP'
,p_step_title=>'myDeezer - Sign In'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(19113495258620423)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'DEMO'
,p_last_upd_yyyymmddhh24miss=>'20191022131629'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19240336203620615)
,p_plug_name=>'myDeezer'
,p_icon_css_classes=>'app-icon'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(19156553245620455)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19245082876620631)
,p_plug_name=>'Language Selector'
,p_parent_plug_id=>wwv_flow_api.id(19240336203620615)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(19131823225620443)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>'apex_lang.emit_language_selector_list;'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_num_rows=>15
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(19243182710620629)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(19240336203620615)
,p_button_name=>'LOGIN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(19213196014620497)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Sign In'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_alignment=>'LEFT'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19240782070620618)
,p_name=>'P9999_USERNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(19240336203620615)
,p_prompt=>'username'
,p_placeholder=>'username'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(19211772741620491)
,p_item_icon_css_classes=>'fa-user'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19241164210620621)
,p_name=>'P9999_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(19240336203620615)
,p_prompt=>'password'
,p_placeholder=>'password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(19211772741620491)
,p_item_icon_css_classes=>'fa-key'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19242210559620625)
,p_name=>'P9999_REMEMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(19240336203620615)
,p_prompt=>'Remember username'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'LOGIN_REMEMBER_USERNAME'
,p_lov=>'.'||wwv_flow_api.id(19241440366620621)||'.'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(19211772741620491)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'If you select this checkbox, the application will save your username in a persistent browser cookie named "LOGIN_USERNAME_COOKIE".',
'When you go to the login page the next time,',
'the username field will be automatically populated with this value.',
'</p>',
'<p>',
'If you deselect this checkbox and your username is already saved in the cookie,',
'the application will overwrite it with an empty value.',
'You can also use your browser''s developer tools to completely remove the cookie.',
'</p>'))
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(19243901916620630)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Username Cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_authentication.send_login_username_cookie (',
'    p_username => lower(:P9999_USERNAME),',
'    p_consent  => :P9999_REMEMBER = ''Y'' );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(19243551142620630)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Login'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_authentication.login(',
'    p_username => :P9999_USERNAME,',
'    p_password => :P9999_PASSWORD );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(19244702462620631)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(19244393987620630)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P9999_USERNAME := apex_authentication.get_login_username_cookie;',
':P9999_REMEMBER := case when :P9999_USERNAME is not null then ''Y'' end;'))
);
end;
/
prompt --application/pages/page_10000
begin
wwv_flow_api.create_page(
 p_id=>10000
,p_user_interface_id=>wwv_flow_api.id(19235660911620554)
,p_name=>'Administration'
,p_alias=>'ADMIN'
,p_step_title=>'Administration'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(19239434542620600)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(19238552167620591)
,p_deep_linking=>'N'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>The administration page allows application owners (Administrators) to configure the application and maintain common data used across the application.',
'By selecting one of the available settings, administrators can potentially change how the application is displayed and/or features available to the end users.</p>',
'<p>Access to this page should be limited to Administrators only.</p>'))
,p_last_updated_by=>'DEMO'
,p_last_upd_yyyymmddhh24miss=>'20191024140753'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19283712891620709)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(19166411098620460)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(19106776380620394)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(19214590506620499)
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19285038160620710)
,p_plug_name=>'Column 2'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(19132053238620443)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19285498547620710)
,p_plug_name=>'Feedback'
,p_parent_plug_id=>wwv_flow_api.id(19285038160620710)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(19157096164620456)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_num_rows=>15
,p_required_patch=>wwv_flow_api.id(19237283839620589)
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(19285800085620711)
,p_name=>'Report'
,p_parent_plug_id=>wwv_flow_api.id(19285498547620710)
,p_template=>wwv_flow_api.id(19157096164620456)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--stacked:t-Region--scrollBody:t-Region--noPadding'
,p_component_template_options=>'#DEFAULT#:t-AVPList--rightAligned'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select l.display_value feedback_status, ',
'(select count(*) from apex_team_feedback f where f.application_id = :APP_ID and f.feedback_status = l.return_value) feedback_count ',
'from apex_application_lov_entries l',
'where l.application_id = :APP_ID',
'and l.list_of_values_name = ''FEEDBACK_STATUS''',
'order by 2 desc, 1'))
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(19181987399620470)
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_no_data_found=>'no data found'
,p_query_row_count_max=>500
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(19286508681620720)
,p_query_column_id=>1
,p_column_alias=>'FEEDBACK_STATUS'
,p_column_display_sequence=>1
,p_column_heading=>'Feedback Status'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(19286935915620721)
,p_query_column_id=>2
,p_column_alias=>'FEEDBACK_COUNT'
,p_column_display_sequence=>2
,p_column_heading=>'Feedback Count'
,p_column_format=>'999G999G999G999G999G999G990'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19288827042620729)
,p_plug_name=>'Feedback'
,p_parent_plug_id=>wwv_flow_api.id(19285498547620710)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:u-colors'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(19131823225620443)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(19284392209620710)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(19199145658620484)
,p_plug_query_num_rows=>15
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19537335184209035)
,p_plug_name=>'Activity Reports'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:u-colors'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(19157096164620456)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(19535076824209033)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(19199145658620484)
,p_plug_query_num_rows=>15
,p_required_patch=>wwv_flow_api.id(19480732381208923)
);
end;
/
prompt --application/pages/page_10010
begin
wwv_flow_api.create_page(
 p_id=>10010
,p_user_interface_id=>wwv_flow_api.id(19235660911620554)
,p_name=>'Feedback'
,p_page_mode=>'MODAL'
,p_step_title=>'Feedback'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(19239434542620600)
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.feedback-positive, .feedback-negative, .feedback-neutral { padding: 8px; border-radius: 100%; background-color: white; margin: 4px; }',
'.feedback-positive { color: #4caf50; }',
'.feedback-neutral { color: #eb9f41; }',
'.feedback-negative { color: #f44336; }'))
,p_required_patch=>wwv_flow_api.id(19237283839620589)
,p_dialog_width=>'480'
,p_dialog_chained=>'N'
,p_last_updated_by=>'DEMO'
,p_last_upd_yyyymmddhh24miss=>'20191022131629'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19247740385620650)
,p_plug_name=>'Form Items Region'
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(19131823225620443)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19247871375620650)
,p_plug_name=>'Buttons Region'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(19132834427620444)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(19247985938620650)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(19247871375620650)
,p_button_name=>'SUBMIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_api.id(19213196014620497)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Submit Feedback'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(19248059092620650)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(19247871375620650)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(19213196014620497)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(19256675659620662)
,p_branch_name=>'success'
,p_branch_action=>'f?p=&APP_ID.:10011:&SESSION.::&DEBUG.:RP::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19251459087620654)
,p_name=>'P10010_APPLICATION_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(19247740385620650)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19251898322620654)
,p_name=>'P10010_PAGE_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(19247740385620650)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19252272038620654)
,p_name=>'P10010_USER_AGENT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(19247740385620650)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select sys.owa_util.get_cgi_env(''user-agent'') x',
'from dual'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19252600731620655)
,p_name=>'P10010_RATING'
,p_item_sequence=>35
,p_item_plug_id=>wwv_flow_api.id(19247740385620650)
,p_prompt=>'Experience'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'FEEDBACK_RATING'
,p_lov=>'.'||wwv_flow_api.id(19252741505620655)||'.'
,p_field_template=>wwv_flow_api.id(19212048692620493)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--radioButtonGroup'
,p_lov_display_extra=>'NO'
,p_escape_on_http_output=>'N'
,p_attribute_01=>'3'
,p_attribute_02=>'NONE'
,p_attribute_03=>'Y'
,p_attribute_04=>'VERTICAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19254508359620657)
,p_name=>'P10010_FEEDBACK'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(19247740385620650)
,p_prompt=>'Feedback'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>4
,p_field_template=>wwv_flow_api.id(19212048692620493)
,p_lov_display_extra=>'NO'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(19256200820620659)
,p_validation_name=>'At least One Feedback Required'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P10010_FEEDBACK is null and :P10010_RATING is null then',
'    return false;',
'else',
'    return true;',
'end if;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Please provide feedback or your experience.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(19248128628620650)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(19248059092620650)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19255391756620658)
,p_event_id=>wwv_flow_api.id(19248128628620650)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(19255836823620659)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Submit Feedback'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'apex_util.submit_feedback (',
'    p_comment              => :P10010_FEEDBACK,',
'    p_application_id       => :APP_ID,',
'    p_page_id              => :P10010_PAGE_ID,',
'    p_rating               => :P10010_RATING',
'',
' );',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(19247985938620650)
,p_process_success_message=>'Feedback Submitted'
);
end;
/
prompt --application/pages/page_10011
begin
wwv_flow_api.create_page(
 p_id=>10011
,p_user_interface_id=>wwv_flow_api.id(19235660911620554)
,p_name=>'Feedback Submitted'
,p_page_mode=>'MODAL'
,p_step_title=>'Feedback'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(19239434542620600)
,p_required_patch=>wwv_flow_api.id(19237283839620589)
,p_last_updated_by=>'DEMO'
,p_last_upd_yyyymmddhh24miss=>'20191022131629'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19248310909620650)
,p_plug_name=>'Feedback Submitted'
,p_icon_css_classes=>'fa-check-circle'
,p_region_template_options=>'#DEFAULT#:t-Alert--wizard:t-Alert--customIcons:t-Alert--success'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(19128129091620433)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(19248286516620650)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(19248310909620650)
,p_button_name=>'CLOSE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(19213196014620497)
,p_button_image_alt=>'Close'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_css_classes=>'w40p'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(19248474348620650)
,p_name=>'Close Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(19248286516620650)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19258271457620664)
,p_event_id=>wwv_flow_api.id(19248474348620650)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
end;
/
prompt --application/pages/page_10013
begin
wwv_flow_api.create_page(
 p_id=>10013
,p_user_interface_id=>wwv_flow_api.id(19235660911620554)
,p_name=>'Manage Feedback'
,p_page_mode=>'MODAL'
,p_step_title=>'Manage Feedback'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(19239434542620600)
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Color feedback rating icons */',
'.feedback-positive { color: #4caf50; }',
'.feedback-neutral { color: #eb9f41; }',
'.feedback-negative { color: #f44336; }'))
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch:t-Dialog--noPadding'
,p_required_role=>wwv_flow_api.id(19238552167620591)
,p_required_patch=>wwv_flow_api.id(19237283839620589)
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Feedback can be entered by end users from any normal page within the application.</p>',
'<p>This report shows the feedback entered, any response enter by administrators, and the status of the feedback.</p>',
'<p>Click the edit icon (yellow pencil) to enter a response or update the feedback status.</p>',
'<p><em><strong>Note:</strong> If feedback recipients have been defined then feedback submissions will also be emailed to the email addresses in the feedback recipients list.</em></p>'))
,p_last_updated_by=>'DEMO'
,p_last_upd_yyyymmddhh24miss=>'20191022131630'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19249860444620650)
,p_plug_name=>'Manage Feedback'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_api.id(19155944385620455)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select feedback_id id,',
'    page_id||''. ''||page_name page_name,',
'    created_on created,',
'    lower(created_by) created_by,',
'    feedback,',
'    feedback_rating rating,',
'    case feedback_rating',
'      when 1 then ''fa-frown-o feedback-negative'' ',
'      when 2 then ''fa-emoji-neutral feedback-neutral''  ',
'      when 3 then ''fa-smile-o feedback-positive''',
'    end rating_icon,',
'    feedback_status status,',
'    public_response response,',
'    http_user_agent user_agent,',
'    updated_on updated,',
'    lower(updated_by) updated_by,',
'    page_id',
'',
'',
'',
'',
'from apex_team_feedback f',
'where application_id = :APP_ID'))
,p_plug_source_type=>'NATIVE_IR'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(19269291411620673)
,p_name=>'Manage Feedback'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:10014:&APP_SESSION.::::P10014_ID:#ID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'DEMO'
,p_internal_uid=>19269291411620673
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19269336637620684)
,p_db_column_name=>'ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19269785841620687)
,p_db_column_name=>'PAGE_NAME'
,p_display_order=>11
,p_column_identifier=>'B'
,p_column_label=>'Application Page'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19270102400620687)
,p_db_column_name=>'CREATED'
,p_display_order=>21
,p_column_identifier=>'C'
,p_column_label=>'Filed'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'since'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19270573911620688)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>31
,p_column_identifier=>'D'
,p_column_label=>'Filed By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19270914295620688)
,p_db_column_name=>'FEEDBACK'
,p_display_order=>41
,p_column_identifier=>'E'
,p_column_label=>'Feedback'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19271383020620688)
,p_db_column_name=>'RATING'
,p_display_order=>51
,p_column_identifier=>'F'
,p_column_label=>'Rating'
,p_column_html_expression=>'<span class="fa #RATING_ICON#" aria-hidden="true" title="#RATING#"></span>'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_api.id(19252741505620655)
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19272034010620692)
,p_db_column_name=>'RATING_ICON'
,p_display_order=>55
,p_column_identifier=>'G'
,p_column_label=>'RATING ICON'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19272413092620692)
,p_db_column_name=>'STATUS'
,p_display_order=>61
,p_column_identifier=>'H'
,p_column_label=>'Status'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_api.id(19262950304620668)
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19272876606620692)
,p_db_column_name=>'RESPONSE'
,p_display_order=>71
,p_column_identifier=>'I'
,p_column_label=>'Response'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19273263030620693)
,p_db_column_name=>'USER_AGENT'
,p_display_order=>81
,p_column_identifier=>'J'
,p_column_label=>'User Agent'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19273630693620693)
,p_db_column_name=>'UPDATED'
,p_display_order=>91
,p_column_identifier=>'K'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'since'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19274041418620693)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>101
,p_column_identifier=>'L'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19274432484620694)
,p_db_column_name=>'PAGE_ID'
,p_display_order=>111
,p_column_identifier=>'M'
,p_column_label=>'Page'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(19275120109620695)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'192752'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PAGE_NAME:CREATED:CREATED_BY:FEEDBACK:RATING:STATUS:RESPONSE:UPDATED:UPDATED_BY'
,p_sort_column_1=>'UPDATED'
,p_sort_direction_1=>'DESC'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(19276022670620697)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(19249860444620650)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(19213236022620498)
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:&APP_PAGE_ID.,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(19249787162620650)
,p_name=>'Refresh on Dialog Close'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(19249860444620650)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19277340269620700)
,p_event_id=>wwv_flow_api.id(19249787162620650)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(19249860444620650)
,p_stop_execution_on_error=>'Y'
);
end;
/
prompt --application/pages/page_10014
begin
wwv_flow_api.create_page(
 p_id=>10014
,p_user_interface_id=>wwv_flow_api.id(19235660911620554)
,p_name=>'Feedback'
,p_page_mode=>'MODAL'
,p_step_title=>'Feedback'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(19239434542620600)
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Color feedback rating icons */',
'.feedback-positive { color: #4caf50; }',
'.feedback-neutral { color: #eb9f41; }',
'.feedback-negative { color: #f44336; }'))
,p_required_role=>wwv_flow_api.id(19238552167620591)
,p_required_patch=>wwv_flow_api.id(19237283839620589)
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_last_updated_by=>'DEMO'
,p_last_upd_yyyymmddhh24miss=>'20191022131630'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19249114303620650)
,p_plug_name=>'Form Items Region'
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(19131823225620443)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19249286136620650)
,p_plug_name=>'Buttons Region'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(19132834427620444)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(19249310598620650)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(19249286136620650)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_api.id(19213196014620497)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(19249499512620650)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(19249286136620650)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(19213196014620497)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(19249599086620650)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(19249286136620650)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>wwv_flow_api.id(19213196014620497)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_condition=>'P10014_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19260450792620666)
,p_name=>'P10014_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(19249114303620650)
,p_display_as=>'NATIVE_HIDDEN'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19260820394620667)
,p_name=>'P10014_PAGE_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(19249114303620650)
,p_prompt=>'Page'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(19212048692620493)
,p_lov_display_extra=>'NO'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19261208659620667)
,p_name=>'P10014_FILED'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(19249114303620650)
,p_prompt=>'Filed'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(19212048692620493)
,p_lov_display_extra=>'NO'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19261610610620667)
,p_name=>'P10014_RATING_ICON'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(19249114303620650)
,p_prompt=>'Rating'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(19212048692620493)
,p_lov_display_extra=>'NO'
,p_escape_on_http_output=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19262074172620668)
,p_name=>'P10014_FEEDBACK'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(19249114303620650)
,p_prompt=>'Feedback'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(19212048692620493)
,p_lov_display_extra=>'NO'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19262402791620668)
,p_name=>'P10014_RESPONSE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(19249114303620650)
,p_prompt=>'Response'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>4
,p_field_template=>wwv_flow_api.id(19212048692620493)
,p_lov_display_extra=>'NO'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19262824859620668)
,p_name=>'P10014_FEEDBACK_STATUS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(19249114303620650)
,p_prompt=>'Status'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'FEEDBACK_STATUS'
,p_lov=>'.'||wwv_flow_api.id(19262950304620668)||'.'
,p_field_template=>wwv_flow_api.id(19212048692620493)
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19265159023620670)
,p_name=>'P10014_USER_AGENT'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(19249114303620650)
,p_prompt=>'User Agent'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(19212048692620493)
,p_lov_display_extra=>'NO'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(19249653263620650)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(19249499512620650)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19265984460620670)
,p_event_id=>wwv_flow_api.id(19249653263620650)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(19266412809620670)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load Data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'for c1 in (',
'   select page_id,',
'          page_name,',
'          case feedback_rating',
'                when 1 then ''<span class="fa fa-frown-o feedback-negative" aria-hidden="true" title="Negative"></span>'' ',
'                when 2 then ''<span class="fa fa-emoji-neutral feedback-neutral" aria-hidden="true" title="Neutral"></span>''  ',
'                when 3 then ''<span class="fa fa-smile-o feedback-positive" aria-hidden="true" title="Positive"></span>'' ',
'                end rating_icon,',
'          lower(created_by) || '' - '' || apex_util.get_since(created_on) filed,',
'          feedback,',
'          public_response,',
'          feedback_status,',
'          http_user_agent',
'     from apex_team_feedback',
'    where feedback_id = :P10014_ID',
') loop',
'   :P10014_PAGE_ID := c1.page_id||''. ''||c1.page_name;',
'   :P10014_FILED := c1.filed;',
'   :P10014_RATING_ICON := c1.rating_icon;',
'   :P10014_FEEDBACK := c1.feedback;',
'   :P10014_RESPONSE := c1.public_response;',
'   :P10014_FEEDBACK_STATUS := c1.feedback_status;',
'   :P10014_USER_AGENT := c1.http_user_agent;',
'end loop;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(19266827652620671)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Update'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_util.reply_to_feedback (',
'    p_feedback_id        => :P10014_ID,',
'    p_status             => :P10014_FEEDBACK_STATUS,',
'    p_public_response    => :P10014_RESPONSE );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(19249310598620650)
,p_process_success_message=>'Action Processed.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(19267242875620671)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_util.delete_feedback (',
'    p_feedback_id        => :P10014_ID );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(19249599086620650)
,p_process_success_message=>'Action Processed.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(19267649769620672)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'E.PROPERTY.BUTTON_ACTION.LOV.RESET.D'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(19249599086620650)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(19268062705620672)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
prompt --application/pages/page_10020
begin
wwv_flow_api.create_page(
 p_id=>10020
,p_user_interface_id=>wwv_flow_api.id(19235660911620554)
,p_name=>'About'
,p_alias=>'HELP'
,p_step_title=>'About'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(19239434542620600)
,p_required_patch=>wwv_flow_api.id(19237708892620589)
,p_help_text=>'All application help text can be accessed from this page. The links in the "Documentation" region give a much more in-depth explanation of the application''s features and functionality.'
,p_last_updated_by=>'DEMO'
,p_last_upd_yyyymmddhh24miss=>'20191023150142'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19278290383620702)
,p_plug_name=>'About Page'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--padded:t-ContentBlock--h1:t-ContentBlock--lightBG'
,p_plug_template=>wwv_flow_api.id(19147675423620451)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'MyDeezer V0.1',
'<br>',
'GPM Factory - 2019',
'<br>',
'Patrick Monaco'))
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
end;
/
prompt --application/pages/page_10021
begin
wwv_flow_api.create_page(
 p_id=>10021
,p_user_interface_id=>wwv_flow_api.id(19235660911620554)
,p_name=>'Help'
,p_alias=>'PAGE_HELP'
,p_page_mode=>'MODAL'
,p_step_title=>'Help'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_api.id(19237708892620589)
,p_dialog_chained=>'N'
,p_last_updated_by=>'DEMO'
,p_last_upd_yyyymmddhh24miss=>'20191022131630'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19278972955620703)
,p_plug_name=>'Search Dialog'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(19131823225620443)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'for c1 in ',
'(',
'    select page_title, help_text ',
'      from apex_application_pages',
'     where page_id = :P10021_PAGE_ID ',
'       and application_id = :APP_ID',
')',
'loop',
'    if c1.help_text is null then',
'        sys.htp.p(''No help is available for this page.'');',
'    else',
'        if substr(c1.help_text, 1, 3) != ''<p>'' then',
'            sys.htp.p(''<p>'');',
'        end if;',
'',
'        sys.htp.p(apex_application.do_substitutions(c1.help_text));',
'',
'        if substr(trim(c1.help_text), -4) != ''</p>'' then',
'            sys.htp.p(''</p>'');',
'        end if;',
'    end if;',
'end loop;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_num_rows=>15
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19279316485620703)
,p_name=>'P10021_PAGE_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(19278972955620703)
,p_display_as=>'NATIVE_HIDDEN'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'Y'
);
end;
/
prompt --application/pages/page_10030
begin
wwv_flow_api.create_page(
 p_id=>10030
,p_user_interface_id=>wwv_flow_api.id(19235660911620554)
,p_name=>'Activity Dashboard'
,p_alias=>'DASHBOARD'
,p_page_mode=>'MODAL'
,p_step_title=>'Activity Dashboard'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_required_patch=>wwv_flow_api.id(19480732381208923)
,p_last_updated_by=>'DEMO'
,p_last_upd_yyyymmddhh24miss=>'20191024140753'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19480951305208926)
,p_plug_name=>'Hourly Page Events'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h320:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(19157096164620456)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(19481059626208926)
,p_region_id=>wwv_flow_api.id(19480951305208926)
,p_chart_type=>'bar'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_time_axis_type=>'enabled'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(19483196288208931)
,p_chart_id=>wwv_flow_api.id(19481059626208926)
,p_seq=>10
,p_name=>'Series 1'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with nw as (',
'    -- APEX_ACTIVITY_LOG uses dates; convert system time to local time zone.',
'    select from_tz( cast( sysdate as timestamp ), to_char( systimestamp, ''TZR'' ) ) at local as tm from dual',
'),',
'window as (',
'    select',
'         trunc(nw.tm - ((level-1)/24),''HH'') start_tm,',
'         trunc(nw.tm - ((level-2)/24),''HH'') end_tm,',
'         trunc(sysdate-((level-1)/24),''HH'') log_start_tm,',
'         trunc(sysdate-((level-2)/24),''HH'') log_end_tm',
'    from nw',
'    connect by level <= round( 24 * ( 1/24/60/60 * nvl(:P10030_TIMEFRAME,1) ) )',
')',
'select  w.start_tm log_time,',
'    (   select count(*)',
'        from apex_activity_log l',
'        where l.flow_id = :app_id',
'            and l.time_stamp between w.log_start_tm and w.log_end_tm ) as value',
'from window w',
'order by 1'))
,p_max_row_count=>350
,p_ajax_items_to_submit=>'P10030_TIMEFRAME'
,p_items_value_column_name=>'VALUE'
,p_items_label_column_name=>'LOG_TIME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(19483713469208933)
,p_chart_id=>wwv_flow_api.id(19481059626208926)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(19484320724208934)
,p_chart_id=>wwv_flow_api.id(19481059626208926)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_type=>'datetime-short'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'on'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19481110734208926)
,p_plug_name=>'Most Active Pages'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h320:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(19157096164620456)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(19481256436208926)
,p_region_id=>wwv_flow_api.id(19481110734208926)
,p_chart_type=>'bar'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'horizontal'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(19488112377208937)
,p_chart_id=>wwv_flow_api.id(19481256436208926)
,p_seq=>10
,p_name=>'Series 1'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select x.step_id||''. ''||(select page_name from apex_application_pages p where p.application_id = :app_id and page_id = x.step_id) label, ',
'        value ',
'from',
'(',
'select step_id,',
'    count(*) as value',
'from apex_activity_log',
'where flow_id = :app_id',
'    and time_stamp >= sysdate - ( 1/24/60/60 * :P10030_TIMEFRAME )',
'    and step_id is not null',
'group by step_id',
'order by 2 desc',
') x'))
,p_max_row_count=>10
,p_ajax_items_to_submit=>'P10030_TIMEFRAME'
,p_items_value_column_name=>'VALUE'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(19488797330208937)
,p_chart_id=>wwv_flow_api.id(19481256436208926)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(19489374643208938)
,p_chart_id=>wwv_flow_api.id(19481256436208926)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19481382029208926)
,p_plug_name=>'Top Users'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h320:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(19157096164620456)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(19481443798208926)
,p_region_id=>wwv_flow_api.id(19481382029208926)
,p_chart_type=>'bar'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'horizontal'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(19485645906208935)
,p_chart_id=>wwv_flow_api.id(19481443798208926)
,p_seq=>10
,p_name=>'Series 1'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl( userid_lc, apex_lang.message(''APEX.FEATURE.TOP_USERS.USERNAME.NOT_IDENTIFIED'') ) as label,',
'       count(*) as value',
'from apex_activity_log',
'where flow_id = :app_id',
'and time_stamp >= sysdate - ( 1/24/60/60 * :P10030_TIMEFRAME )',
'group by nvl( userid_lc, apex_lang.message(''APEX.FEATURE.TOP_USERS.USERNAME.NOT_IDENTIFIED'') )',
'order by 2 desc'))
,p_max_row_count=>10
,p_ajax_items_to_submit=>'P10030_TIMEFRAME'
,p_items_value_column_name=>'VALUE'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(19486205047208936)
,p_chart_id=>wwv_flow_api.id(19481443798208926)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(19486882422208936)
,p_chart_id=>wwv_flow_api.id(19481443798208926)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(19481506256208926)
,p_name=>'Recent Errors'
,p_template=>wwv_flow_api.id(19157096164620456)
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h240:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight:t-Report--inline'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    sqlerrm label,',
'    time_stamp value',
'from apex_activity_log',
'where flow_id = :app_id',
'and time_stamp >= sysdate - ( 1/24/60/60 * :P10030_TIMEFRAME )',
'and sqlerrm is not null',
'order by 2 desc, 1'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P10030_TIMEFRAME'
,p_query_row_template=>wwv_flow_api.id(19177373070620468)
,p_query_num_rows=>20
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'no data found'
,p_query_row_count_max=>500
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(19490452261208946)
,p_query_column_id=>1
,p_column_alias=>'LABEL'
,p_column_display_sequence=>1
,p_column_heading=>'Label'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(19490881897208946)
,p_query_column_id=>2
,p_column_alias=>'VALUE'
,p_column_display_sequence=>2
,p_column_heading=>'Value'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(19481644024208926)
,p_name=>'Latest Activity'
,p_template=>wwv_flow_api.id(19157096164620456)
,p_display_sequence=>50
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h240:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight:t-Report--inline'
,p_new_grid_row=>false
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select userid_lc as username,',
'    max(time_stamp) as last_activity',
'from apex_activity_log',
'where flow_id = :app_id',
'    and time_stamp >= sysdate - ( 1/24/60/60 * :P10030_TIMEFRAME )',
'    and userid_lc is not null',
'group by userid_lc',
'order by 2 desc'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P10030_TIMEFRAME'
,p_query_row_template=>wwv_flow_api.id(19177373070620468)
,p_query_num_rows=>20
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No activities found'
,p_query_row_count_max=>500
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(19493689641208957)
,p_query_column_id=>1
,p_column_alias=>'USERNAME'
,p_column_display_sequence=>1
,p_column_heading=>'Username'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(19494005905208957)
,p_query_column_id=>2
,p_column_alias=>'LAST_ACTIVITY'
,p_column_display_sequence=>2
,p_column_heading=>'Last Activity'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19481752970208926)
,p_plug_name=>'Filters'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--slimPadding:t-ButtonRegion--noUI:t-Form--large'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(19132834427620444)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(19496388293208960)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(19480951305208926)
,p_button_name=>'VIEW_ACTIVITY_BY_USER'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(19212414192620495)
,p_button_image_alt=>'View Details'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:10031:&SESSION.::&DEBUG.:RP,10031::'
,p_icon_css_classes=>'fa-angle-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(19496799614208961)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(19481110734208926)
,p_button_name=>'VIEW_ACTIVITY_DETAILS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(19212414192620495)
,p_button_image_alt=>'View Details'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:10034:&SESSION.::&DEBUG.:RP,10034::'
,p_icon_css_classes=>'fa-angle-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(19497119380208961)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(19481382029208926)
,p_button_name=>'VIEW_ACTIVITY_BY_USER'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(19212414192620495)
,p_button_image_alt=>'View Details'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:10031:&SESSION.::&DEBUG.:RP,10031::'
,p_icon_css_classes=>'fa-angle-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(19497597297208961)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(19481506256208926)
,p_button_name=>'VIEW_RECENT_ERRORS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(19212414192620495)
,p_button_image_alt=>'View Details'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:10032:&SESSION.::&DEBUG.:RP,10032::'
,p_icon_css_classes=>'fa-angle-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19481817175208926)
,p_name=>'P10030_TIMEFRAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(19481752970208926)
,p_item_default=>'900'
,p_prompt=>'Timeframe'
,p_source=>'900'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'TIMEFRAME (4 WEEKS)'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select disp,',
'      val as seconds',
' from table( apex_util.get_timeframe_lov_data )',
'order by insert_order'))
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(19212048692620493)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(19481947243208926)
,p_name=>'Change Filters'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P10030_TIMEFRAME'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19499191345208964)
,p_event_id=>wwv_flow_api.id(19481947243208926)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(19480951305208926)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19499673536208965)
,p_event_id=>wwv_flow_api.id(19481947243208926)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(19481382029208926)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19500064880208965)
,p_event_id=>wwv_flow_api.id(19481947243208926)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(19481110734208926)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19500549033208965)
,p_event_id=>wwv_flow_api.id(19481947243208926)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(19481506256208926)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19501038988208965)
,p_event_id=>wwv_flow_api.id(19481947243208926)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(19481644024208926)
,p_stop_execution_on_error=>'Y'
);
end;
/
prompt --application/pages/page_10031
begin
wwv_flow_api.create_page(
 p_id=>10031
,p_user_interface_id=>wwv_flow_api.id(19235660911620554)
,p_name=>'Top Users'
,p_page_mode=>'MODAL'
,p_step_title=>'Top Users'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Remove padding around dialog page */',
'.hour-graph { display: table; width: 100%; }',
'span.hour { display: table-cell; padding: 0; font-size: 11px; text-align: center; background-color: #a6ffa6; min-width: 32px; }',
'span.hour.is-over1k { background-color: #7bdc7b; }',
'span.hour.is-null { background-color: #E0E0E0; }',
'span.hour-label { opacity: 0.5; }',
'span.hour-value { display: block; }'))
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch:t-Dialog--noPadding'
,p_required_patch=>wwv_flow_api.id(19480732381208923)
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Use this report and chart to see the users with the most page views for the specified timeframe.</p>',
'<p>Select the reporting timeframe (Default = 1 day) and choose between the report and chart icons at the top of the page.</p>',
'<p>For the interactive report, use the search field, or select the <strong>User</strong> column heading, to select a specific user. You can perform numerous functions by clicking the <strong>Actions</strong> button, such as columns displayed / hidden'
||', rows per page, filter, and so forth. Click the <strong>Reset</strong> button to reset the interactive report back to the default settings.</p>'))
,p_last_updated_by=>'DEMO'
,p_last_upd_yyyymmddhh24miss=>'20191024140753'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19524011657209005)
,p_plug_name=>'Top Users'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_api.id(19155944385620455)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select the_user,',
'    ''<div class="hour-graph">''||',
'        ''<span class="hour''|| case when h00 = 0 then '' is-null'' when h00 > 999 then '' is-over1k'' end ||''"><span class="hour-label"> 0</span> <span class="hour-value">''|| ',
'        case when h00 > 999 then to_char((h00/1000),''99999999D0'') ||''k'' else to_char(h00) end ||''</span></span>''||',
'        ''<span class="hour''|| case when h01 = 0 then '' is-null'' when h01 > 999 then '' is-over1k'' end ||''"><span class="hour-label"> 1</span> <span class="hour-value">''|| ',
'        case when h01 > 999 then to_char((h01/1000),''99999999D0'') ||''k'' else to_char(h01) end ||''</span></span>''||',
'        ''<span class="hour''|| case when h02 = 0 then '' is-null'' when h02 > 999 then '' is-over1k'' end ||''"><span class="hour-label"> 2</span> <span class="hour-value">''|| ',
'        case when h02 > 999 then to_char((h02/1000),''99999999D0'') ||''k'' else to_char(h02) end ||''</span></span>''||',
'        ''<span class="hour''|| case when h03 = 0 then '' is-null'' when h03 > 999 then '' is-over1k'' end ||''"><span class="hour-label"> 3</span> <span class="hour-value">''|| ',
'        case when h03 > 999 then to_char((h03/1000),''99999999D0'') ||''k'' else to_char(h03) end ||''</span></span>''||',
'        ''<span class="hour''|| case when h04 = 0 then '' is-null'' when h04 > 999 then '' is-over1k'' end ||''"><span class="hour-label"> 4</span> <span class="hour-value">''|| ',
'        case when h04 > 999 then to_char((h04/1000),''99999999D0'') ||''k'' else to_char(h04) end ||''</span></span>''||',
'        ''<span class="hour''|| case when h05 = 0 then '' is-null'' when h05 > 999 then '' is-over1k'' end ||''"><span class="hour-label"> 5</span> <span class="hour-value">''|| ',
'        case when h05 > 999 then to_char((h05/1000),''99999999D0'') ||''k'' else to_char(h05) end ||''</span></span>''||',
'        ''<span class="hour''|| case when h06 = 0 then '' is-null'' when h06 > 999 then '' is-over1k'' end ||''"><span class="hour-label"> 6</span> <span class="hour-value">''|| ',
'        case when h06 > 999 then to_char((h06/1000),''99999999D0'') ||''k'' else to_char(h06) end ||''</span></span>''||',
'        ''<span class="hour''|| case when h07 = 0 then '' is-null'' when h07 > 999 then '' is-over1k'' end ||''"><span class="hour-label"> 7</span> <span class="hour-value">''|| ',
'        case when h07 > 999 then to_char((h07/1000),''99999999D0'') ||''k'' else to_char(h07) end ||''</span></span>''||',
'        ''<span class="hour''|| case when h08 = 0 then '' is-null'' when h08 > 999 then '' is-over1k'' end ||''"><span class="hour-label"> 8</span> <span class="hour-value">''|| ',
'        case when h08 > 999 then to_char((h08/1000),''99999999D0'') ||''k'' else to_char(h08) end ||''</span></span>''||',
'        ''<span class="hour''|| case when h09 = 0 then '' is-null'' when h09 > 999 then '' is-over1k'' end ||''"><span class="hour-label"> 9</span> <span class="hour-value">''|| ',
'        case when h09 > 999 then to_char((h09/1000),''99999999D0'') ||''k'' else to_char(h09) end ||''</span></span>''||',
'        ''<span class="hour''|| case when h10 = 0 then '' is-null'' when h10 > 999 then '' is-over1k'' end ||''"><span class="hour-label">10</span> <span class="hour-value">''|| ',
'        case when h10 > 999 then to_char((h10/1000),''99999999D0'') ||''k'' else to_char(h10) end ||''</span></span>''||',
'        ''<span class="hour''|| case when h11 = 0 then '' is-null'' when h11 > 999 then '' is-over1k'' end ||''"><span class="hour-label">11</span> <span class="hour-value">''|| ',
'        case when h11 > 999 then to_char((h11/1000),''99999999D0'') ||''k'' else to_char(h11) end ||''</span></span>''||',
'        ''<span class="hour''|| case when h12 = 0 then '' is-null'' when h12 > 999 then '' is-over1k'' end ||''"><span class="hour-label">12</span> <span class="hour-value">''|| ',
'        case when h12 > 999 then to_char((h12/1000),''99999999D0'') ||''k'' else to_char(h12) end ||''</span></span>''||',
'        ''<span class="hour''|| case when h13 = 0 then '' is-null'' when h13 > 999 then '' is-over1k'' end ||''"><span class="hour-label">13</span> <span class="hour-value">''|| ',
'        case when h13 > 999 then to_char((h13/1000),''99999999D0'') ||''k'' else to_char(h13) end ||''</span></span>''||',
'        ''<span class="hour''|| case when h14 = 0 then '' is-null'' when h14 > 999 then '' is-over1k'' end ||''"><span class="hour-label">14</span> <span class="hour-value">''|| ',
'        case when h14 > 999 then to_char((h14/1000),''99999999D0'') ||''k'' else to_char(h14) end ||''</span></span>''||',
'        ''<span class="hour''|| case when h15 = 0 then '' is-null'' when h15 > 999 then '' is-over1k'' end ||''"><span class="hour-label">15</span> <span class="hour-value">''|| ',
'        case when h15 > 999 then to_char((h15/1000),''99999999D0'') ||''k'' else to_char(h15) end ||''</span></span>''||',
'        ''<span class="hour''|| case when h16 = 0 then '' is-null'' when h16 > 999 then '' is-over1k'' end ||''"><span class="hour-label">16</span> <span class="hour-value">''|| ',
'        case when h16 > 999 then to_char((h16/1000),''99999999D0'') ||''k'' else to_char(h16) end ||''</span></span>''||',
'        ''<span class="hour''|| case when h17 = 0 then '' is-null'' when h17 > 999 then '' is-over1k'' end ||''"><span class="hour-label">17</span> <span class="hour-value">''|| ',
'        case when h17 > 999 then to_char((h17/1000),''99999999D0'') ||''k'' else to_char(h17) end ||''</span></span>''||',
'        ''<span class="hour''|| case when h18 = 0 then '' is-null'' when h18 > 999 then '' is-over1k'' end ||''"><span class="hour-label">18</span> <span class="hour-value">''|| ',
'        case when h18 > 999 then to_char((h18/1000),''99999999D0'') ||''k'' else to_char(h18) end ||''</span></span>''||',
'        ''<span class="hour''|| case when h19 = 0 then '' is-null'' when h19 > 999 then '' is-over1k'' end ||''"><span class="hour-label">19</span> <span class="hour-value">''|| ',
'        case when h19 > 999 then to_char((h19/1000),''99999999D0'') ||''k'' else to_char(h19) end ||''</span></span>''||',
'        ''<span class="hour''|| case when h20 = 0 then '' is-null'' when h20 > 999 then '' is-over1k'' end ||''"><span class="hour-label">20</span> <span class="hour-value">''|| ',
'        case when h20 > 999 then to_char((h20/1000),''99999999D0'') ||''k'' else to_char(h20) end ||''</span></span>''||',
'        ''<span class="hour''|| case when h21 = 0 then '' is-null'' when h21 > 999 then '' is-over1k'' end ||''"><span class="hour-label">21</span> <span class="hour-value">''|| ',
'        case when h21 > 999 then to_char((h21/1000),''99999999D0'') ||''k'' else to_char(h21) end ||''</span></span>''||',
'        ''<span class="hour''|| case when h22 = 0 then '' is-null'' when h22 > 999 then '' is-over1k'' end ||''"><span class="hour-label">22</span> <span class="hour-value">''|| ',
'        case when h22 > 999 then to_char((h22/1000),''99999999D0'') ||''k'' else to_char(h22) end ||''</span></span>''||',
'        ''<span class="hour''|| case when h23 = 0 then '' is-null'' when h23 > 999 then '' is-over1k'' end ||''"><span class="hour-label">23</span> <span class="hour-value">''|| ',
'        case when h23 > 999 then to_char((h23/1000),''99999999D0'') ||''k'' else to_char(h23) end ||''</span></span>''||',
'        ''</div>'' hours,',
'        page_events,',
'    median_elapsed,',
'    rows_fetched,',
'    ir_searches,',
'    errors,',
'    most_recent',
'    from (  ',
'    select userid_lc                    as the_user,',
'        count(*)                        as page_events,',
'        median(elap)                    as median_elapsed,',
'        sum(num_rows)                   as rows_fetched,',
'        sum(decode(ir_search,null,0,1)) as ir_searches,',
'        sum(decode(sqlerrm,null,0,1))   as errors,',
'        max(time_stamp)                 as most_recent,',
'        sum(decode(to_char(time_stamp,''HH24''),0,1,0)) h00,',
'        sum(decode(to_char(time_stamp,''HH24''),1,1,0)) h01,',
'        sum(decode(to_char(time_stamp,''HH24''),2,1,0)) h02,',
'        sum(decode(to_char(time_stamp,''HH24''),3,1,0)) h03,',
'        sum(decode(to_char(time_stamp,''HH24''),4,1,0)) h04,',
'        sum(decode(to_char(time_stamp,''HH24''),5,1,0)) h05,',
'        sum(decode(to_char(time_stamp,''HH24''),6,1,0)) h06,',
'        sum(decode(to_char(time_stamp,''HH24''),7,1,0)) h07,',
'        sum(decode(to_char(time_stamp,''HH24''),8,1,0)) h08,',
'        sum(decode(to_char(time_stamp,''HH24''),9,1,0)) h09,',
'        sum(decode(to_char(time_stamp,''HH24''),10,1,0)) h10,',
'        sum(decode(to_char(time_stamp,''HH24''),11,1,0)) h11,',
'        sum(decode(to_char(time_stamp,''HH24''),12,1,0)) h12,',
'        sum(decode(to_char(time_stamp,''HH24''),13,1,0)) h13,',
'        sum(decode(to_char(time_stamp,''HH24''),14,1,0)) h14,',
'        sum(decode(to_char(time_stamp,''HH24''),15,1,0)) h15,',
'        sum(decode(to_char(time_stamp,''HH24''),16,1,0)) h16,',
'        sum(decode(to_char(time_stamp,''HH24''),17,1,0)) h17,',
'        sum(decode(to_char(time_stamp,''HH24''),18,1,0)) h18,',
'        sum(decode(to_char(time_stamp,''HH24''),19,1,0)) h19,',
'        sum(decode(to_char(time_stamp,''HH24''),20,1,0)) h20,',
'        sum(decode(to_char(time_stamp,''HH24''),21,1,0)) h21,',
'        sum(decode(to_char(time_stamp,''HH24''),22,1,0)) h22,',
'        sum(decode(to_char(time_stamp,''HH24''),23,1,0)) h23',
'    from apex_activity_log l',
'    where flow_id = :APP_ID',
'        and time_stamp >= sysdate - ( 1/24/60/60 * :P10031_TIMEFRAME )',
'        and userid is not null',
'    group by userid_lc) x'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P10031_TIMEFRAME'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P10031_VIEW_AS'
,p_plug_display_when_cond2=>'REPORT'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(19525457491209008)
,p_name=>'Top Users'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'DEMO'
,p_internal_uid=>19525457491209008
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19525595932209013)
,p_db_column_name=>'THE_USER'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19525932397209015)
,p_db_column_name=>'HOURS'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Activity by Hour'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19526363180209016)
,p_db_column_name=>'PAGE_EVENTS'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Page Events'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19526775821209018)
,p_db_column_name=>'MEDIAN_ELAPSED'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Median Elapsed'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990D0000'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19527138877209020)
,p_db_column_name=>'ROWS_FETCHED'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Rows Fetched'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19527541091209021)
,p_db_column_name=>'IR_SEARCHES'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'IR Searches'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19527954025209022)
,p_db_column_name=>'ERRORS'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Errors'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19528392544209024)
,p_db_column_name=>'MOST_RECENT'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Most_Recent'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(19529020946209026)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'195291'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'THE_USER:HOURS:PAGE_EVENTS'
,p_sort_column_1=>'PAGE_EVENTS'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'MOST_RECENT'
,p_sort_direction_2=>'DESC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19524152892209005)
,p_plug_name=>'Button Bar'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--slimPadding:t-ButtonRegion--noUI:t-Form--large'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(19132834427620444)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_query_type=>'SQL'
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19524382311209005)
,p_plug_name=>'Top Users Chart'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(19131823225620443)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P10031_VIEW_AS'
,p_plug_display_when_cond2=>'CHART'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(19524408140209005)
,p_region_id=>wwv_flow_api.id(19524382311209005)
,p_chart_type=>'donut'
,p_height=>'600'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>.02
,p_pie_selection_effect=>'highlight'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ){ ',
'',
'    this.pieSliceLabel = function(dataContext) {',
'        var series_name,',
'            percent = Math.round(dataContext.value/dataContext.totalValue*100);',
'        ',
'        if ( dataContext.seriesData ) {',
'            series_name = dataContext.seriesData.name;',
'        } else {',
'            series_name = ''Other'';',
'        }',
'        return series_name + " " + percent + "% ( " + dataContext.value + " )";',
'    }',
'    ',
'    // Set chart initialization options ',
'    options.dataLabel = pieSliceLabel; ',
'    return options; ',
'}'))
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(19532610926209030)
,p_chart_id=>wwv_flow_api.id(19524408140209005)
,p_seq=>10
,p_name=>'Top Users'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select userid_lc as userid,',
'    count(*) as page_views',
'from apex_activity_log',
'where flow_id = :app_id',
'    and time_stamp >= sysdate - ( 1/24/60/60 * :P10031_TIMEFRAME )',
'    and userid is not null',
'group by userid_lc',
'order by 2'))
,p_ajax_items_to_submit=>'P10031_TIMEFRAME'
,p_items_value_column_name=>'PAGE_VIEWS'
,p_items_label_column_name=>'USERID'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideSlice'
,p_items_label_display_as=>'LABEL'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(19529908154209027)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(19524011657209005)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(19213236022620498)
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:&APP_PAGE_ID.,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19524521264209005)
,p_name=>'P10031_VIEW_AS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(19524152892209005)
,p_item_default=>'REPORT'
,p_prompt=>'View As'
,p_source=>'REPORT'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'VIEW_AS_REPORT_CHART'
,p_lov=>'.'||wwv_flow_api.id(19533156873209031)||'.'
,p_field_template=>wwv_flow_api.id(19211772741620491)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--radioButtonGroup'
,p_lov_display_extra=>'NO'
,p_escape_on_http_output=>'N'
,p_attribute_01=>'2'
,p_attribute_02=>'SUBMIT'
,p_attribute_03=>'Y'
,p_attribute_04=>'VERTICAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19524730448209006)
,p_name=>'P10031_TIMEFRAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(19524152892209005)
,p_item_default=>'900'
,p_prompt=>'Timeframe'
,p_source=>'900'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'TIMEFRAME (4 WEEKS)'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select disp,',
'      val as seconds',
' from table( apex_util.get_timeframe_lov_data )',
'order by insert_order'))
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(19211857718620493)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(19524290158209005)
,p_name=>'Refresh Report'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P10031_TIMEFRAME'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19531279683209029)
,p_event_id=>wwv_flow_api.id(19524290158209005)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(19524011657209005)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19534664768209032)
,p_event_id=>wwv_flow_api.id(19524290158209005)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(19524011657209005)
,p_stop_execution_on_error=>'Y'
);
end;
/
prompt --application/pages/page_10032
begin
wwv_flow_api.create_page(
 p_id=>10032
,p_user_interface_id=>wwv_flow_api.id(19235660911620554)
,p_name=>'Application Error Log'
,p_page_mode=>'MODAL'
,p_step_title=>'Application Error Log'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch:t-Dialog--noPadding'
,p_required_patch=>wwv_flow_api.id(19480732381208923)
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>This page provides an interactive report of all unexpected errors logged by this application.</p>',
'<p>Click on the column headings to sort and filter data, or click on the <strong>Actions</strong> button to customize column display and many additional advanced features. Click the <strong>Reset</strong> button to reset the interactive report back t'
||'o the default settings.</p>'))
,p_last_updated_by=>'DEMO'
,p_last_upd_yyyymmddhh24miss=>'20191024140753'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19519111640208999)
,p_plug_name=>'Application Error Log'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_api.id(19155944385620455)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    step_id,',
'    userid,',
'    time_stamp err_time,',
'    sqlerrm,',
'    sqlerrm_component_type,',
'    sqlerrm_component_name',
'from apex_activity_log',
'where flow_id = :app_id',
'and sqlerrm is not null'))
,p_plug_source_type=>'NATIVE_IR'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(19520027446208999)
,p_name=>'Application Error Log'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-view.png" class="apex-edit-view" alt="">'
,p_owner=>'DEMO'
,p_internal_uid=>19520027446208999
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19520169011209001)
,p_db_column_name=>'STEP_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Page'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19520562743209002)
,p_db_column_name=>'USERID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19520972636209002)
,p_db_column_name=>'ERR_TIME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Occurrence'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'since'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19521355675209003)
,p_db_column_name=>'SQLERRM'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Message'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19521759552209003)
,p_db_column_name=>'SQLERRM_COMPONENT_TYPE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Context'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19522156341209004)
,p_db_column_name=>'SQLERRM_COMPONENT_NAME'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Component Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(19522813194209004)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'195229'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'STEP_ID:USERID:ERR_TIME:SQLERRM:SQLERRM_COMPONENT_TYPE:SQLERRM_COMPONENT_NAME:'
,p_sort_column_1=>'ERROR_TIME'
,p_sort_direction_1=>'DESC'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(19523782491209005)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(19519111640208999)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(19213236022620498)
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:&APP_PAGE_ID.,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
);
end;
/
prompt --application/pages/page_10033
begin
wwv_flow_api.create_page(
 p_id=>10033
,p_user_interface_id=>wwv_flow_api.id(19235660911620554)
,p_name=>'Page Performance'
,p_page_mode=>'MODAL'
,p_step_title=>'Page Performance'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch:t-Dialog--noPadding'
,p_required_patch=>wwv_flow_api.id(19480732381208923)
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>This page provides an interactive report of the page performance and popularity. The report is ordered by <strong>Weighted Performance</strong> which is calculated by multiplying the Median Elapsed time and number of Page Views.</p>',
'<p>Select the reporting timeframe (Default = 1 day) at the top of the page as necessary.<br>',
'Click on the column headings to sort and filter data, or click on the <strong>Actions</strong> button to customize column display and many additional advanced features. Click the <strong>Reset</strong> button to reset the interactive report back to t'
||'he default settings.</p>'))
,p_last_updated_by=>'DEMO'
,p_last_upd_yyyymmddhh24miss=>'20191024140753'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19509505462208983)
,p_plug_name=>'Page Performance'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_api.id(19155944385620455)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select step_id page,',
'    (   select page_name',
'        from apex_application_pages p',
'        where p.page_id = l.step_id',
'            and p.application_id = :app_id ) page_name,',
'    median(elap)                   median_elapsed,',
'    count(*) * median(elap)        weighted_performance,',
'    sum(decode(sqlerrm,null,0,1))  errors,',
'    count(distinct userid)         distinct_users,',
'    count(distinct session_id)     application_sessions,',
'    count(*)                       page_views,',
'    max(elap)                      max_elapsed,',
'    sum(nvl(num_rows,0))           total_rows,',
'    sum(decode(page_mode,''P'',1,0)) partial_page_views,',
'    sum(decode(page_mode,''D'',1,0)) full_page_views,',
'    min(elap)                      min_elapsed,',
'    avg(elap)                      avg_elapsed',
'from apex_activity_log l',
'where flow_id = :app_id',
'    and time_stamp >= sysdate - ( 1/24/60/60 * :P10033_TIMEFRAME )',
'    and userid is not null',
'group by step_id'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P10033_TIMEFRAME'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(19510414309208984)
,p_name=>'Page Performance'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'DEMO'
,p_internal_uid=>19510414309208984
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19510571929208989)
,p_db_column_name=>'PAGE'
,p_display_order=>15
,p_column_identifier=>'A'
,p_column_label=>'Page'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19510901078208991)
,p_db_column_name=>'PAGE_NAME'
,p_display_order=>25
,p_column_identifier=>'B'
,p_column_label=>'Page Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19511394043208992)
,p_db_column_name=>'MEDIAN_ELAPSED'
,p_display_order=>35
,p_column_identifier=>'C'
,p_column_label=>'Median Elapsed'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990D9999'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19511779291208992)
,p_db_column_name=>'WEIGHTED_PERFORMANCE'
,p_display_order=>45
,p_column_identifier=>'D'
,p_column_label=>'Weighted Performance'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990D99'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19512158721208992)
,p_db_column_name=>'ERRORS'
,p_display_order=>55
,p_column_identifier=>'E'
,p_column_label=>'Action Processed.'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19512520706208993)
,p_db_column_name=>'DISTINCT_USERS'
,p_display_order=>65
,p_column_identifier=>'F'
,p_column_label=>'Distinct Users'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19512946298208993)
,p_db_column_name=>'APPLICATION_SESSIONS'
,p_display_order=>75
,p_column_identifier=>'G'
,p_column_label=>'Application Sessions'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19513326023208993)
,p_db_column_name=>'PAGE_VIEWS'
,p_display_order=>85
,p_column_identifier=>'H'
,p_column_label=>'Page Views'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19513766579208994)
,p_db_column_name=>'MAX_ELAPSED'
,p_display_order=>95
,p_column_identifier=>'I'
,p_column_label=>'Max Elapsed'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990D9999'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19514126380208994)
,p_db_column_name=>'TOTAL_ROWS'
,p_display_order=>105
,p_column_identifier=>'J'
,p_column_label=>'Total Rows'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19514570284208995)
,p_db_column_name=>'PARTIAL_PAGE_VIEWS'
,p_display_order=>115
,p_column_identifier=>'K'
,p_column_label=>'Partial Page Views'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19514901678208995)
,p_db_column_name=>'FULL_PAGE_VIEWS'
,p_display_order=>125
,p_column_identifier=>'L'
,p_column_label=>'Full Page Views'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19515311252208995)
,p_db_column_name=>'MIN_ELAPSED'
,p_display_order=>135
,p_column_identifier=>'M'
,p_column_label=>'Min Elapsed'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990D9999'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19515742649208996)
,p_db_column_name=>'AVG_ELAPSED'
,p_display_order=>145
,p_column_identifier=>'N'
,p_column_label=>'Avg Elapsed'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990D9999'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(19516458081208996)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'195165'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PAGE:PAGE_NAME:MEDIAN_ELAPSED:WEIGHTED_PERFORMANCE:ERRORS:DISTINCT_USERS:APPLICATION_SESSIONS:PAGE_VIEWS'
,p_sort_column_1=>'WEIGHTED_PERFORMANCE'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'PAGE_VIEWS'
,p_sort_direction_2=>'DESC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19509606480208983)
,p_plug_name=>'Button Bar'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--slimPadding:t-ButtonRegion--noUI:t-Form--large'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(19132834427620444)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_query_type=>'SQL'
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(19517321842208997)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(19509505462208983)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(19213236022620498)
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:&APP_PAGE_ID.,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19509471823208983)
,p_name=>'P10033_TIMEFRAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(19509606480208983)
,p_item_default=>'900'
,p_prompt=>'Timeframe'
,p_source=>'900'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'TIMEFRAME (4 WEEKS)'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select disp,',
'      val as seconds',
' from table( apex_util.get_timeframe_lov_data )',
'order by insert_order'))
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(19211857718620493)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(19509788246208983)
,p_name=>'Refresh Report'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P10033_TIMEFRAME'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19518693370208998)
,p_event_id=>wwv_flow_api.id(19509788246208983)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(19509505462208983)
,p_stop_execution_on_error=>'Y'
);
end;
/
prompt --application/pages/page_10034
begin
wwv_flow_api.create_page(
 p_id=>10034
,p_user_interface_id=>wwv_flow_api.id(19235660911620554)
,p_name=>'Page Views'
,p_page_mode=>'MODAL'
,p_step_title=>'Page Views'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch:t-Dialog--noPadding'
,p_required_patch=>wwv_flow_api.id(19480732381208923)
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>This page provides an interactive report of the most recent page views.</p>',
'<p>Select the reporting timeframe (Default = 1 day) at the top of the page as necessary.<br>',
'Click on the column headings to sort and filter data, or click on the <strong>Actions</strong> button to customize column display and many additional advanced features. Click the <strong>Reset</strong> button to reset the interactive report back to t'
||'he default settings.</p>'))
,p_last_updated_by=>'DEMO'
,p_last_upd_yyyymmddhh24miss=>'20191024140753'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19501563753208966)
,p_plug_name=>'Page Views'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_api.id(19155944385620455)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    step_id||''. ''||(select page_name',
'                    from apex_application_pages p',
'                    where p.page_id = l.step_id',
'                        and p.application_id = :APP_ID) page_name,',
'    userid_lc     user_id,',
'    time_stamp    timestamp,',
'    elap          elapsed,',
'    step_id       page,',
'    decode(page_mode,''P'',''Partial'',''D'',''Full'',page_mode) page_mode,',
'    component_name,',
'    num_rows,',
'    ir_search,',
'    sqlerrm  error',
'from apex_activity_log l',
'where flow_id = :app_id',
'    and time_stamp >= sysdate - ( 1/24/60/60 * :P10034_TIMEFRAME )',
'    and userid is not null',
'    and step_id is not null',
'order by time_stamp desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P10034_TIMEFRAME'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(19502496629208967)
,p_name=>'Page Views'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'DEMO'
,p_internal_uid=>19502496629208967
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19502535343208973)
,p_db_column_name=>'PAGE_NAME'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Page Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19502999854208976)
,p_db_column_name=>'USER_ID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19503320231208976)
,p_db_column_name=>'TIMESTAMP'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Timestamp'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'since'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19503700672208977)
,p_db_column_name=>'ELAPSED'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Elapsed'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990D0000'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19504189689208977)
,p_db_column_name=>'PAGE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Page'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19504548194208977)
,p_db_column_name=>'PAGE_MODE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Mode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19504964706208978)
,p_db_column_name=>'COMPONENT_NAME'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Component Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19505319113208978)
,p_db_column_name=>'NUM_ROWS'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Num Rows'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19505783262208978)
,p_db_column_name=>'IR_SEARCH'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'IR Search'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19506185439208979)
,p_db_column_name=>'ERROR'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Error'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(19506838618208980)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'195069'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PAGE_NAME:USER_ID:TIMESTAMP:ELAPSED:PAGE_MODE'
,p_sort_column_1=>'TIMESTAMP'
,p_sort_direction_1=>'DESC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19501653879208966)
,p_plug_name=>'Button Bar'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--slimPadding:t-ButtonRegion--noUI:t-Form--large'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(19132834427620444)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_query_type=>'SQL'
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(19507793778208982)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(19501563753208966)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(19213236022620498)
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:&APP_PAGE_ID.,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19501420558208966)
,p_name=>'P10034_TIMEFRAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(19501653879208966)
,p_item_default=>'900'
,p_prompt=>'Timeframe'
,p_source=>'900'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'TIMEFRAME (4 WEEKS)'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select disp,',
'      val as seconds',
' from table( apex_util.get_timeframe_lov_data )',
'order by insert_order'))
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(19211857718620493)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(19501791422208966)
,p_name=>'Refresh Report'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P10034_TIMEFRAME'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19509084538208983)
,p_event_id=>wwv_flow_api.id(19501791422208966)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(19501563753208966)
,p_stop_execution_on_error=>'Y'
);
end;
/
prompt --application/deployment/definition
begin
null;
end;
/
prompt --application/deployment/checks
begin
null;
end;
/
prompt --application/deployment/buildoptions
begin
null;
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
