<!-- PAGE BODY : BEGIN -->
<main class="main-content">
    <section class="hero full-height d-flex d-flex-row align-items-center bg-bright p-0">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-7">
                    <div class="hero-content text-center border p-4 bg-light">

                        <h1 class="title text-uppercase text-dark">
                            <i class="far fa-check-circle text-success display-2 inline-block mb-3"></i><br>
                            Success
                        </h1>

                        <p>Your payment has been processed successfully and your booking is confirmed.</p>

                        <p>Your payment is <strong><?php echo $paymentID;?></strong> and Order Number is <strong><?php echo $OrderlD;?></strong>.</p>

                <a href="<?php echo site_url()?>">
                        <button type="button" class="btn btn-brand btn-lg btn-block">Back to home page</button>
                    </a>
                    </div>
                </div>
            </div>
        </div>
	</section>
</main>