class MarksController < ApplicationController
  include BooksHelper
  load_and_authorize_resource

  def create
    @book = Book.find_by id: params[:book_id]
    check_request_type @book, params[:status].to_i
    load_mark_button_class @book
    respond_to do |format|
      format.html{redirect_to @book}
      format.json {
        render json: {action: "read", book: @book, read: @read, reading: @reading}
      }
    end
  end

  def destroy
    @book = Book.find_by id: params[:book_id]
    @mark.destroy
    load_mark_button_class @book
    respond_to do |format|
      format.html{redirect_to @book}
      format.json {
        render json: {action: "reading", book: @book, read: @read, reading: @reading}
      }
    end
  end

  private
  def check_request_type book, status
    case status
    when Settings.books.marked_book.reading
      mark_reading book
    else
      mark_read book
    end
  end

  def mark_reading book
    if book.marked_reading? current_user
      book.destroy_marked_book
      flash[:warning] = t "books.mark_button.reading"
    else
      book.destroy_marked_book current_user if book.marked_read? current_user
      marked_book book, Settings.books.marked_book.reading
    end
  end

  def mark_read book
    if book.marked_read? current_user
      book.destroy_marked_book current_user
    else
      book.destroy_marked_book current_user if book.marked_reading? current_user
      marked_book book, Settings.books.marked_book.read
    end
  end

  def marked_book book, status
    book.marks.create user: current_user, status: status
  end
end
