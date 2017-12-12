/**
 * Processing brush for SyntaxHighlighter, updated for version 3.0
 *
 * SyntaxHighlighter is at http://alexgorbatchev.com/SyntaxHighlighter
 *
 * @copyright
 * Copyright 2011 Colin Mitchell colin@muffinlabs.com
 *
 * @license
 * Licensed under The Do What The Fuck You Want To Public License (WTFPL)
 * http://sam.zoy.org/wtfpl/
 * Dual licensed under the MIT and GPL licenses.
 */
;(function()
{
	// CommonJS
	typeof(require) != 'undefined' ? SyntaxHighlighter = require('shCore').SyntaxHighlighter : null;

	function Brush()
	{

		var keywords = 'abstract assert boolean break byte case catch char class continue ' +
			'default do double else enum extends const false final finally float for goto ' +
			'if implements import instanceof int interface long native new null package private ' +
			'protected public return short static strictfp super switch synchronized this throw ' +
			'throws transient try void volatile while true';
		var functionsBold =	'setup draw';
		var functions =	'size strokeWeight stroke background pushMatrix popMatrix translate ' +
			'rotate radians rect quad bezierCurve curveVertex vertex endShape noFill color ' +
			'noStroke nf fill get bezierVertex ellipse dist mouseMoved sin smooth random colorMode ' +
			'point line noLoop loop redraw beginDraw endDraw image createGraphics triangle quad ' +
			'arc cos bezier PImage PFont loadImage scale println print ellipseMode atan2 atan ' +
			'updatePixels noise textFont textAlign text tint abs constrain createImage saturation ' +
			'brightness rectMode mouseDragged mouseReleased millis map hour minute second link length beginShape';

		var reservedwords =	'mouseX mouseY height width frameCount TWO_PI PI HALF_PI QUATER_PI ' +
			'CENTER LEFT RIGHT UP DOWN PGraphics P3D RGB HSB TRIANGLE_STRIP frameRate keyPressed ' +
			'key pixels CENTER_RADIUS mousePressed CORNER pmouseX pmouseY CLOSE TRIANGLES';

		this.regexList = [
			{ regex: SyntaxHighlighter.regexLib.singleLineCComments,	css: 'comments' },		// one line comments
			{ regex: /\/\*([^\*][\s\S]*)?\*\//gm,						css: 'comments' },	 	// multiline comments
			{ regex: /\/\*(?!\*\/)\*[\s\S]*?\*\//gm,					css: 'preprocessor' },	// documentation comments
			{ regex: SyntaxHighlighter.regexLib.doubleQuotedString,		css: 'string' },		// strings
			{ regex: SyntaxHighlighter.regexLib.singleQuotedString,		css: 'string' },		// strings
			{ regex: /\b([\d]+(\.[\d]+)?|0x[a-f0-9]+)\b/gi,				css: 'value' },			// numbers
			{ regex: /(?!\@interface\b)\@[\$\w]+\b/g,					css: 'color1' },		// annotation @anno
			{ regex: /\@interface\b/g,									css: 'color2' },		// @interface keyword
			{ regex: new RegExp(this.getKeywords(keywords), 'gm'),		css: 'keyword' },		// java keyword
			{ regex: new RegExp(this.getKeywords(reservedwords), 'gm'),			css: 'constants' },// processing reserved words		
			{ regex: new RegExp(this.getKeywords(functions), 'gm'),					css: 'functions' },		  // processing reserved functions
			{ regex: new RegExp(this.getKeywords(functionsBold), 'gm'),			css: 'functions bold' }		  // processing reserved functions
			];

		this.forHtmlScript({
			left	: /(&lt;|<)%[@!=]?/g, 
			right	: /%(&gt;|>)/g 
		});

		this.forHtmlScript(SyntaxHighlighter.regexLib.aspScriptTags);
	};

	Brush.prototype	= new SyntaxHighlighter.Highlighter();
	Brush.aliases	= ['processing', 'pjs', 'pde'];

	SyntaxHighlighter.brushes.Processing = Brush;

	// CommonJS
	typeof(exports) != 'undefined' ? exports.Brush = Brush : null;
})();
