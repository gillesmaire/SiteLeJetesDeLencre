---
title: ""
date: ""
---

<div class="video-grid">
  {{< youtube id="9uLZ9hTQ698" class="youtube-video" >}}
  {{< youtube id="lMRJ1kL28lE" class="youtube-video" >}}
  {{< youtube id="zh-9iQqyQTA" class="youtube-video" >}}
  {{< youtube id="t68KtoirySc" class="youtube-video" >}}
  {{< youtube id="3BQAo78nQQc" class="youtube-video" >}}
  {{< youtube id="7stKhvWgc2s" class="youtube-video" >}}
  {{< youtube id="6s_nMHqlNL0" class="youtube-video" >}}
  {{< youtube id="ZlTltjkUjEs" class="youtube-video" >}}
</div>



<style>
.video-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 20px;
    padding: 20px;
    max-width: 1600px;
    margin: 0 auto;
}

.video-container {
    position: relative;
    padding-top: 56.25%; /* Ratio 16:9 */
    background: #000;
    border-radius: 8px;
    overflow: hidden;
}

.video-item {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    border: none;
}


</style>
