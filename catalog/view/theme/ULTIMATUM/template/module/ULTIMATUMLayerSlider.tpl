<script type="text/javascript">
		jQuery(window).load(function() {
        if(typeof jQuery.fn.layerSlider == "undefined") { lsShowNotice('layerslider_<?php echo $id; ?>','jquery'); }
                    else if(typeof jQuery.transit == "undefined" || typeof jQuery.transit.modifiedForLayerSlider == "undefined") { lsShowNotice('layerslider_<?php echo $id; ?>', 'transit'); }
                        else {
                            jQuery("#layerslider_<?php echo $id; ?>").layerSlider({
                                width : '<?php echo $width; ?>',
                                height : '<?php echo $height; ?>',
                                responsive : <?php echo $responsive; ?>,
                                responsiveUnder : '<?php echo $responsiveunder; ?>',
                                sublayerContainer : '<?php echo $sublayercontainer; ?>',
                                autoStart : <?php echo $autostart; ?>,
                                pauseOnHover : <?php echo $pauseonhover; ?>,
                                firstLayer : '<?php echo $firstlayer; ?>',
                                animateFirstLayer : <?php echo $animatefirstlayer; ?>,
                                randomSlideshow : <?php echo $randomslideshow; ?>,
                                twoWaySlideshow : <?php echo $twowayslideshow; ?>,
                                loops : '<?php echo $loops; ?>',
                                forceLoopNum : <?php echo $forceloopnum; ?>,
                                autoPlayVideos : <?php echo $autoplayvideos; ?>,
                                autoPauseSlideshow : <?php echo $autopauseslideshow; ?>,
                                youtubePreview : '<?php echo $youtubepreview; ?>',
                                keybNav : <?php echo $keybnav; ?>,
                                touchNav : <?php echo $touchnav; ?>,
                                skin : '<?php echo $skin; ?>',
                                skinsPath : '<?php echo $skinpath; ?>',
								<?php if(!empty($backgroundcolor)) { ?> globalBGColor : '<?php echo $backgroundcolor; ?>', <?php } ?>
                                <?php if(!empty($backgroundimage)) { ?> globalBGImage : '<?php echo $backgroundimage; ?>', <?php } ?>
                                navPrevNext : <?php echo $navprevnext; ?>,
                                navStartStop : <?php echo $navstartstop; ?>,
                                navButtons : <?php echo $navbuttons; ?>,
                                hoverPrevNext : <?php echo $hoverprevnext; ?>,
                                hoverBottomNav : <?php echo $hoverbottomnav; ?>,
                                thumbnailNavigation : '<?php echo $thumb_nav; ?>',
                                tnWidth : '<?php echo $thumb_width; ?>',
                                tnHeight : '<?php echo $thumb_height; ?>',
                                tnContainerWidth : '<?php echo $thumb_container_width; ?>',
                                tnActiveOpacity : '<?php echo $thumb_active_opacity; ?>',
                                tnInactiveOpacity : '<?php echo $thumb_inactive_opacity; ?>',
                                imgPreload : <?php echo $imgpreload; ?>,
								showBarTimer        : false,
								showCircleTimer        : false,
                        		yourLogo : '<?php echo $yourlogo; ?>',
                                yourLogoStyle : '<?php echo $yourlogostyle; ?>',
                                yourLogoLink : '<?php echo $yourlogolink; ?>',
                                yourLogoTarget : '<?php echo $yourlogotarget; ?>',
                                cbInit : <?php echo $cbinit; ?>,
                                cbStart : <?php echo $cbstart; ?>,
                                cbStop : <?php echo $cbstop; ?>,
                                cbPause : <?php echo $cbpause; ?>,
                                cbAnimStart : <?php echo $cbanimstart; ?>,
                                cbAnimStop : <?php echo $cbanimstop; ?>,
								cbPrev : <?php echo $cbprev; ?>,
                                cbNext : <?php echo $cbnext; ?> 
                            });
                        }
         });
		
