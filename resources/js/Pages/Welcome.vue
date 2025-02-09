<template>
  <div>
    <!-- Header Component -->
    <Header />

    <!-- Other Sections or Components -->
    <Banner />
    <ServicesInfo />
    <ServicesOffer />
    <Contact />
    <Footer />
  </div>
</template>

<script>
  import Header from '@/components/Header.vue';
  import Banner from '@/components/BannerLanding.vue'; 
  import ServicesInfo from '@/components/ServicesInformation.vue';
  import ServicesOffer from '@/components/ServicesOffer.vue';
  import Contact from '@/components/ContactUs.vue';
  import Footer from '@/components/Footer.vue';

  export default {
    components: {
      Header, 
      Banner,
      ServicesInfo,
      ServicesOffer,
      Contact,
      Footer,
    },
  };
</script>

