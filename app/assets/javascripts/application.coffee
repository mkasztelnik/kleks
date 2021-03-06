# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require jquery.turbolinks
#= require jquery-ui
#= require bootstrap-sprockets
#= require bootstrap-datepicker
#= require nprogress
#= require nprogress-turbolinks
#= require jquery.cookie
#= require jquery.cookiecuttr
#= require select2
#= require_tree .

$ ->
  # Flash
  if (flash = $(".flash-container")).length > 0
    flash.click -> $(@).fadeOut()
    flash.show()
    # setTimeout (-> flash.fadeOut()), 5000

  $('[data-behaviour~=datepicker]').datepicker
    "format": "yyyy-mm-dd",
    "weekStart": 1,
    "autoclose": true

  ## DELETE ITEM FROM LIST ##
  $('ul.well-list').on 'ajax:beforeSend', '.delete', (evt, xhr, settings) ->
    $(this).find('i').removeClass 'fa fa-remove'
    $(this).find('i').addClass 'fa fa-refresh fa-spin'

  $('ul.well-list').on 'ajax:success', '.delete', (evt, data, status, xhr) ->
    $(this).parent().parent().fadeOut()

  $('ul.well-list').on 'ajax:error', '.delete', (evt, data, status, xhr) ->
    $(this).find('i').removeClass 'fa fa-refresh fa-spin'
    $(this).find('i').addClass 'fa fa-remove'
    alert 'Unable to remove item'

  ## MODAL WINDOWS ##

  # called from a bootstrap dropdown, this closes the dropdown
  $('a[data-toggle=modal]').on 'click', ->
    $('.dropdown').removeClass('open')
  # this sets up the ajax loader, and it will stay until the method specific js removes it
  $('a[data-target=#ajax-modal]').on 'click', (e) ->
    e.preventDefault()
    e.stopPropagation()
    $.rails.handleRemote( $(this) )
  #rITEMemoves whatever is in the modal body content div upon clicking close/outside modal
  $(document).on 'click', '[data-dismiss=modal], .modal-scrollable', ->
    $('.modal-body-content').empty()
  $(document).on 'click', '#ajax-modal', (e) ->
    e.stopPropagation()

  ## datepicker defaults ##
  $.fn.datepicker.defaults.autoclose = true

  $(document).on 'click', '[data-hidden]', (e)->
    section = $('#' + $(this).attr('data-hidden'))
    if this.checked
      section.removeClass('hidden')
    else
      section.addClass('hidden')

  $(document).on 'click', '[data-unhidden]', (e)->
    section = $('#' + $(this).attr('data-unhidden'))
    if this.checked
      section.addClass('hidden')
    else
      section.removeClass('hidden')

  $.cookieCuttr
    cookieNotificationLocationBottom: true,
    cookieAnalytics: false,
    cookiePolicyLink: 'http://www.allaboutcookies.org',
    cookieAcceptButtonText: 'OK',
    cookieMessage: 'We use cookies on this website, you can <a href="{{cookiePolicyLink}}" title="read about our cookies">read about them here</a>'

  # Tooltips
  $('body').tooltip
    delay:
      show: 300
      hide: 0
    container: 'body'
    selector: '[title]'