</script>
<?php if(isset($forceresponsive)&&$forceresponsive!='false'){?>
<div class="ls-wp-fullwidth-container">
  <div class="ls-wp-fullwidth-helper">
    <?php }?>
    <div id="layerslider_<?php echo $id;?>" class="ls-wp-container" style="width: <?php echo $width;?>; height: <?php echo $height;?>; margin: 0px auto; <?php echo $sliderstyle;?>">
      <?php $data="";if(is_array($slides)){foreach($slides as $slidekey=>$slide){if(isset($slide['skip'])){continue;}if(!empty($slide['id'])){$layerID='id="'.$slide['id'].'"';}else {$layerID='';}if(!empty($slide['deeplink'])){$deeplink='deeplink: '.$slide['deeplink'].'; ';}else {$deeplink='';}if(isset($slide['new_transitions'])){$ts=!empty($slide['timeshift'])?$slide['timeshift']:'0';$timeshift='timeshift: '.$ts.'; ';}else {$timeshift='';}$transition2d='';$transition3d='';$customtransition2d='';$customtransition3d='';if(isset($slide['new_transitions'])){if(empty($slide['2d_transitions'])&&empty($slide['3d_transitions'])&&empty($slide['custom_2d_transitions'])&&empty($slide['custom_3d_transitions'])){$transition2d='transition2d: all; ';$transition3d='transition3d: all; ';}else {if(!empty($slide['2d_transitions']))$transition2d='transition2d: '.$slide['2d_transitions'].'; ';if(!empty($slide['3d_transitions']))$transition3d='transition3d: '.$slide['3d_transitions'].'; ';if(!empty($slide['custom_2d_transitions']))$customtransition2d='customtransition2d: '.$slide['custom_2d_transitions'].'; ';if(!empty($slide['custom_3d_transitions']))$customtransition3d='customtransition3d: '.$slide['custom_3d_transitions'].'; ';}}$data.='<div class="ls-layer" '.$layerID.' style="'.$deeplink.'slidedirection: '.$slide['slidedirection'].'; slidedelay: '.$slide['slidedelay'].'; durationin: '.$slide['durationin'].'; durationout: '.$slide['durationout'].'; easingin: '.$slide['easingin'].'; easingout: '.$slide['easingout'].'; delayin: '.$slide['delayin'].'; delayout: '.$slide['delayout'].'; '.$timeshift.''.$transition2d.''.$transition3d.''.$customtransition2d.''.$customtransition3d.'">';if(!empty($slide['background'])){$data.='<img src="'.$uploadPath.$slide['background'].'" class="ls-bg">';}if(!empty($thumb_nav)&&$thumb_nav!='disabled'){if(!empty($slide['thumbnail'])){$data.='<img src="'.$uploadPath.$slide['thumbnail'].'" class="ls-tn">';}}if(isset($slide['layers'])&&is_array($slide['layers'])){foreach($slide['layers'] as $layer){if(isset($layer['skip'])){continue;}if(!empty($layer['slidedirection'])&&$layer['slidedirection']!='auto'){$slidedirection='slidedirection : '.$layer['slidedirection'].';';}else {$slidedirection='';}if(!empty($layer['slideoutdirection'])&&$layer['slideoutdirection']!='auto'){$slideoutdirection='slideoutdirection : '.$layer['slideoutdirection'].';';}else {$slideoutdirection='';}if(!empty($layer['id'])){$sublayerID='id="'.$layer['id'].'"';}else {$sublayerID='';}$linkTo='';if(!empty($layer['url'])){if(preg_match('/^\#[0-9]/',$layer['url'])>0){$linkTo=' ls-linkto-'.substr($layer['url'],1).'';}else {$linkTo='';}}if(!empty($layer['title'])){$sublayerTitle='title="'.$layer['title'].'"';}else {$sublayerTitle='';}if(!empty($sublayer['alt'])){$sublayerAlt='alt="'.$sublayer['alt'].'"';}else {$sublayerAlt='';}if(!empty($layer['rel'])){$sublayerRel='rel="'.$layer['rel'].'"';}else {$sublayerRel='';}if(!isset($layer['wordwrap'])){$sublayerWordWrap=' white-space: nowrap;';}else {$sublayerWordWrap='';}if(!empty($layer['style'])){$sublayerStyle=$layer['style'];}else {$sublayerStyle='';}if(!empty($layer['class'])){$sublayerClass=' '.$layer['class'].'';}else {$sublayerClass='';}if(empty($layer['showuntil'])){$layer['showuntil']='0';}$styles=array();$styles['width']=$layer['width'];$styles['height']=$layer['height'];$styles['padding-top']=$layer['padding-top'];$styles['padding-right']=$layer['padding-right'];$styles['padding-bottom']=$layer['padding-bottom'];$styles['padding-left']=$layer['padding-left'];$styles['border-top']=$layer['border-top'];$styles['border-right']=$layer['border-right'];$styles['border-bottom']=$layer['border-bottom'];$styles['border-left']=$layer['border-left'];$styles['font-family']=$layer['font-family'];$styles['font-size']=$layer['font-size'];$styles['line-height']=$layer['line-height'];$styles['background']=$layer['background'];$styles['border-radius']=$layer['border-radius'];$styles['color']=$layer['color'];if($styles['background']!="")$styles['background']="url('".$uploadPath.$styles['background']."')";if(!empty($styles)){$customStyles='';foreach($styles as $key=>$val){if($val!='')$customStyles.=''.$key.': '.$val.'; ';}}else {$customStyles='';}if($layer['image']!=""){$layer['image']=$uploadPath.$layer['image'];$layer['type']='img';}else $layer['type']='div';if(!empty($layer['url'])&&preg_match('/^\#[0-9]/',$layer['url'])==0){$data.='<a href="'.$layer['url'].'" target="'.$layer['target'].'" '.$sublayerID.' '.$sublayerRel.' class="ls-s'.$layer['level'].'" '.$sublayerTitle.' style="position: absolute; top: '.$layer['top'].'; left:'.$layer['left'].'; display: block; '.$slidedirection.' '.$slideoutdirection.' durationin : '.$layer['durationin'].'; durationout : '.$layer['durationout'].'; easingin : '.$layer['easingin'].'; easingout : '.$layer['easingout'].'; delayin : '.$layer['delayin'].'; delayout : '.$layer['delayout'].'; showuntil : '.$layer['showuntil'].'">';if(empty($layer['type'])||$layer['type']=='img'){if(!empty($layer['image'])){$data.='<img src="'.$layer['image'].'" '.$sublayerAlt.' style="'.$sublayerStyle.''.$customStyles.'" />';}}else{$data.='<'.$layer['type'].' style="'.$sublayerStyle.' '.$customStyles.' '.$sublayerWordWrap.'">'.htmlspecialchars_decode($layer['html']).'</'.$layer['type'].'>';}$data.='</a>';}else {if(empty($layer['type'])||$layer['type']=='img'){if(!empty($layer['image'])){$data.='<img class="ls-s'.$layer['level'].''.$linkTo.''.$sublayerClass.'" '.$sublayerID.' src="'.$layer['image'].'" '.$sublayerAlt.' style="position: absolute; top: '.$layer['top'].'; left: '.$layer['left'].'; '.$slidedirection.' '.$slideoutdirection.'  durationin : '.$layer['durationin'].'; durationout : '.$layer['durationout'].'; easingin : '.$layer['easingin'].'; easingout : '.$layer['easingout'].'; delayin : '.$layer['delayin'].'; delayout : '.$layer['delayout'].'; showuntil : '.$layer['showuntil'].'; '.$sublayerStyle.''.$customStyles.'">';}}else {$data.='<'.$layer['type'].' '.$sublayerID.' class="ls-s'.$layer['level'].''.$linkTo.''.$sublayerClass.'" style="position: absolute; top:'.$layer['top'].'; left: '.$layer['left'].'; '.$slidedirection.' '.$slideoutdirection.' durationin : '.$layer['durationin'].'; durationout : '.$layer['durationout'].'; easingin : '.$layer['easingin'].'; easingout : '.$layer['easingout'].'; delayin : '.$layer['delayin'].'; delayout : '.$layer['delayout'].'; showuntil : '.$layer['showuntil'].'; '.$sublayerStyle.' '.$customStyles.' '.$sublayerWordWrap.'"> '.htmlspecialchars_decode($layer['html']).' </'.$layer['type'].'>';}}}if(!empty($slide['layer_link'])){$data.='<a href="'.$slide['layer_link'].'" target="'.$slide['layer_link_target'].'" class="ls-link"></a>';}}$data.='</div>';}}$data.='</div>';echo $data;?>
 <?php if(isset($forceresponsive)&&$forceresponsive!='false'){?>
    </div>
  </div>
  <?php }?>