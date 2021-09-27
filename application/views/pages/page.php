<style type="text/css">
	.pull-right
	{
		float: right;
	}
	.glyphicon-chevron-down:before {
    content: "\f107";
    font-family: "Font Awesome 5 Free";
    font-weight: 900;
}
ul>li, ol>li {
    font-size: 14px;
    line-height: 24px;
    font-weight: 400;
}
a[aria-expanded="true"] .glyphicon-chevron-down:before {
    content: "\f106";
    font-family: "Font Awesome 5 Free";
    font-weight: 900;
}
.shipping-products img
{
	width: 160px
}
.paymentoptions img
{
	width:100%;
}
.paymentoptions
{
	margin-top:4%;
}
@media (max-width:480px)
{
	.accordion-list .collapsible-item-title-link
	{
width:90%;
	}
}
</style>
<main class="main-content">
<section>
	<div class="container">
		
		<h2><?php echo ucwords($content_page->name);?></h2>
		
		<div class="content">
			<?php echo $content_page->content; ?>
		</div>
	</div>
</section>
</main>
