; ModuleID = '/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/testcase_bc/function/Overlapping_Copy_Memory_Copy_BadCase05-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/function/Overlapping_Copy_Memory_Copy_BadCase05-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @TestBad2(i8* noundef %p) #0 !dbg !13 {
entry:
  %p.addr = alloca i8*, align 8
  %q = alloca i8*, align 8
  store i8* %p, i8** %p.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %p.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %q, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = load i8*, i8** %p.addr, align 8, !dbg !22
  %add.ptr = getelementptr inbounds i8, i8* %0, i64 2, !dbg !23
  store i8* %add.ptr, i8** %q, align 8, !dbg !21
  %1 = load i8*, i8** %p.addr, align 8, !dbg !24
  %2 = load i8*, i8** %q, align 8, !dbg !24
  %3 = load i8*, i8** %p.addr, align 8, !dbg !24
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !24
  %call = call i8* @__memcpy_chk(i8* noundef %1, i8* noundef %2, i64 noundef 3, i64 noundef %4) #4, !dbg !24
  ret void, !dbg !25
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @TestBad5() #0 !dbg !26 {
entry:
  %p = alloca i8*, align 8
  %q = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %p, metadata !29, metadata !DIExpression()), !dbg !30
  %call = call i8* @malloc(i64 noundef 60), !dbg !31
  store i8* %call, i8** %p, align 8, !dbg !30
  %0 = load i8*, i8** %p, align 8, !dbg !32
  %cmp = icmp eq i8* %0, null, !dbg !34
  br i1 %cmp, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  br label %return, !dbg !36

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %q, metadata !38, metadata !DIExpression()), !dbg !39
  %1 = load i8*, i8** %p, align 8, !dbg !40
  store i8* %1, i8** %q, align 8, !dbg !39
  %2 = load i8*, i8** %p, align 8, !dbg !41
  %3 = load i8*, i8** %q, align 8, !dbg !41
  %4 = load i8*, i8** %p, align 8, !dbg !41
  %5 = call i64 @llvm.objectsize.i64.p0i8(i8* %4, i1 false, i1 true, i1 false), !dbg !41
  %call1 = call i8* @__memcpy_chk(i8* noundef %2, i8* noundef %3, i64 noundef 3, i64 noundef %5) #4, !dbg !41
  %6 = load i8*, i8** %p, align 8, !dbg !42
  call void @free(i8* noundef %6), !dbg !43
  br label %return, !dbg !44

return:                                           ; preds = %if.end, %if.then
  ret void, !dbg !44
}

declare i8* @malloc(i64 noundef) #3

declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !45 {
entry:
  call void @TestBad5(), !dbg !49
  ret i32 0, !dbg !50
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/function/Overlapping_Copy_Memory_Copy_BadCase05-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"Homebrew clang version 14.0.6"}
!13 = distinct !DISubprogram(name: "TestBad2", scope: !14, file: !14, line: 9, type: !15, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "function/Overlapping_Copy_Memory_Copy_BadCase05-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!15 = !DISubroutineType(types: !16)
!16 = !{null, !3}
!17 = !{}
!18 = !DILocalVariable(name: "p", arg: 1, scope: !13, file: !14, line: 9, type: !3)
!19 = !DILocation(line: 9, column: 21, scope: !13)
!20 = !DILocalVariable(name: "q", scope: !13, file: !14, line: 11, type: !3)
!21 = !DILocation(line: 11, column: 11, scope: !13)
!22 = !DILocation(line: 11, column: 15, scope: !13)
!23 = !DILocation(line: 11, column: 17, scope: !13)
!24 = !DILocation(line: 13, column: 5, scope: !13)
!25 = !DILocation(line: 14, column: 1, scope: !13)
!26 = distinct !DISubprogram(name: "TestBad5", scope: !14, file: !14, line: 20, type: !27, scopeLine: 21, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!27 = !DISubroutineType(types: !28)
!28 = !{null}
!29 = !DILocalVariable(name: "p", scope: !26, file: !14, line: 22, type: !3)
!30 = !DILocation(line: 22, column: 11, scope: !26)
!31 = !DILocation(line: 22, column: 23, scope: !26)
!32 = !DILocation(line: 23, column: 9, scope: !33)
!33 = distinct !DILexicalBlock(scope: !26, file: !14, line: 23, column: 9)
!34 = !DILocation(line: 23, column: 11, scope: !33)
!35 = !DILocation(line: 23, column: 9, scope: !26)
!36 = !DILocation(line: 24, column: 9, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !14, line: 23, column: 20)
!38 = !DILocalVariable(name: "q", scope: !26, file: !14, line: 26, type: !3)
!39 = !DILocation(line: 26, column: 11, scope: !26)
!40 = !DILocation(line: 26, column: 15, scope: !26)
!41 = !DILocation(line: 28, column: 5, scope: !26)
!42 = !DILocation(line: 29, column: 10, scope: !26)
!43 = !DILocation(line: 29, column: 5, scope: !26)
!44 = !DILocation(line: 30, column: 1, scope: !26)
!45 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 32, type: !46, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!46 = !DISubroutineType(types: !47)
!47 = !{!48}
!48 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!49 = !DILocation(line: 33, column: 5, scope: !45)
!50 = !DILocation(line: 34, column: 1, scope: !45)
