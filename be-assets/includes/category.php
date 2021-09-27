<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/gasparesganga-jquery-loading-overlay@2.1.7/dist/loadingoverlay.min.js"></script>
<script>
$(document).delegate('.tag', 'click', function(e)
{
    e.preventDefault();
    var id = $(this).attr('id');
    var data_value = $(this).data('value');
    var selector= '';
    if (id == 'price_range[]' || id == 'weight_ranges[]') {
        selector = "input[name='"+id+"']";
    }else{
       selector = "input[value='"+data_value+"']"; 
    }
    $(selector).prop('checked', false).trigger("change").parent().removeClass('active');    
});

$(document).ready(function(){

     var query = '';
<?php  if (isset($_REQUEST['q'])): ?>
    query = "<?php echo $_REQUEST['q'] ?>";
<?php endif ?>

    var product_type = "<?php echo $this->uri->segment(6); ?>";
    var sub_product_type = "<?php echo$this->uri->segment(4); ?>";
    var gender = "<?php echo $this->uri->segment(5); ?>";
    var url_category = "<?php echo $this->uri->segment(3); ?>";


    $('#clear-filters').css('display', 'none');
    $("#ajaxfilter").change(function(e) {        
         var url = "<?php echo base_url('products/category/') ?>";
            var filters = [];
            var postData = $(this).serializeArray();

            $.each(postData, function(key, value) {
                if(filters[value['name']] == undefined){
                    filters[value['name']] = [];
                }
                filters[value['name']].push(value['value']);
            });

            if (url_category) {
                url = url+url_category;
            }

            var price_range = '';
            var min_price = '';
            var max_price = '';
            var weight_range = '';
            var min_weight = '';
            var max_weight = '';
            var sizes = '';
            var searchTerm = '';
            var category = '';
            var colors = '';
            var metals = '';
            var purity = '';
            var gemstone = '';
            var pearls = '';
            var currency = 'inr';
            var sort_by = '';
            
            //queryString = window.location.search;
            
            var temp = {};

            var queryString = '';
            if(queryString == '') {
                queryString = '?';
            } 

            $('#selected-filters').html('');      
           
            if(filters['category[]'] !== undefined) {
      
                categories = filters['category[]'].join(',');
                
                temp['categories'] = categories;
                for (var i = filters['category[]'].length - 1; i >= 0; i--) {
                    $('#selected-filters').append('<li class="list-inline-item">'+filters['category[]'][i]+' <a href="#" class="tag" id="category[]" data-value="'+filters['category[]'][i]+'" ></a></li>');
                }
            }else{
                temp['categories'] = url_category;
            }
            
            if(filters['price_range[]'] !== undefined) {
                var p = filters['price_range[]'][0].split('-');
                min_price = p[0];
                p = filters['price_range[]'][filters['price_range[]'].length-1].split('-')
                max_price = p[1];
                temp['min_price'] = min_price;
                temp['max_price'] = max_price;
                $('#selected-filters').append('<li class="list-inline-item">'+min_price+'-'+max_price+' <a href="#" class="tag" id="price_range[]" data-value="'+filters['price_range[]'][i]+'" ></a></li>');
            }
            if(filters['weight_ranges[]'] !== undefined) {
                var p = filters['weight_ranges[]'][0].split('-');
                min_weight = p[0];
                p = filters['weight_ranges[]'][filters['weight_ranges[]'].length-1].split('-')
                max_weight = p[1];
                temp['min_weight'] = min_weight;
                temp['max_weight'] = max_weight;
                $('#selected-filters').append('<li class="list-inline-item">'+min_weight+'-'+max_weight+' <a href="#" class="tag" id="weight_ranges[]" data-value="'+filters['weight_ranges[]'][i]+'" ></a></li>');
            }
            
            if(filters['color[]'] !== undefined) {
                color = filters['color[]'].join(',');
                temp['color'] = color;
                for (var i = filters['color[]'].length - 1; i >= 0; i--) {
                    $('#selected-filters').append('<li class="list-inline-item">'+filters['color[]'][i]+' <a href="#" class="tag" id="color[]" data-value="'+filters['color[]'][i]+'"></a></li>');
                }
            }
            
            if(filters['purity[]'] !== undefined) {
                purity = filters['purity[]'].join(',');
                temp['purity'] = purity;
                for (var i = filters['purity[]'].length - 1; i >= 0; i--) {
                    $('#selected-filters').append('<li class="list-inline-item">'+filters['purity[]'][i]+' <a href="#" class="tag" id="purity[]" data-value="'+filters['purity[]'][i]+'" ></a></li>');
                }
            }
            if(filters['material[]'] !== undefined) {
                material = filters['material[]'].join(',');
                temp['material'] = material;
                for (var i = filters['material[]'].length - 1; i >= 0; i--) {
                    $('#selected-filters').append('<li class="list-inline-item">'+filters['material[]'][i]+' <a href="#" class="tag" id="material[]" data-value="'+filters['material[]'][i]+'" ></a></li>');
                }
            }
            if(filters['gemstone[]'] !== undefined) {
                gemstone = filters['gemstone[]'].join(',');
                temp['gemstone'] = gemstone;
                
                for (var i = filters['gemstone[]'].length - 1; i >= 0; i--) {
                    $('#selected-filters').append('<li class="list-inline-item">'+filters['gemstone[]'][i]+' <a href="#" class="tag" id="gemstone[]" data-value="'+filters['gemstone[]'][i]+'" ></a></li>');
                }
                
            }

            if (filters['sorting'] !== undefined) {
                // console.log(filters['sorting']);
                temp['sorting'] = filters['sorting'];
            }

            if (query) {
                temp['q'] = query;
            }
           
            if (sub_product_type) {
                url = url+'/'+sub_product_type;
                temp['sub_product_type'] = sub_product_type;
            }

            if (gender) {
                url = url+'/'+gender;
                temp['gender'] = gender;
            }

            if (product_type) {
                url = url+'/'+product_type;
                temp['product_type'] = product_type;
            }
            
            $('#clear-filters').css('display', 'block');

            queryString = '?'+jQuery.param( temp );
            // console.log(queryString);
            url = url+queryString;
            // url = window.location.pathname+queryString;
            window.history.pushState('obj', 'newtitle', url);

            
            var formURL = $(this).attr("action");
            $.ajax({
                url : formURL,
                type: "POST",
                data : temp,
                
                success:function(data, textStatus, jqXHR) {
                    // console.log(data);
                    var json = JSON.parse(data);
                    $("#products-section").html(json['html']); 
                    $("#products_count").html(json['products_count']); 
                   
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    alert('Not available');
                    //$(this.form).empty();
                    //$(this.form).html(errorThrown);
                }
            });
            e.preventDefault(); //STOP default action
        });


function sort_by(obj) {
    var id= obj.id;
    $( "#sort_by" ).val(id);
    $('#price_asc, #price_desc').parent('li').toggleClass('active');
    $("#ajaxfilter").trigger("change");
} 
   
});



</script>