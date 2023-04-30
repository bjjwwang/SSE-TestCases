; ModuleID = '/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/testcase_bc/function/Unsafe_IoFunction_of_String_Buffer_BadCase01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/function/Unsafe_IoFunction_of_String_Buffer_BadCase01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.Unsafe_IoFunction_of_String_Buffer_case01_Bad_01.cmd = private unnamed_addr constant [20 x i8] c"/usr/bin/cat\00\00\00\00\00\00\00\00", align 16
@__const.main.userinput = private unnamed_addr constant [10 x i8] c"hello\00\00\00\00\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @Unsafe_IoFunction_of_String_Buffer_case01_Bad_01(i8* noundef %userinput) #0 !dbg !9 {
entry:
  %userinput.addr = alloca i8*, align 8
  %cmd = alloca [20 x i8], align 16
  store i8* %userinput, i8** %userinput.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %userinput.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata [20 x i8]* %cmd, metadata !18, metadata !DIExpression()), !dbg !22
  %0 = bitcast [20 x i8]* %cmd to i8*, !dbg !22
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 getelementptr inbounds ([20 x i8], [20 x i8]* @__const.Unsafe_IoFunction_of_String_Buffer_case01_Bad_01.cmd, i32 0, i32 0), i64 20, i1 false), !dbg !22
  %arraydecay = getelementptr inbounds [20 x i8], [20 x i8]* %cmd, i64 0, i64 0, !dbg !23
  %1 = load i8*, i8** %userinput.addr, align 8, !dbg !23
  %call = call i8* @__strcat_chk(i8* noundef %arraydecay, i8* noundef %1, i64 noundef 20) #4, !dbg !23
  ret void, !dbg !24
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__strcat_chk(i8* noundef, i8* noundef, i64 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !25 {
entry:
  %userinput = alloca [10 x i8], align 1
  call void @llvm.dbg.declare(metadata [10 x i8]* %userinput, metadata !29, metadata !DIExpression()), !dbg !33
  %0 = bitcast [10 x i8]* %userinput to i8*, !dbg !33
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([10 x i8], [10 x i8]* @__const.main.userinput, i32 0, i32 0), i64 10, i1 false), !dbg !33
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %userinput, i64 0, i64 0, !dbg !34
  call void @Unsafe_IoFunction_of_String_Buffer_case01_Bad_01(i8* noundef %arraydecay), !dbg !35
  ret i32 0, !dbg !36
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/function/Unsafe_IoFunction_of_String_Buffer_BadCase01-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "Unsafe_IoFunction_of_String_Buffer_case01_Bad_01", scope: !10, file: !10, line: 8, type: !11, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!10 = !DIFile(filename: "function/Unsafe_IoFunction_of_String_Buffer_BadCase01-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!15 = !{}
!16 = !DILocalVariable(name: "userinput", arg: 1, scope: !9, file: !10, line: 8, type: !13)
!17 = !DILocation(line: 8, column: 61, scope: !9)
!18 = !DILocalVariable(name: "cmd", scope: !9, file: !10, line: 10, type: !19)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 160, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 20)
!22 = !DILocation(line: 10, column: 7, scope: !9)
!23 = !DILocation(line: 12, column: 2, scope: !9)
!24 = !DILocation(line: 13, column: 1, scope: !9)
!25 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 15, type: !26, scopeLine: 15, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!26 = !DISubroutineType(types: !27)
!27 = !{!28}
!28 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!29 = !DILocalVariable(name: "userinput", scope: !25, file: !10, line: 16, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 80, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 10)
!33 = !DILocation(line: 16, column: 10, scope: !25)
!34 = !DILocation(line: 17, column: 54, scope: !25)
!35 = !DILocation(line: 17, column: 5, scope: !25)
!36 = !DILocation(line: 18, column: 1, scope: !25)
