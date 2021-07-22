<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link
      href="${pageContext.request.contextPath}/resources/static/tailwind.css"
      type="text/css"
      rel="stylesheet"
    />
  </head>
  <body class="max-w-full">
    <header class="text-gray-600 body-font">
      <div
        class="
          container
          mx-auto
          flex flex-wrap
          justify-between
          p-5
          flex-col
          md:flex-row
          items-center
        "
      >
        <div class="flex">
          <a
            class="
              flex
              title-font
              font-medium
              items-center
              text-gray-900
              mb-4
              md:mb-0
            "
          >
           <img
              src="${pageContext.request.contextPath}/resources/img/potstand_logo.svg"
              alt=""
              class="fill-current text-red-500 w-12"
            />
            <span class="ml-3 text-xl">POTSTAND</span>
          </a>
          <form>
            <div class="flex justify-center mt-2 mr-4 ml-4">
              <div class="relative flex w-full flex-wrap items-stretch mb-3">
                <input
                  type="text"
                  placeholder="제목, 저자, 출판사 검색"
                  class="
                    form-input
                    px-3
                    py-2
                    placeholder-gray-400
                    text-gray-700
                    relative
                    bg-white
                    rounded-lg
                    text-sm
                    shadow
                    outline-none
                    focus:outline-none
                    focus:shadow-outline
                    w-full
                    pr-10
                  "
                />
                <span
                  class="
                    z-10
                    h-full
                    leading-snug
                    font-normal
                    text-center text-gray-400
                    absolute
                    bg-transparent
                    rounded
                    text-base
                    items-center
                    justify-center
                    w-8
                    right-0
                    pr-3
                    py-3
                  "
                >
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    class="h-5 w-5 -mt-1"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
                    />
                  </svg>
                </span>
              </div>
            </div>
          </form>
        </div>
        <div>
          <button
            class="
              inline-flex
              items-center
              bg-gray-100
              border-0
              py-1
              px-3
              focus:outline-none
              hover:bg-red-400
              hover:text-white
              rounded
              text-base
              mt-4
              md:mt-0
            "
          >
            Sign in
            <svg
              fill="none"
              stroke="currentColor"
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              class="w-4 h-4 ml-1"
              viewBox="0 0 24 24"
            >
              <path d="M5 12h14M12 5l7 7-7 7"></path>
            </svg>
          </button>
        </div>
      </div>
      <div class="container flex flex-start p-5 mx-auto">
        <nav class="md:mr-auto flex flex-wrap items-center text-base">
          <a href="#" class="mr-5 hover:text-gray-900">HOME</a>
          <a href="#" class="mr-5 hover:text-gray-900">BOOK</a>
          <a href="#" class="mr-5 hover:text-gray-900">EVENT</a>
        </nav>
      </div>
    </header>
    <section class="text-gray-600 body-font">
      <div class="container px-5 py-24 mx-auto">
        <div class="flex flex-wrap w-full mb-20">
          <div class="lg:w-1/2 w-full mb-6 lg:mb-0">
            <h1
              class="
                sm:text-3xl
                text-2xl
                font-medium
                title-font
                mb-2
                text-gray-900
              "
            >
              Pitchfork Kickstarter Taxidermy
            </h1>
            <div class="h-1 w-20 bg-red-500 rounded"></div>
          </div>
          <p class="lg:w-1/2 w-full leading-relaxed text-gray-500">
            Whatever cardigan tote bag tumblr hexagon brooklyn asymmetrical
            gentrify, subway tile poke farm-to-table. Franzen you probably
            haven't heard of them man bun deep jianbing selfies heirloom prism
            food truck ugh squid celiac humblebrag.
          </p>
        </div>
        <div class="flex flex-wrap -m-4">
          <div class="xl:w-1/4 md:w-1/2 p-4">
            <div class="bg-gray-100 p-6 rounded-lg">
              <img
                class="h-40 rounded w-full object-cover object-center mb-6"
                src="https://dummyimage.com/720x400"
                alt="content"
              />
              <h3
                class="
                  tracking-widest
                  text-red-500 text-xs
                  font-medium
                  title-font
                "
              >
                SUBTITLE
              </h3>
              <h2 class="text-lg text-gray-900 font-medium title-font mb-4">
                Chichen Itza
              </h2>
              <p class="leading-relaxed text-base">
                Fingerstache flexitarian street art 8-bit waistcoat. Distillery
                hexagon disrupt edison bulbche.
              </p>
            </div>
          </div>
          <div class="xl:w-1/4 md:w-1/2 p-4">
            <div class="bg-gray-100 p-6 rounded-lg">
              <img
                class="h-40 rounded w-full object-cover object-center mb-6"
                src="https://dummyimage.com/721x401"
                alt="content"
              />
              <h3
                class="
                  tracking-widest
                  text-red-500 text-xs
                  font-medium
                  title-font
                "
              >
                SUBTITLE
              </h3>
              <h2 class="text-lg text-gray-900 font-medium title-font mb-4">
                Colosseum Roma
              </h2>
              <p class="leading-relaxed text-base">
                Fingerstache flexitarian street art 8-bit waistcoat. Distillery
                hexagon disrupt edison bulbche.
              </p>
            </div>
          </div>
          <div class="xl:w-1/4 md:w-1/2 p-4">
            <div class="bg-gray-100 p-6 rounded-lg">
              <img
                class="h-40 rounded w-full object-cover object-center mb-6"
                src="https://dummyimage.com/722x402"
                alt="content"
              />
              <h3
                class="
                  tracking-widest
                  text-red-500 text-xs
                  font-medium
                  title-font
                "
              >
                SUBTITLE
              </h3>
              <h2 class="text-lg text-gray-900 font-medium title-font mb-4">
                Great Pyramid of Giza
              </h2>
              <p class="leading-relaxed text-base">
                Fingerstache flexitarian street art 8-bit waistcoat. Distillery
                hexagon disrupt edison bulbche.
              </p>
            </div>
          </div>
          <div class="xl:w-1/4 md:w-1/2 p-4">
            <div class="bg-gray-100 p-6 rounded-lg">
              <img
                class="h-40 rounded w-full object-cover object-center mb-6"
                src="https://dummyimage.com/723x403"
                alt="content"
              />
              <h3
                class="
                  tracking-widest
                  text-red-500 text-xs
                  font-medium
                  title-font
                "
              >
                SUBTITLE
              </h3>
              <h2 class="text-lg text-gray-900 font-medium title-font mb-4">
                San Francisco
              </h2>
              <p class="leading-relaxed text-base">
                Fingerstache flexitarian street art 8-bit waistcoat. Distillery
                hexagon disrupt edison bulbche.
              </p>
            </div>
          </div>
        </div>
      </div>
    </section>
    <footer class="text-gray-600 body-font">
      <div
        class="
          container
          px-5
          py-24
          mx-auto
          flex
          md:items-center
          lg:items-start
          md:flex-row md:flex-nowrap
          flex-wrap flex-col
        "
      >
        <div
          class="w-64 flex-shrink-0 md:mx-0 mx-auto text-center md:text-left"
        >
          <a
            class="
              flex
              title-font
              font-medium
              items-center
              md:justify-start
              justify-center
              text-gray-900
            "
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              fill="none"
              stroke="currentColor"
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              class="w-10 h-10 text-white p-2 bg-red-500 rounded-full"
              viewBox="0 0 24 24"
            >
              <path
                d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"
              ></path>
            </svg>
            <span class="ml-3 text-xl">Tailblocks</span>
          </a>
          <p class="mt-2 text-sm text-gray-500">
            Air plant banjo lyft occupy retro adaptogen indego
          </p>
        </div>
        <div
          class="
            flex-grow flex flex-wrap
            md:pl-20
            -mb-10
            md:mt-0
            mt-10
            md:text-left
            text-center
          "
        >
          <div class="lg:w-1/4 md:w-1/2 w-full px-4">
            <h2
              class="
                title-font
                font-medium
                text-gray-900
                tracking-widest
                text-sm
                mb-3
              "
            >
              CATEGORIES
            </h2>
            <nav class="list-none mb-10">
              <li>
                <a class="text-gray-600 hover:text-gray-800">First Link</a>
              </li>
              <li>
                <a class="text-gray-600 hover:text-gray-800">Second Link</a>
              </li>
              <li>
                <a class="text-gray-600 hover:text-gray-800">Third Link</a>
              </li>
              <li>
                <a class="text-gray-600 hover:text-gray-800">Fourth Link</a>
              </li>
            </nav>
          </div>
          <div class="lg:w-1/4 md:w-1/2 w-full px-4">
            <h2
              class="
                title-font
                font-medium
                text-gray-900
                tracking-widest
                text-sm
                mb-3
              "
            >
              CATEGORIES
            </h2>
            <nav class="list-none mb-10">
              <li>
                <a class="text-gray-600 hover:text-gray-800">First Link</a>
              </li>
              <li>
                <a class="text-gray-600 hover:text-gray-800">Second Link</a>
              </li>
              <li>
                <a class="text-gray-600 hover:text-gray-800">Third Link</a>
              </li>
              <li>
                <a class="text-gray-600 hover:text-gray-800">Fourth Link</a>
              </li>
            </nav>
          </div>
          <div class="lg:w-1/4 md:w-1/2 w-full px-4">
            <h2
              class="
                title-font
                font-medium
                text-gray-900
                tracking-widest
                text-sm
                mb-3
              "
            >
              CATEGORIES
            </h2>
            <nav class="list-none mb-10">
              <li>
                <a class="text-gray-600 hover:text-gray-800">First Link</a>
              </li>
              <li>
                <a class="text-gray-600 hover:text-gray-800">Second Link</a>
              </li>
              <li>
                <a class="text-gray-600 hover:text-gray-800">Third Link</a>
              </li>
              <li>
                <a class="text-gray-600 hover:text-gray-800">Fourth Link</a>
              </li>
            </nav>
          </div>
          <div class="lg:w-1/4 md:w-1/2 w-full px-4">
            <h2
              class="
                title-font
                font-medium
                text-gray-900
                tracking-widest
                text-sm
                mb-3
              "
            >
              CATEGORIES
            </h2>
            <nav class="list-none mb-10">
              <li>
                <a class="text-gray-600 hover:text-gray-800">First Link</a>
              </li>
              <li>
                <a class="text-gray-600 hover:text-gray-800">Second Link</a>
              </li>
              <li>
                <a class="text-gray-600 hover:text-gray-800">Third Link</a>
              </li>
              <li>
                <a class="text-gray-600 hover:text-gray-800">Fourth Link</a>
              </li>
            </nav>
          </div>
        </div>
      </div>
      <div class="bg-gray-100">
        <div
          class="
            container
            mx-auto
            py-4
            px-5
            flex flex-wrap flex-col
            sm:flex-row
          "
        >
          <p class="text-gray-500 text-sm text-center sm:text-left">
            © 2020 Tailblocks —
            <a
              href="https://twitter.com/knyttneve"
              rel="noopener noreferrer"
              class="text-gray-600 ml-1"
              target="_blank"
              >@knyttneve</a
            >
          </p>
          <span
            class="
              inline-flex
              sm:ml-auto
              sm:mt-0
              mt-2
              justify-center
              sm:justify-start
            "
          >
            <a class="text-gray-500">
              <svg
                fill="currentColor"
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                class="w-5 h-5"
                viewBox="0 0 24 24"
              >
                <path
                  d="M18 2h-3a5 5 0 00-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 011-1h3z"
                ></path>
              </svg>
            </a>
            <a class="ml-3 text-gray-500">
              <svg
                fill="currentColor"
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                class="w-5 h-5"
                viewBox="0 0 24 24"
              >
                <path
                  d="M23 3a10.9 10.9 0 01-3.14 1.53 4.48 4.48 0 00-7.86 3v1A10.66 10.66 0 013 4s-4 9 5 13a11.64 11.64 0 01-7 2c9 5 20 0 20-11.5a4.5 4.5 0 00-.08-.83A7.72 7.72 0 0023 3z"
                ></path>
              </svg>
            </a>
            <a class="ml-3 text-gray-500">
              <svg
                fill="none"
                stroke="currentColor"
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                class="w-5 h-5"
                viewBox="0 0 24 24"
              >
                <rect width="20" height="20" x="2" y="2" rx="5" ry="5"></rect>
                <path
                  d="M16 11.37A4 4 0 1112.63 8 4 4 0 0116 11.37zm1.5-4.87h.01"
                ></path>
              </svg>
            </a>
            <a class="ml-3 text-gray-500">
              <svg
                fill="currentColor"
                stroke="currentColor"
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="0"
                class="w-5 h-5"
                viewBox="0 0 24 24"
              >
                <path
                  stroke="none"
                  d="M16 8a6 6 0 016 6v7h-4v-7a2 2 0 00-2-2 2 2 0 00-2 2v7h-4v-7a6 6 0 016-6zM2 9h4v12H2z"
                ></path>
                <circle cx="4" cy="4" r="2" stroke="none"></circle>
              </svg>
            </a>
          </span>
        </div>
      </div>
    </footer>
  </body>
</html>
