(function ($, _) {
    var ASI = window.ASI || {};

    var Pager = ASI.Pager = function ($el, options) {
        this.$el = $el;
        this.init(options);
    };

    Pager.prototype.options = {
        currentPage: 0,
        pageSize: 10,
        innerItemTag: 'tr',
        containerClass: 'pager',
        insertBefore: false,
        useNextPrev: false,
        pagerInsideContent: false
    };

    Pager.prototype.init = function (options) {
        $.extend(this.options, options);
        this.createPager().showCurrentPage();
        this.bindPageEvents();
    };

    Pager.prototype.bindPageEvents = function () {
        var that = this;
        if (this.options.useNextPrev) {



            var $nextButton = $('.list .title .nav a.nextTestimonial');
            var $previousButton = $('.list .title .nav a.previousTestimonial');
            $previousButton.on('click', function () {
                ASI.Pager.prototype.previousPage();
            });
            $nextButton.on('click', function () {
                ASI.Pager.prototype.nextPage();
            });
        } else {
            var $containers = $('.' + this.options.containerClass);
            $containers.find('a').on('click', function (evt) {
                var index = $(this).index();
                $containers.each(function () {
                    $(this).find('a.active').removeClass('active');
                    $(this).find('a').eq(index).addClass('active');
                });
                evt.preventDefault();
                var pageNumber = $(this).attr('data-index');
                ASI.Pager.prototype.showPage.call(that, pageNumber);
                window.location.hash = '#' + pageNumber;
            });
        }

    };

    Pager.prototype.getRows = _(function () {
        if (this.options.innerItemTag === 'tr') {
            return _(this.$el.find(this.options.innerItemTag)).rest(1);
        }
        else {
            return this.$el.find(this.options.innerItemTag);
        }

    }).memoize();

    Pager.prototype.getRowsForPage = _(function (pageNumber) {
        var start = this.options.currentPage * this.options.pageSize,
            end = start + this.options.pageSize;

        return this.getRows().slice(start, end);
    }).memoize();

    Pager.prototype.hideAll = function () {
        $(this.getRows()).hide();
        return this;
    };

    Pager.prototype.previousPage = function () {
        if (this.options.currentPage > 0) {
            this.showPage(this.options.currentPage - 1);
        }
    }

    Pager.prototype.nextPage = function () {
        var numberOfPages = this.getNumberOfPages();
        if (this.options.currentPage < numberOfPages - 1) {
            this.showPage(this.options.currentPage + 1);
        }
    };

    Pager.prototype.showCurrentPage = function () {
        this.hideAll();
        $(this.getRowsForPage(this.options.currentPage)).show();
        return this;
    };

    Pager.prototype.showPage = function (pageNumber) {
        this.options.currentPage = pageNumber;
        this.showCurrentPage();
    };

    Pager.prototype.getNumberOfPages = function () {
        return Math.ceil(this.getRows().length / this.options.pageSize);
    };

    Pager.prototype.createPager = function () {
        var pager = document.createDocumentFragment(),
            range = _.range(0, this.getNumberOfPages());

        _(range).each(function (pageIndex) {
            var pageLink = document.createElement('a');
            pageLink.href = "#";
            pageLink.textContent = String(pageIndex + 1);
            pageLink.setAttribute('data-index', pageIndex);
            pageLink.className = 'pageLink';
            pager.appendChild(pageLink);
        }, this);

        var target = this.options.pagerInsideContent ? ["prependTo", "appendTo"] : ["insertBefore", "insertAfter"];

        $('<div class="' + this.options.containerClass + '" />')[target[0]](this.$el).append(pager);

        if (!this.options.insertBefore) {
            $('.' + this.options.containerClass)[target[1]](this.$el);
        } else {
            $('.' + this.options.containerClass).clone()[target[1]](this.$el);
        }

        $('.' + this.options.containerClass).each(function () {
            $(this).find('a').first().addClass('active');
        });

        var pageNumber = window.location.hash.substr(1);

        if (pageNumber != '') {
            this.showPage(pageNumber);
            $('.project-landing-brand-view').hide();
            $('.project-landing-list-view').show();

            var $containers = $('.' + this.options.containerClass);
            $containers.find('a.active').removeClass('active');
            $containers.find('a').eq(pageNumber).addClass('active');
        }
        else {
            $('.project-landing-list-view').hide();
        }
           
        return this;
    };

    $.fn.page = function (options) {
        return new ASI.Pager(this, options);
    }
}(jQuery, _));