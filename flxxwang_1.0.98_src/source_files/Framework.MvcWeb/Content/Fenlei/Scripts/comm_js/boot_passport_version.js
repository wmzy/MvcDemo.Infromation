var array = { indexOf: function (source, o) { for (var i = 0, len = source.length; i < len; i++) { if (source[i] == o) return i } return -1 }, find: function (source, iterator) { var item, i, len = source.length; if ('function' == typeof iterator) { for (i = 0; i < len; i++) { item = source[i]; if (true === iterator.call(source, item, i)) { return item } } } return null }, filter: function (source, iterator) { var result = [], resultIndex = 0, len = source.length, item, i; if ('function' == typeof iterator) { for (i = 0; i < len; i++) { item = source[i]; if (true === iterator.call(source, item, i)) { result[resultIndex++] = item } } } return result } }; var js = { cache: [], loglist: [], push: function (src, onsuccess, onerror, refresh) { if (arguments.length == 1 && fe.isObject(arguments[0])) { this.cache.push(arguments[0]) } else { this.cache.push({ src: src, onsuccess: onsuccess, onerror: onerror }) } }, flush: function () { var self = this; fe.array.each(this.cache, function (item) { self.appendScript(item) }) }, append: function (src, onsuccess, onerror, refresh) { if (arguments.length == 1 && fe.isObject(arguments[0])) { this.appendScript(arguments[0]) } else { this.appendScript({ src: src, onsuccess: onsuccess, onerror: onerror }) } }, appendScript: function (config) { var script, self = this, config = config || {}, src = config.src, onsuccess = config.onsuccess, onerror = config.onerror, refresh = config.refresh, jsonpflag = false, WIN = window, DOC = WIN.document, HEAD = DOC.head || DOC.getElementsByTagName("head")[0], reg_readystate = /loaded|complete|undefined/i, method = DOC.dispatchEvent ? "onload" : "onreadystatechange"; if (fe.isEmpty(src)) return; if (config.type == 'jsonp') { var paramsName = config.callbackName || 'callback', callback = config.callback || fe.id('jsonp'); src.indexOf('?') == -1 ? src += '?' : src += '&'; src += paramsName + '=' + callback; window[callback] = function () { jsonpflag = true; config.onsuccess && config.onsuccess.call(this, arguments); self.log('success', 'script脚本正确加载,callback被正确调用', [this, arguments]) } } if (refresh === true) { if (src.indexOf('?') == -1) { src += '?' } else { src += '&' } src += 'refreah=' + Math.random() } script = document.createElement("script"); script.charset = "utf-8"; script.type = "text/javascript"; script.defer = true; script.async = true; script.onerror = function () { onerror && onerror.apply(this, arguments); self.log('error', 'script脚本加载失败', [this, arguments]); self.removeScript(this) }; script[method] = function () { if (reg_readystate.test(this.readyState)) { if (config.type == 'jsonp') { !jsonpflag && onerror && onerror.apply(this, arguments); self.log('error', 'script脚本正确加载，但是callback没有被正确调用', [this, arguments]) } else { onsuccess && onsuccess.apply(this, arguments); self.log('success', 'script脚本正确加载', [this, arguments]) } self.removeScript(this) } }; script.src = src; HEAD.insertBefore(script, HEAD.firstChild) }, removeScript: function (script) { var WIN = window, DOC = WIN.document, method = DOC.dispatchEvent ? "onload" : "onreadystatechange", parent = script.parentNode; if (parent && parent.nodeType === 1) { script.clearAttributes ? script.clearAttributes() : script[method] = script.onerror = null; script.parentNode.removeChild(script) } }, log: function (type, msg, context) { this.loglist.push([type, msg, context]) } }; var boot = { initConfig: function (config) { try { var bp = "http://pic2.58.com/js/v6/source/", configpath = this.getConfigPath(config), cf = config.configs[configpath], version = cf.version || config.version; this.configpath = configpath; this.config = config; if (cf) { if (cf.jsFiles) { if (cf.jsFiles.just) { window.document.writeln('<script type="text/javascript" src="' + bp + cf.jsFiles.just + '?version=' + version + '"></script>') } if (cf.jsFiles.domload) boot.domload(function () { js.append(bp + cf.jsFiles.domload + '?version=' + version) }) } } } catch (e) { if (!boot.isReady) { boot.init(function () { boot.initConfig(config) }) } } }, getConfigPath: function (config) { var j = ____json4fe, m = j.modules, catelist = [], locallist = [], cf, configlist = []; for (var key in config.configs) { configlist.push(key) } if (j.catentry.length) { for (var i = 0, leni = j.catentry.length; i < leni; i++) { catelist.push(j.catentry[i].listname) } } else { catelist.push(j.catentry.listname) } if (j.locallist.length) { for (var i = 0, leni = j.locallist.length; i < leni; i++) { locallist.push(j.locallist[i].listname) } } else { locallist.push(j.locallist.listname) } var list1, list2; for (var i = 0, leni = catelist.length; i < leni; i++) { list1 = array.filter(configlist, function (key) { return (key && array.indexOf(key.split('_')[1].split('|'), catelist[i]) >= 0) }); if (list1 && list1.length) break } if (list1.length == 0) { list1 = array.filter(configlist, function (key) { return (key && key.split('_')[1] == '') }) } for (var i = 0, leni = locallist.length; i < leni; i++) { list2 = array.filter(list1, function (key) { return (key && array.indexOf(key.split('_')[2].split('|'), locallist[i]) >= 0) }); if (list2 && list2.length) break } if (list2.length == 0) { list2 = array.filter(list1, function (key) { return (key && key.split('_')[2] == '') }) } if (list2 && list2.length) return list2[0]; else return null }, domload: function (fn) { this.init(fn) }, isReady: false, readyList: [], DOMContentLoaded: null, readyBound: false, readyWait: 1, ready: function (wait) { if (wait === true) { this.readyWait-- } if (!this.readyWait || (wait !== true && !this.isReady)) { if (!document.body) { return setTimeout(this.ready, 1) } this.isReady = true; if (wait !== true && --this.readyWait > 0) { return } if (this.readyList) { var fn, i = 0, ready = this.readyList; this.readyList = null; while ((fn = ready[i++])) { fn.call(document, boot) } } } }, bindReady: function () { if (this.readyBound) { return } this.readyBound = true; if (document.readyState === "complete") { return setTimeout(this.ready, 1) } if (document.addEventListener) { document.addEventListener("DOMContentLoaded", this.DOMContentLoaded, false); window.addEventListener("load", this.ready, false); } else if (document.attachEvent) { document.attachEvent("onreadystatechange", this.DOMContentLoaded); window.attachEvent("onload", this.ready); var toplevel = false; try { toplevel = window.frameElement == null } catch (e) { } if (document.documentElement.doScroll && toplevel) { doScrollCheck_boot() } } }, init: function (fn) { this.bindReady(); if (this.isReady) { fn.call(document, boot); } else if (this.readyList) { this.readyList.push(fn) } return } }; if (document.addEventListener) { boot.DOMContentLoaded = function () { document.removeEventListener("DOMContentLoaded", boot.DOMContentLoaded, false); boot.ready() } } else if (document.attachEvent) { boot.DOMContentLoaded = function () { if (document.readyState === "complete") { document.detachEvent("onreadystatechange", boot.DOMContentLoaded); boot.ready() } } } function doScrollCheck_boot() { if (boot.isReady) { return } try { document.documentElement.doScroll("left") } catch (e) { setTimeout(doScrollCheck_boot, 1); return } boot.ready() } boot.initConfig({ "version": 1316152782495, "configs": { "passport___": { "version": "0.1.4", "css": "", "jsFiles": { "just": "f01f02dc906c8e6734ed04749e5db7cb.js"}}} });