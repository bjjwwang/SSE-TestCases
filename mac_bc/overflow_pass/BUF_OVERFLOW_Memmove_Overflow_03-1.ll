; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Memmove_Overflow_03-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Memmove_Overflow_03-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %dest = alloca i8*, align 8
  %src = alloca i8*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !15, metadata !DIExpression()), !dbg !16
  store i32 0, i32* %a, align 4, !dbg !16
  call void @llvm.dbg.declare(metadata i32* %b, metadata !17, metadata !DIExpression()), !dbg !18
  store i32 0, i32* %b, align 4, !dbg !18
  br label %while.cond, !dbg !19

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, i32* %a, align 4, !dbg !20
  %cmp = icmp slt i32 %0, 10, !dbg !21
  br i1 %cmp, label %while.body, label %while.end, !dbg !19

while.body:                                       ; preds = %while.cond
  %1 = load i32, i32* %a, align 4, !dbg !22
  %inc = add nsw i32 %1, 1, !dbg !22
  store i32 %inc, i32* %a, align 4, !dbg !22
  %2 = load i32, i32* %b, align 4, !dbg !24
  %add = add nsw i32 %2, 2, !dbg !25
  store i32 %add, i32* %b, align 4, !dbg !26
  br label %while.cond, !dbg !19, !llvm.loop !27

while.end:                                        ; preds = %while.cond
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !30, metadata !DIExpression()), !dbg !33
  %3 = load i32, i32* %a, align 4, !dbg !34
  %conv = sext i32 %3 to i64, !dbg !34
  %call = call i8* @malloc(i64 noundef %conv) #5, !dbg !35
  store i8* %call, i8** %dest, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata i8** %src, metadata !36, metadata !DIExpression()), !dbg !37
  %4 = load i32, i32* %b, align 4, !dbg !38
  %conv1 = sext i32 %4 to i64, !dbg !38
  %call2 = call i8* @malloc(i64 noundef %conv1) #5, !dbg !39
  store i8* %call2, i8** %src, align 8, !dbg !37
  %5 = load i8*, i8** %src, align 8, !dbg !40
  %6 = load i32, i32* %b, align 4, !dbg !40
  %conv3 = sext i32 %6 to i64, !dbg !40
  %7 = load i8*, i8** %src, align 8, !dbg !40
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !40
  %call4 = call i8* @__memset_chk(i8* noundef %5, i32 noundef 97, i64 noundef %conv3, i64 noundef %8) #6, !dbg !40
  %9 = load i8*, i8** %src, align 8, !dbg !41
  %10 = load i32, i32* %b, align 4, !dbg !42
  %sub = sub nsw i32 %10, 1, !dbg !43
  %idxprom = sext i32 %sub to i64, !dbg !41
  %arrayidx = getelementptr inbounds i8, i8* %9, i64 %idxprom, !dbg !41
  store i8 0, i8* %arrayidx, align 1, !dbg !44
  %11 = load i8*, i8** %dest, align 8, !dbg !45
  %12 = load i8*, i8** %src, align 8, !dbg !45
  %13 = load i8*, i8** %src, align 8, !dbg !45
  %call5 = call i64 @strlen(i8* noundef %13), !dbg !45
  %add6 = add i64 %call5, 1, !dbg !45
  %14 = load i8*, i8** %dest, align 8, !dbg !45
  %15 = call i64 @llvm.objectsize.i64.p0i8(i8* %14, i1 false, i1 true, i1 false), !dbg !45
  %call7 = call i8* @__memmove_chk(i8* noundef %11, i8* noundef %12, i64 noundef %add6, i64 noundef %15) #6, !dbg !45
  %16 = load i32, i32* %retval, align 4, !dbg !46
  ret i32 %16, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @strlen(i8* noundef) #4

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { allocsize(0) }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Memmove_Overflow_03-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Memmove_Overflow_03-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 8, type: !13)
!16 = !DILocation(line: 8, column: 6, scope: !9)
!17 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 9, type: !13)
!18 = !DILocation(line: 9, column: 9, scope: !9)
!19 = !DILocation(line: 10, column: 5, scope: !9)
!20 = !DILocation(line: 10, column: 11, scope: !9)
!21 = !DILocation(line: 10, column: 13, scope: !9)
!22 = !DILocation(line: 11, column: 10, scope: !23)
!23 = distinct !DILexicalBlock(scope: !9, file: !10, line: 10, column: 19)
!24 = !DILocation(line: 12, column: 13, scope: !23)
!25 = !DILocation(line: 12, column: 15, scope: !23)
!26 = !DILocation(line: 12, column: 11, scope: !23)
!27 = distinct !{!27, !19, !28, !29}
!28 = !DILocation(line: 13, column: 5, scope: !9)
!29 = !{!"llvm.loop.mustprogress"}
!30 = !DILocalVariable(name: "dest", scope: !9, file: !10, line: 15, type: !31)
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!32 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!33 = !DILocation(line: 15, column: 8, scope: !9)
!34 = !DILocation(line: 15, column: 22, scope: !9)
!35 = !DILocation(line: 15, column: 15, scope: !9)
!36 = !DILocalVariable(name: "src", scope: !9, file: !10, line: 16, type: !31)
!37 = !DILocation(line: 16, column: 8, scope: !9)
!38 = !DILocation(line: 16, column: 21, scope: !9)
!39 = !DILocation(line: 16, column: 14, scope: !9)
!40 = !DILocation(line: 17, column: 2, scope: !9)
!41 = !DILocation(line: 18, column: 2, scope: !9)
!42 = !DILocation(line: 18, column: 6, scope: !9)
!43 = !DILocation(line: 18, column: 8, scope: !9)
!44 = !DILocation(line: 18, column: 13, scope: !9)
!45 = !DILocation(line: 19, column: 2, scope: !9)
!46 = !DILocation(line: 20, column: 1, scope: !9)
