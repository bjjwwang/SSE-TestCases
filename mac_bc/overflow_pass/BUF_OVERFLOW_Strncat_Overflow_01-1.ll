; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Strncat_Overflow_01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Strncat_Overflow_01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [6 x i8] c"Hello\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !12 {
entry:
  %retval = alloca i32, align 4
  %dest = alloca i8*, align 8
  %src = alloca i8*, align 8
  %r = alloca i32, align 4
  %a = alloca i8, align 1
  %a_as_int = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !17, metadata !DIExpression()), !dbg !19
  %call = call i8* @malloc(i64 noundef 128) #5, !dbg !20
  store i8* %call, i8** %dest, align 8, !dbg !19
  %0 = load i8*, i8** %dest, align 8, !dbg !21
  %1 = load i8*, i8** %dest, align 8, !dbg !21
  %2 = call i64 @llvm.objectsize.i64.p0i8(i8* %1, i1 false, i1 true, i1 false), !dbg !21
  %call1 = call i8* @__strcpy_chk(i8* noundef %0, i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 noundef %2) #6, !dbg !21
  call void @llvm.dbg.declare(metadata i8** %src, metadata !22, metadata !DIExpression()), !dbg !23
  %call2 = call i8* @malloc(i64 noundef 128) #5, !dbg !24
  store i8* %call2, i8** %src, align 8, !dbg !23
  %3 = load i8*, i8** %src, align 8, !dbg !25
  %4 = load i8*, i8** %src, align 8, !dbg !25
  %5 = call i64 @llvm.objectsize.i64.p0i8(i8* %4, i1 false, i1 true, i1 false), !dbg !25
  %call3 = call i8* @__memset_chk(i8* noundef %3, i32 noundef 97, i64 noundef 128, i64 noundef %5) #6, !dbg !25
  %6 = load i8*, i8** %src, align 8, !dbg !26
  %arrayidx = getelementptr inbounds i8, i8* %6, i64 127, !dbg !26
  store i8 0, i8* %arrayidx, align 1, !dbg !27
  %call4 = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 noundef 0), !dbg !28
  call void @srand(i32 noundef %call4), !dbg !29
  call void @llvm.dbg.declare(metadata i32* %r, metadata !30, metadata !DIExpression()), !dbg !31
  %call5 = call i32 @rand(), !dbg !32
  %rem = srem i32 %call5, 128, !dbg !33
  store i32 %rem, i32* %r, align 4, !dbg !31
  call void @llvm.dbg.declare(metadata i8* %a, metadata !34, metadata !DIExpression()), !dbg !35
  %7 = load i32, i32* %r, align 4, !dbg !36
  %conv = trunc i32 %7 to i8, !dbg !37
  store i8 %conv, i8* %a, align 1, !dbg !35
  call void @llvm.dbg.declare(metadata i32* %a_as_int, metadata !38, metadata !DIExpression()), !dbg !39
  %8 = load i8, i8* %a, align 1, !dbg !40
  %conv6 = sext i8 %8 to i32, !dbg !41
  store i32 %conv6, i32* %a_as_int, align 4, !dbg !39
  %9 = load i8, i8* %a, align 1, !dbg !42
  %conv7 = sext i8 %9 to i32, !dbg !42
  %cmp = icmp sge i32 %conv7, 97, !dbg !44
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !45

land.lhs.true:                                    ; preds = %entry
  %10 = load i8, i8* %a, align 1, !dbg !46
  %conv9 = sext i8 %10 to i32, !dbg !46
  %cmp10 = icmp sle i32 %conv9, 122, !dbg !47
  br i1 %cmp10, label %if.then, label %if.else, !dbg !48

if.then:                                          ; preds = %land.lhs.true
  %11 = load i8*, i8** %dest, align 8, !dbg !49
  %12 = load i8*, i8** %src, align 8, !dbg !49
  %13 = load i32, i32* %a_as_int, align 4, !dbg !49
  %conv12 = sext i32 %13 to i64, !dbg !49
  %14 = load i8*, i8** %dest, align 8, !dbg !49
  %15 = call i64 @llvm.objectsize.i64.p0i8(i8* %14, i1 false, i1 true, i1 false), !dbg !49
  %call13 = call i8* @__strncat_chk(i8* noundef %11, i8* noundef %12, i64 noundef %conv12, i64 noundef %15) #6, !dbg !49
  br label %if.end, !dbg !51

