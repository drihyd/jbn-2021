$(document).ready(function () {
    var i = 0;
    var dropdownClild = $('.dropdown-item ul li ul');
    $('.dropdown-menu').find(dropdownClild).each(function(){
        $(this).addClass('collapse');
        $(this).attr('id','collapseMenu' + i);
        $(this).parent().addClass('data-collapse collapsed')
        .attr('data-toggle','collapse')
        .attr('data-target','#collapseMenu' + i);
        i++;
    });
    $(document).on('click', '.data-collapse', function (e) {
        e.stopPropagation();
    });
});
