# encoding: utf-8

class SubscribeController < ApplicationController
  respond_to :html, :json
  def new
    return redirect_to home_path if params[:subscribe].blank? or params[:subscribe].empty?
    subscribe = Subscribe.new(params[:subscribe])   
    return redirect_to request.env['HTTP_REFERER'], alert: 'Вы успешно подписались на обновления.' if subscribe.save

    return redirect_to home_path, notice: "Возникла ошибка =(" if subscribe.errors.any?  
  end
  
  def destroy
    sub = Subscribe.find(params[:id])
    sub.destroy
    redirect_to request.env['HTTP_REFERER'], notice:"Подписчик удален!"

  end
end
