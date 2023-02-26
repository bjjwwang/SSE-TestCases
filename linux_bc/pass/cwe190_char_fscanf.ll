; ModuleID = 'linux_bc/pass/cwe190_char_fscanf.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/cwe190_char_fscanf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [3 x i8] c"%c\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %data = alloca i8, align 1
  %result = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i8* %data, metadata !14, metadata !DIExpression()), !dbg !16
  store i8 32, i8* %data, align 1, !dbg !17
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !18
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %data), !dbg !19
  call void @llvm.dbg.declare(metadata i8* %result, metadata !20, metadata !DIExpression()), !dbg !21
  %1 = load i8, i8* %data, align 1, !dbg !22
  %conv = sext i8 %1 to i32, !dbg !22
  %add = add nsw i32 %conv, 1, !dbg !23
  %conv1 = trunc i32 %add to i8, !dbg !22
  store i8 %conv1, i8* %result, align 1, !dbg !21
  %2 = load i8, i8* %result, align 1, !dbg !24
  %conv2 = sext i8 %2 to i32, !dbg !24
  %cmp = icmp sle i32 %conv2, 255, !dbg !25
  call void @svf_assert(i1 zeroext %cmp), !dbg !26
  ret i32 0, !dbg !27
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

declare dso_local void @svf_assert(i1 zeroext) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/cwe190_char_fscanf.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 8, type: !11, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/cwe190_char_fscanf.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 9, type: !15)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !DILocation(line: 9, column: 10, scope: !9)
!17 = !DILocation(line: 10, column: 10, scope: !9)
!18 = !DILocation(line: 12, column: 12, scope: !9)
!19 = !DILocation(line: 12, column: 5, scope: !9)
!20 = !DILocalVariable(name: "result", scope: !9, file: !10, line: 14, type: !15)
!21 = !DILocation(line: 14, column: 10, scope: !9)
!22 = !DILocation(line: 14, column: 19, scope: !9)
!23 = !DILocation(line: 14, column: 24, scope: !9)
!24 = !DILocation(line: 15, column: 16, scope: !9)
!25 = !DILocation(line: 15, column: 23, scope: !9)
!26 = !DILocation(line: 15, column: 5, scope: !9)
!27 = !DILocation(line: 16, column: 1, scope: !9)
