; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Memset_Overflow_01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Memset_Overflow_01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %buffer1 = alloca [4 x i8], align 1
  %buffer2 = alloca [3 x i8], align 1
  %a = alloca i32, align 4
  %data = alloca i32, align 4
  %len = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [4 x i8]* %buffer1, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [3 x i8]* %buffer2, metadata !21, metadata !DIExpression()), !dbg !25
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 noundef 0), !dbg !26
  call void @srand(i32 noundef %call), !dbg !27
  call void @llvm.dbg.declare(metadata i32* %a, metadata !28, metadata !DIExpression()), !dbg !29
  %call1 = call i32 @rand(), !dbg !30
  %rem = srem i32 %call1, 5, !dbg !31
  store i32 %rem, i32* %a, align 4, !dbg !29
  call void @llvm.dbg.declare(metadata i32* %data, metadata !32, metadata !DIExpression()), !dbg !33
  store i32 0, i32* %data, align 4, !dbg !33
  br label %while.cond, !dbg !34

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, i32* %data, align 4, !dbg !35
  %1 = load i32, i32* %a, align 4, !dbg !36
  %cmp = icmp slt i32 %0, %1, !dbg !37
  br i1 %cmp, label %while.body, label %while.end, !dbg !34

while.body:                                       ; preds = %while.cond
  %2 = load i32, i32* %data, align 4, !dbg !38
  %inc = add nsw i32 %2, 1, !dbg !38
  store i32 %inc, i32* %data, align 4, !dbg !38
  br label %while.cond, !dbg !34, !llvm.loop !40

while.end:                                        ; preds = %while.cond
  %arraydecay = getelementptr inbounds [4 x i8], [4 x i8]* %buffer1, i64 0, i64 0, !dbg !43
  %3 = load i32, i32* %data, align 4, !dbg !43
  %conv = sext i32 %3 to i64, !dbg !43
  %call2 = call i8* @__memset_chk(i8* noundef %arraydecay, i32 noundef 97, i64 noundef %conv, i64 noundef 4) #4, !dbg !43
  %arraydecay3 = getelementptr inbounds [3 x i8], [3 x i8]* %buffer2, i64 0, i64 0, !dbg !44
  %4 = load i32, i32* %data, align 4, !dbg !44
  %conv4 = sext i32 %4 to i64, !dbg !44
  %call5 = call i8* @__memset_chk(i8* noundef %arraydecay3, i32 noundef 97, i64 noundef %conv4, i64 noundef 3) #4, !dbg !44
  call void @llvm.dbg.declare(metadata i32* %len, metadata !45, metadata !DIExpression()), !dbg !46
  %arraydecay6 = getelementptr inbounds [4 x i8], [4 x i8]* %buffer1, i64 0, i64 0, !dbg !47
  %call7 = call i64 @strlen(i8* noundef %arraydecay6), !dbg !48
  %conv8 = trunc i64 %call7 to i32, !dbg !48
  store i32 %conv8, i32* %len, align 4, !dbg !46
  %5 = load i32, i32* %retval, align 4, !dbg !49
  ret i32 %5, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @srand(i32 noundef) #2

declare i32 @time(...) #2

declare i32 @rand() #2

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #3

declare i64 @strlen(i8* noundef) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Memset_Overflow_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Memset_Overflow_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "buffer1", scope: !9, file: !10, line: 8, type: !16)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 32, elements: !18)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !{!19}
!19 = !DISubrange(count: 4)
!20 = !DILocation(line: 8, column: 7, scope: !9)
!21 = !DILocalVariable(name: "buffer2", scope: !9, file: !10, line: 9, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 24, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 3)
!25 = !DILocation(line: 9, column: 7, scope: !9)
!26 = !DILocation(line: 10, column: 8, scope: !9)
!27 = !DILocation(line: 10, column: 2, scope: !9)
!28 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 11, type: !13)
!29 = !DILocation(line: 11, column: 6, scope: !9)
!30 = !DILocation(line: 11, column: 10, scope: !9)
!31 = !DILocation(line: 11, column: 17, scope: !9)
!32 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 13, type: !13)
!33 = !DILocation(line: 13, column: 9, scope: !9)
!34 = !DILocation(line: 14, column: 5, scope: !9)
!35 = !DILocation(line: 14, column: 12, scope: !9)
!36 = !DILocation(line: 14, column: 19, scope: !9)
!37 = !DILocation(line: 14, column: 17, scope: !9)
!38 = !DILocation(line: 15, column: 13, scope: !39)
!39 = distinct !DILexicalBlock(scope: !9, file: !10, line: 14, column: 22)
!40 = distinct !{!40, !34, !41, !42}
!41 = !DILocation(line: 16, column: 5, scope: !9)
!42 = !{!"llvm.loop.mustprogress"}
!43 = !DILocation(line: 18, column: 2, scope: !9)
!44 = !DILocation(line: 19, column: 2, scope: !9)
!45 = !DILocalVariable(name: "len", scope: !9, file: !10, line: 20, type: !13)
!46 = !DILocation(line: 20, column: 6, scope: !9)
!47 = !DILocation(line: 20, column: 19, scope: !9)
!48 = !DILocation(line: 20, column: 12, scope: !9)
!49 = !DILocation(line: 21, column: 1, scope: !9)
