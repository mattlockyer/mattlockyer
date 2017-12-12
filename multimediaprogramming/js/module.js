var editor = new Array();
var ideFocus = false;
var keepModalOpen = false;
var heights = new Array();

var processing;
var tabs;
var currentTab = 1;
var numTabs = 0;

$(document).ready( function() {
    
    //Code Mirror and IDE
    $('body').prepend('<div id="modalContainer"><div id="modal"></div><div id="closeModal"><img src="css/toolbar/close.png" /></div></div>');
    $('#modalContainer').hide();
    
    //Set each editor and give each editor a toolbar
    $('.processingide').each( function(i) {
        if (!$(this).attr('noplay')) {
            $(this).parent().before('<div class="toolbar"><img class="play" src="css/toolbar/play.png" /></div>');
        } else {
            $(this).parent().before('<div class="toolbar" style="visibility:hidden; display:none;"><img class="play" src="css/toolbar/play.png" /></div>');
        }
        heights[i] = $(this).css("height");
        
        editor[i] = CodeMirror.fromTextArea(this, {
            lineNumbers: true,
            matchBrackets: true,
            mode: "text/x-processing"
        });
    });
    
    
    
    //Reset Editor Heights to custom
    $('.CodeMirror-scroll').each( function(i) {
        $(this).css("height", heights[i]);
    }).click( function(e) {
        ideFocus = true;
    });
    
    //Set toolbar behaviors
    $('.toolbar .play').each( function(i) {
        $(this).hover(function() {
            $(this).attr('src','css/toolbar/playHover.png');
        }, function() {
            $(this).attr('src','css/toolbar/play.png');
        });
        $(this).click( function() {
        
            $('#modalContainer').hide();
            $('#modal').html('');
            var source = editor[i].getValue();
        
            $('#modal').html('<canvas id="display" width="100px" height="100px"></canvas>');
        
            processing = new Processing($('#display')[0], source);
        
            $('#modalContainer').width($(window).width() + 'px');
            $('#modalContainer').height($(window).height() + 'px');
            $('#modal').width(processing.width + 'px');
            $('#modal').height(processing.height + 'px');
            $('#modal').css('left', $(window).width()/2 - processing.width/2 + 'px');
            $('#modal').css('top', $(window).height()/2 - processing.height/2 + 'px');
            $('#closeModal').css('left', $(window).width()/2 + processing.width/2 - 8 + 'px');
            $('#closeModal').css('top', $(window).height()/2 - processing.height/2 - 16 + 'px');
      
            $('#modalContainer').stop().fadeIn('slow');
            
            $('#display').focus();
        });
    });
    
    //Set modal behavior
    $('#modal').click( function(e) {
        keepModalOpen = true;
    });
    $('#modalContainer, #closeModal').click( function() {
        if (keepModalOpen) {
            keepModalOpen = false;
        } else {
            $('#modalContainer').hide();
        }
    });
    
   
    //SyntaxHighlighter.all();    
    
    //Tabs
    tabs = $('#tabs').tabs({
        select: function(event, ui) {
            ideFocus = false;
            currentTab = ui.index;
            var url = $.data(ui.tab, 'load.tabs');
            if( url ) {
                location.href = url;
                return false;
            }
            return true;
        }
    });
    
    numTabs = tabs.tabs('length');
    tabs.tabs('select', currentTab);
    
    //Refresh editor when tab opens, syntax highlighter
    tabs.tabs({
        show: function(event, ui) {
            $('.processingide').each( function(i) {
                editor[i].refresh();
            });
        }
    });
    
    //Switching tabs with keys
    $(window).keydown( function(e) {
        if (!ideFocus) {
            if (e.keyCode == '37') {
                currentTab--;
                if (currentTab == 0) {
                    currentTab = numTabs - 1;
                }
                tabs.tabs('select', currentTab);
            }
            if (e.keyCode == '39') {
                currentTab++;
                if (currentTab == numTabs) {
                    currentTab = 1;
                }
                tabs.tabs('select', currentTab);
            }
        }
    });
    
});