if.else:                                          ; preds = %land.lhs.true, %entry
  %16 = load i8*, i8** %dest, align 8, !dbg !52
  %17 = load i8*, i8** %src, align 8, !dbg !52
  %18 = load i32, i32* %a_as_int, align 4, !dbg !52
  %conv14 = sext i32 %18 to i64, !dbg !52
  %19 = load i8*, i8** %dest, align 8, !dbg !52
  %20 = call i64 @llvm.objectsize.i64.p0i8(i8* %19, i1 false, i1 true, i1 false), !dbg !52
  %call15 = call i8* @__strncat_chk(i8* noundef %16, i8* noundef %17, i64 noundef %conv14, i64 noundef %20) #6, !dbg !52
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %21 = load i32, i32* %retval, align 4, !dbg !54
  ret i32 %21, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: nounwind
declare i8* @__strcpy_chk(i8* noundef, i8* noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #3

declare void @srand(i32 noundef) #4

declare i32 @time(...) #4

declare i32 @rand() #4

; Function Attrs: nounwind
declare i8* @__strncat_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { allocsize(0) }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Strncat_Overflow_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !4}
!3 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"PIC Level", i32 2}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"Homebrew clang version 14.0.6"}
!12 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 7, type: !14, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!13 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Strncat_Overflow_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!14 = !DISubroutineType(types: !15)
!15 = !{!4}
!16 = !{}
!17 = !DILocalVariable(name: "dest", scope: !12, file: !13, line: 8, type: !18)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!19 = !DILocation(line: 8, column: 8, scope: !12)
!20 = !DILocation(line: 8, column: 15, scope: !12)
!21 = !DILocation(line: 9, column: 2, scope: !12)
!22 = !DILocalVariable(name: "src", scope: !12, file: !13, line: 10, type: !18)
!23 = !DILocation(line: 10, column: 8, scope: !12)
!24 = !DILocation(line: 10, column: 14, scope: !12)
!25 = !DILocation(line: 11, column: 2, scope: !12)
!26 = !DILocation(line: 12, column: 2, scope: !12)
!27 = !DILocation(line: 12, column: 11, scope: !12)
!28 = !DILocation(line: 14, column: 11, scope: !12)
!29 = !DILocation(line: 14, column: 5, scope: !12)
!30 = !DILocalVariable(name: "r", scope: !12, file: !13, line: 15, type: !4)
!31 = !DILocation(line: 15, column: 6, scope: !12)
!32 = !DILocation(line: 15, column: 10, scope: !12)
!33 = !DILocation(line: 15, column: 17, scope: !12)
!34 = !DILocalVariable(name: "a", scope: !12, file: !13, line: 16, type: !3)
!35 = !DILocation(line: 16, column: 10, scope: !12)
!36 = !DILocation(line: 16, column: 20, scope: !12)
!37 = !DILocation(line: 16, column: 14, scope: !12)
!38 = !DILocalVariable(name: "a_as_int", scope: !12, file: !13, line: 17, type: !4)
!39 = !DILocation(line: 17, column: 9, scope: !12)
!40 = !DILocation(line: 17, column: 25, scope: !12)
!41 = !DILocation(line: 17, column: 20, scope: !12)
!42 = !DILocation(line: 18, column: 9, scope: !43)
!43 = distinct !DILexicalBlock(scope: !12, file: !13, line: 18, column: 9)
!44 = !DILocation(line: 18, column: 11, scope: !43)
!45 = !DILocation(line: 18, column: 18, scope: !43)
!46 = !DILocation(line: 18, column: 21, scope: !43)
!47 = !DILocation(line: 18, column: 23, scope: !43)
!48 = !DILocation(line: 18, column: 9, scope: !12)
!49 = !DILocation(line: 20, column: 3, scope: !50)
!50 = distinct !DILexicalBlock(scope: !43, file: !13, line: 18, column: 31)
!51 = !DILocation(line: 21, column: 5, scope: !50)
!52 = !DILocation(line: 24, column: 3, scope: !53)
!53 = distinct !DILexicalBlock(scope: !43, file: !13, line: 22, column: 7)
!54 = !DILocation(line: 26, column: 1, scope: !12)
