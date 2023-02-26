; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_13-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_13-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %src = alloca [200 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [200 x i8]* %src, metadata !15, metadata !DIExpression()), !dbg !20
  %arraydecay = getelementptr inbounds [200 x i8], [200 x i8]* %src, i64 0, i64 0, !dbg !21
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 97, i64 200, i1 false), !dbg !21
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !22, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i32* %a, metadata !27, metadata !DIExpression()), !dbg !28
  %call = call i32 (i8*, ...) @scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %a), !dbg !29
  call void @llvm.dbg.declare(metadata i32* %b, metadata !30, metadata !DIExpression()), !dbg !31
  store i32 -1, i32* %b, align 4, !dbg !31
  %0 = load i32, i32* %a, align 4, !dbg !32
  %1 = load i32, i32* %b, align 4, !dbg !33
  %mul = mul nsw i32 %0, %1, !dbg !34
  store i32 %mul, i32* %b, align 4, !dbg !35
  %2 = load i32, i32* %a, align 4, !dbg !36
  %cmp = icmp sgt i32 %2, -100, !dbg !38
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !39

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* %a, align 4, !dbg !40
  %cmp1 = icmp sle i32 %3, 0, !dbg !41
  br i1 %cmp1, label %if.then, label %if.else, !dbg !42

if.then:                                          ; preds = %land.lhs.true
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !43
  %arraydecay3 = getelementptr inbounds [200 x i8], [200 x i8]* %src, i64 0, i64 0, !dbg !43
  %4 = load i32, i32* %b, align 4, !dbg !43
  %conv = sext i32 %4 to i64, !dbg !43
  %call4 = call i8* @__strncpy_chk(i8* noundef %arraydecay2, i8* noundef %arraydecay3, i64 noundef %conv, i64 noundef 100) #5, !dbg !43
  br label %if.end, !dbg !45

if.else:                                          ; preds = %land.lhs.true, %entry
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !46
  %arraydecay6 = getelementptr inbounds [200 x i8], [200 x i8]* %src, i64 0, i64 0, !dbg !46
  %5 = load i32, i32* %b, align 4, !dbg !46
  %conv7 = sext i32 %5 to i64, !dbg !46
  %call8 = call i8* @__strncpy_chk(i8* noundef %arraydecay5, i8* noundef %arraydecay6, i64 noundef %conv7, i64 noundef 100) #5, !dbg !46
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %6 = load i32, i32* %retval, align 4, !dbg !48
  ret i32 %6, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare i32 @scanf(i8* noundef, ...) #3

; Function Attrs: nounwind
declare i8* @__strncpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #4

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_13-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_13-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "src", scope: !9, file: !10, line: 8, type: !16)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !18)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !{!19}
!19 = !DISubrange(count: 200)
!20 = !DILocation(line: 8, column: 7, scope: !9)
!21 = !DILocation(line: 9, column: 2, scope: !9)
!22 = !DILocalVariable(name: "dest", scope: !9, file: !10, line: 10, type: !23)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 100)
!26 = !DILocation(line: 10, column: 7, scope: !9)
!27 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 12, type: !13)
!28 = !DILocation(line: 12, column: 6, scope: !9)
!29 = !DILocation(line: 13, column: 2, scope: !9)
!30 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 14, type: !13)
!31 = !DILocation(line: 14, column: 9, scope: !9)
!32 = !DILocation(line: 15, column: 9, scope: !9)
!33 = !DILocation(line: 15, column: 13, scope: !9)
!34 = !DILocation(line: 15, column: 11, scope: !9)
!35 = !DILocation(line: 15, column: 7, scope: !9)
!36 = !DILocation(line: 16, column: 9, scope: !37)
!37 = distinct !DILexicalBlock(scope: !9, file: !10, line: 16, column: 9)
!38 = !DILocation(line: 16, column: 11, scope: !37)
!39 = !DILocation(line: 16, column: 18, scope: !37)
!40 = !DILocation(line: 16, column: 21, scope: !37)
!41 = !DILocation(line: 16, column: 23, scope: !37)
!42 = !DILocation(line: 16, column: 9, scope: !9)
!43 = !DILocation(line: 18, column: 9, scope: !44)
!44 = distinct !DILexicalBlock(scope: !37, file: !10, line: 16, column: 29)
!45 = !DILocation(line: 19, column: 5, scope: !44)
!46 = !DILocation(line: 22, column: 9, scope: !47)
!47 = distinct !DILexicalBlock(scope: !37, file: !10, line: 20, column: 10)
!48 = !DILocation(line: 24, column: 1, scope: !9)
